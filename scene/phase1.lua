local composer = require( "composer" )
local scene = composer.newScene()
--Esconde StatusBar
display.setStatusBar( display.HiddenStatusBar )
local musicTrack
musicTrack = audio.loadStream( "audio/Snack_Time.mp3")

local musicColusion
musicColusion = audio.loadStream( "audio/Dress_Shoe_Run_on_Concrete.mp3")

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
	require("crianca")
	require("obstaculos")
	require("background")
	require("collisions")
	require("carpenter")
	require("gameOver")	
	require("velocidade")

	--background
	tela:insert(fundo)
	tela:insert(nuvens)
	tela:insert(nuvens2)
	tela:insert(campo)
	tela:insert(campo2)
	tela:insert(pista)
	tela:insert(pista2)

	--obstáculos
	tela:insert(crianca)
	tela:insert(blocks)
	tela:insert(carpenter)

	tela:insert(collisionRect)
	tela:insert(scoreText)
	tela:insert(gameOver)

	local function update( event )
		if carpenter.estaVivo then
			checkCollisions()
			updateVelocidade()
			updateBackgrounds()
			updateScore()
			updateCarpenter()
		else
			endGame()
		end
	end

	function touched( event )
		if carpenter.estaVivo then
			if(event.phase == "began") then
				if event.x > carpenter.x then
					carpenter.bater = false
					if (carpenter.y == 750 or (carpenter.y > 750 and carpenter.y < 770)) then
						carpenter.accel = 35
					end	
				else
					carpenter.bater = true
				end
			end
		else
			if (gameOver.x > 0 and gameOver.y < 500) then
				restartGame()
				audio.play( musicTrack, { channel=2, loops=-1 } )
				audio.play( musicColusion, { channel=3, loops=-1 } )
			end	
		end
	end


	function move( event )
		updateObstaculos()
	end

	timer.performWithDelay(1, update, -1)
	Runtime:addEventListener( "enterFrame", move )
	Runtime:addEventListener("touch", touched, -1)
	audio.play( musicTrack, { channel=2, loops=-1 } )	
	audio.play( musicColusion, { channel=3, loops=-1 } )
end

scene:addEventListener("create", create)

return scene