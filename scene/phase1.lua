local composer = require( "composer" )
local scene = composer.newScene()

--Esconde StatusBar
display.setStatusBar( display.HiddenStatusBar )
local tPrevious = system.getTimer()
--Cria Group
local worldGroup = display.newGroup()
-- Default to top-left anchor point for new objects
display.setDefault( "anchorX", 0.0 )
display.setDefault( "anchorY", 0.0 )

-- Create a container for the entire scene
local sceneContainer = display.newContainer( worldGroup, 480, 320 )
sceneContainer.x, sceneContainer.y = 0,0
sceneContainer.anchorChildren = false

-- Cria background e objetos
local background = display.newImage( sceneContainer, "images/background.png", 0, 0 )
local nuvens = display.newImage( sceneContainer, "images/Nuvens.png", 0, -35 )
local nuvens2 = display.newImage( sceneContainer, "images/Nuvens.png", display.contentWidth, -35 )
local morro1 = display.newImage( sceneContainer, "images/morro1.png", 0, 155 )
local morro2 = display.newImage( sceneContainer, "images/morro2.png", display.contentWidth, 140 ) 
local calcada = display.newImage( sceneContainer, "images/calcada.png", 0, 175 )
local trator = display.newImage( sceneContainer, "images/trator.png", 480, 90 )
local caminhao = display.newImage( sceneContainer, "images/caminhao.png", 1200, 80 )

--obstaculos
local obstaculoCone = display.newImage( sceneContainer, "images/obstaculoCone.png", display.contentWidth, display.contentHeight - 50)

--botoes
local BotaoAbaixar = display.newImage( sceneContainer, "images/buttonAbaixar.png", display.contentWidth -100, display.contentHeight - 35 )
local BotaoPular   = display.newImage( sceneContainer, "images/buttonPular.png", display.contentWidth -100, display.contentHeight - 70 )
local BotaoAbaixar = display.newImage( sceneContainer, "images/buttonBater.png", display.contentWidth -60, display.contentHeight - 60 )


-- Set up horse image sheet and sprite instance
local options = {
	frames = require( "uma" ).frames,
}
local umaSheet = graphics.newImageSheet( "images/spriteCarpenter.png", options )
local spriteOptions = { name="uma", start=1, count=6, time=480 }
local spriteInstance = display.newSprite( sceneContainer, umaSheet, spriteOptions )
spriteInstance.anchorX = 1
spriteInstance.anchorY = 1
spriteInstance.x = 100
spriteInstance.y = 300

--Criar limites para pulos
local limiteInicial = display.newRect(0,spriteInstance.y,display.contentWidth,0)
local limiteFinal   = display.newRect(0,spriteInstance.y - 210,display.contentWidth,0)

--Criar a Fisica
local physics = require("physics")
physics.start()
physics.setGravity(0, 9.8)
physics.addBody(spriteInstance, {bounce, 0})
physics.addBody(limiteInicial, "static")
physics.addBody(limiteFinal, "static")
--Adiciona fisica nos obstáculos
physics.addBody(obstaculoCone, "static")


function Pular(event)
	if (event.phase == "began") then
		spriteInstance:setLinearVelocity(0, -280)
		--spriteInstance.xScale, spriteInstance.yScale = spriteInstance.xScale * 0.95, spriteInstance.yScale * 0.95
	end
end

BotaoPular:addEventListener("touch", Pular)

-- Frame (runtime) listener to move objects
local function move( event )
	-- Move scene objects
	local tDelta = event.time - tPrevious
	tPrevious = event.time
	local xOffset = ( 0.1*tDelta )


 --[[   trator.x = trator.x - xOffset/1.4 
	if trator.x < -480 then
		trator:translate(480*4, 0)
	end
	
    caminhao.x = caminhao.x - xOffset/1.4
	if caminhao.x < -1200 then
		caminhao:translate(trator.x + 1000*2, 0)
	end
	]]--


	nuvens.x = nuvens.x - xOffset/2.5
	if nuvens.x < -display.contentWidth then
		nuvens:translate(nuvens.x + display.contentWidth, 0)
		nuvens.x = display.contentWidth
	end

	nuvens2.x = nuvens2.x - xOffset/2.5
	if nuvens2.x < -display.contentWidth then
		nuvens2:translate(nuvens.x + display.contentWidth, 0)
		nuvens2.x = display.contentWidth
	end

    morro1.x = morro1.x - xOffset/2.5
	if morro1.x < -display.contentWidth then
		morro1:translate(morro1.x + display.contentWidth, 0)
		morro1.x = display.contentWidth
	end

	 morro2.x = morro2.x - xOffset/2.5
	if morro2.x < -display.contentWidth then
		morro2:translate(morro2.x + display.contentWidth, 0)
		morro2.x = display.contentWidth
	end

	--Obstáculos
	obstaculoCone.x = obstaculoCone.x - xOffset/1.0
	if obstaculoCone.x < -display.contentWidth then
		obstaculoCone:translate(obstaculoCone.x + display.contentWidth, 0)
		obstaculoCone.x = display.contentWidth
	end


end

-- Start horse animation
spriteInstance:play()

Runtime:addEventListener( "enterFrame", move )

return scene