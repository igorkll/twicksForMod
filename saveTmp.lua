local su = require("superUtiles")
local fs = require("filesystem")
local computer = require("computer")
local component = require("component")

-------------------------------------------------

local on = ...

-------------------------------------------------

if on then
    su.saveFile("/free/twicks/afterBoot1/tmpSaver", [[
        local fs = require("filesystem")
        local computer = require("computer")
        local component = require("component")

        fs.mount(component.proxy(computer.tmpAddress()), "/free/realTmp")
        fs.umount("/tmp")
        fs.makeDirectory("/tmp")

        fs.copy("/free/realTmp", "/tmp")
    ]])
else
    fs.mount(component.proxy(computer.tmpAddress()), "/free/realTmp")
    for file in fs.list("/free/realTmp") do
        local full_path = fs.concat("/free/realTmp", file)
        fs.remove(full_path)
    end
    fs.copy("/tmp", "/free/realTmp")
    fs.remove("/free/twicks/afterBoot1/tmpSaver")
end