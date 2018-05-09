-- Creating Game Over
gameOver = display.newImage("images/gameOver.png")
gameOver.name = "gameOver"
gameOver.x = 0
gameOver.y = 500

function endGame()
	velocidade = 0
	gameOver.x = 95
	gameOver.y = 80
	--carpenter:setSequence("jumping")
	carpenter:pause()
	audio.stop(2)
	audio.stop(3)
	-- timer.cancel( event.source )
end

function restartGame()
	--move menu
	gameOver.x = 0
	gameOver.y = screenYheight * 2
	
	resetScore()
	resetVelocidade()
	resetarCarpenter()
	resetObstaculos()
	resetBackgrounds()
	-- timer.performWithDelay(1, update, -1)
end