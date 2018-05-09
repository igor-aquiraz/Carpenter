local composer = require( "composer" )
local scene = composer.newScene()
--Esconde StatusBar
display.setStatusBar( display.HiddenStatusBar )

function scene:create(event)

	local sceneGroup = self.view
	-- Variáveis
	screenXwidth = display.contentWidth
	screenXcenter = screenXwidth/2
	screenYheight = display.contentHeight
	screenYcenter = screenYheight/2

	inEvent = 0
	eventRun = 0

	-- Groups
	blocks = display.newGroup()
	personagens = display.newGroup()
	tela = display.newGroup()


	require("score")
	require("obstaculos")
	require("background")
	require("collisions")
	--require("events")
	require("carpenter")
	require("gameOver")	
	require("velocidade")


	tela:insert(background)
	tela:insert(nuvens)
	tela:insert(nuvens2)
	tela:insert(morro1)
	tela:insert(morro2)
	tela:insert(calcada)
	tela:insert(blocks)
	tela:insert(carpenter)
	tela:insert(collisionRect)
	tela:insert(scoreText)
	--tela:insert(limiteInicial)
	--tela:insert(gameOver)

	local function update( event )
		if carpenter.estaVivo then
			checkCollisions()
			updateVelocidade()
			updateBackgrounds()
			updateScore()
			--updateObstaculos()
			updateCarpenter()
		else
			endGame()
		end
	end

	function touched( event )
		if carpenter.estaVivo then
			if(event.phase == "began") then
				if (carpenter.y == 200) then
					carpenter.accel = 20
				end	
			end
		else
			if (gameOver.x > 0 and gameOver.y < 500) then
				restartGame()
			end	
		end
	end


	function move( event )
		updateObstaculos()
	end

	timer.performWithDelay(1, update, -1)
	Runtime:addEventListener( "enterFrame", move )
	Runtime:addEventListener("touch", touched, -1)
end

scene:addEventListener("create", create)

return scene