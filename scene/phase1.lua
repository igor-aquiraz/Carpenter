local composer = require( "composer" )
local scene = composer.newScene()
--Esconde StatusBar
display.setStatusBar( display.HiddenStatusBar )

local tPrevious = system.getTimer()
require("background")
require("carpenter")
return scene