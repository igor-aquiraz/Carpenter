local composer = require( "composer" )
local scene = composer.newScene()
--Esconde StatusBar
display.setStatusBar( display.HiddenStatusBar )

local tPrevious = system.getTimer()

require("velocidade")
require("background")
require("score")
require("carpenter")

local function update( event )
	if carpenter.estaVivo then
		updateBackgrounds()
		updateScore()
		--updateCharacter()
	else
		--endGame()
	end
end

function touched( event )
	if carpenter.estaVivo then
		if(event.phase == "began") then
			carpenter.accel = carpenter.accel + 20
			--speed = baseSpeed
		end
	end
end

timer.performWithDelay(1, update, -1)
Runtime:addEventListener("touch", touched, -1)
return scene