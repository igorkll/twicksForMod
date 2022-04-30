local su = require("superUtiles")
local fs = require("filesystem")

-------------------------------------------------

local on = ...

-------------------------------------------------

if on then
    su.saveFile("/free/twicks/mem/aaa_beeper", [[
        computer.beep(2000, 0.5)
        computer.beep(1500, 0.2)
        computer.beep(1000, 0.1)
    ]])
else
    fs.remove("/free/twicks/mem/aaa_beeper")
end