-- importa a biblioteca torch
require 'torch'

-- define o modelo
local function createModel()
    local model = torch.nn.Sequential()
    model:add(torch.nn.Linear(2, 5))
    model:add(torch.nn.ReLU())
    model:add(torch.nn.Linear(5, 1))
    return model
end

-- define a função de treinamento
local function train(model, criterion, inputs, targets, learningRate, maxEpochs)
    -- treina o modelo
    for i = 1, maxEpochs do
        -- define a função de custo como zero
        local loss = 0

        -- faz um batch do treinamento
        for j = 1, inputs:size(1) do
            -- reseta o gradiente
            model:zeroGradParameters()

            -- faz a previsão
            local prediction = model:forward(inputs[j])

            -- calcula a perda
            local err = criterion:forward(prediction, targets[j])
            loss = loss + err

            -- calcula o gradiente
            local gradCriterion = criterion:backward(prediction, targets[j])
            model:backward(inputs[j], gradCriterion)

            -- atualiza os pesos
            model:updateParameters(learningRate)
        end

        -- imprime a perda
        print(string.format("Epoch %d: loss = %.4f", i, loss))
    end
end

-- define os dados de treinamento
local function createData()
    local inputs = torch.Tensor{{0,0}, {0,1}, {1,0}, {1,1}}
    local targets = torch.Tensor{{0}, {1}, {1}, {0}}
    return inputs, targets
end

-- cria o modelo, os dados de treinamento e define a função de perda
local model = createModel()
local inputs, targets = createData()
local criterion = torch.nn.MSECriterion()

-- define os hiperparâmetros do treinamento
local learningRate = 0.1
local maxEpochs = 10000

-- treina o modelo
train(model, criterion, inputs, targets, learningRate, maxEpochs)

-- faz a previsão
print(model:forward(torch.Tensor{0,0}))
print(model:forward(torch.Tensor{0,1}))
print(model:forward(torch.Tensor{1,0}))
print(model:forward(torch.Tensor{1,1}))
