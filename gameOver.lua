local composer = require( "composer" )
local scene = composer.newScene()

gameOver = display.newImage("images/gameOver.jpg")
gameOver.name = "gameOver"
gameOver.x = 0
gameOver.y = screenYheight * 2 

function endGame()
	velocidade = 0
	gameOver.x = 500
	gameOver.y = 250
	gameOver.width = 900
	gameOver.height = 600
	carpenter:setSequence("pular")
	carpenter:pause()
	audio.stop(2)
	audio.stop(3)
end

function restartGame()
	gameOver.x = 0
	gameOver.y = screenYheight * 2
	
	resetScore()
	resetVelocidade()
	resetarCarpenter()
	resetObstaculos()
	resetBackgrounds()
	resetarCrianca()
end
return scene