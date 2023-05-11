require("iuplua")
require("iupluaimglib")
require("cdlua")
require("iupluacd")

LGL = require("lua-gl")

local cnvobj = LGL.new{ grid_x = 40, grid_y = 40, width = 600, height = 300, gridVisibility = true }

local iup = nil

local dlg = iup.dialog{ 
    iup.vbox{
        iup.label{title = "----------------Canvas---------------"},
        cnvobj.cnv,
    },
    title = "lua-gl",
}
dlg:showxy(iup.CENTER , iup.CENTER)

if iup.MainLoopLevel() == 0 then
   iup.MainLoop()
   iup.Close()
end 