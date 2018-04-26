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

-- Create "background" scene objects
local background = display.newImage( sceneContainer, "images/background.png", 0, 0 )
local nuvens = display.newImage( sceneContainer, "images/Nuvens.png", 0, -35 )
local morro2 = display.newImage( sceneContainer, "images/morro2.png", 480, 140 ) 
local morro1 = display.newImage( sceneContainer, "images/morro1.png", 0, 155 )
local calcada = display.newImage( sceneContainer, "images/calcada.png", 0, 175 )
local trator = display.newImage( sceneContainer, "images/trator.png", 480, 90 )
local caminhao = display.newImage( sceneContainer, "images/caminhao.png", 1200, 80 )

-- Set up horse image sheet and sprite instance
local options = {
	frames = require( "uma" ).frames,
}
local umaSheet = graphics.newImageSheet( "images/uma.png", options )
local spriteOptions = { name="uma", start=1, count=8, time=1000 }
local spriteInstance = display.newSprite( sceneContainer, umaSheet, spriteOptions )
spriteInstance.anchorX = 1
spriteInstance.anchorY = 1
spriteInstance.x = 460
spriteInstance.y = 260

--Criar limites para pulos
local limiteInicial = display.newRect(0,spriteInstance.y,display.contentWidth,0)
local limiteFinal   = display.newRect(0,spriteInstance.y - 220,display.contentWidth,0)

--Criar a Fisica
local physics = require("physics")
physics.start()
physics.setGravity(0, 9.8)
physics.addBody(spriteInstance, {bounce, 0})
physics.addBody(limiteInicial, "static")
physics.addBody(limiteFinal, "static")

function moverPersonagem(event)
	if (event.phase == "began") then
		spriteInstance:setLinearVelocity(0, -200)
		--spriteInstance.xScale, spriteInstance.yScale = spriteInstance.xScale * 0.95, spriteInstance.yScale * 0.95
	end
end

spriteInstance:addEventListener("touch", moverPersonagem)

-- Frame (runtime) listener to move objects
local function move( event )
	-- Move scene objects
	local tDelta = event.time - tPrevious
	tPrevious = event.time
	local xOffset = ( 0.1*tDelta )

    trator.x = trator.x - xOffset/1.4 
	if trator.x < -480 then
		trator:translate(480*4, 0)
	end
	
    caminhao.x = caminhao.x - xOffset/1.4
	if caminhao.x < -1200 then
		caminhao:translate(trator.x + 1000*2, 0)
	end

end

-- Start horse animation
spriteInstance:play()

Runtime:addEventListener( "enterFrame", move )

return scene