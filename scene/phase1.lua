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
	screenYcenter = screenYheight/2-20

	inEvent = 0
	eventRun = 0

	-- Groups
	blocks = display.newGroup()
	personagens = display.newGroup()
	tela = display.newGroup()


	require("score")
	--require("chao")
	require("background")
	--require("collisions")
	--require("events")
	require("carpenter")
	--require("game_over")	
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
			updateVelocidade()
			updateBackgrounds()
			updateScore()
			--updateBlocks()
			updateCarpenter()
		else
			--endGame()
		end
	end

	function touched( event )
		if carpenter.estaVivo then
			if(event.phase == "began") then
				if (carpenter.y == 200) then
					carpenter.accel = 20
				end	
			end
		end
	end

	timer.performWithDelay(1, update, -1)
	Runtime:addEventListener("touch", touched, -1)
end

scene:addEventListener("create", create)

return scene