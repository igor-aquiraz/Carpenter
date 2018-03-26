
--local composer = require( "composer" ) 

-- Hide status bar
--display.setStatusBar( display.HiddenStatusBar )

-- Go to the menu screen
--composer.gotoScene( "scene.menu" )



--Esconde StatusBar
display.setStatusBar( display.HiddenStatusBar )

local tPrevious = system.getTimer()

--Create Group
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
local areia = display.newImage( sceneContainer, "images/areia.png", 0, 140 )
local nuvem1 = display.newImage( sceneContainer, "images/nuvem1.png", 20, 50 )
local nuvem2 = display.newImage( sceneContainer, "images/nuvem1.png", 100, 10 )
local nuvem3 = display.newImage( sceneContainer, "images/nuvem1.png", 180, 50 )
local nuvem4 = display.newImage( sceneContainer, "images/nuvem2.png", 280, 15 )
local nuvem5 = display.newImage( sceneContainer, "images/nuvem1.png", 400, 50 )
local trator = display.newImage( sceneContainer, "images/trator.png", -300, 90 )
local caminhao = display.newImage( sceneContainer, "images/caminhao.png", trator.x - 1000, 80 )




-- Frame (runtime) listener to move objects
local function move( event )
	-- Move scene objects
	local tDelta = event.time - tPrevious
	tPrevious = event.time
	local xOffset = ( 0.1*tDelta )

	--[[
	nuvem1.x = nuvem1.x + xOffset*0.5
	nuvem2.x = nuvem2.x + xOffset*0.5
	nuvem3.x = nuvem3.x + xOffset*0.5
	nuvem4.x = nuvem4.x + xOffset*0.5
	nuvem5.x = nuvem5.x + xOffset*0.5
	--]]

	trator.x = trator.x + xOffset*1.5 
	caminhao.x = caminhao.x + xOffset*1.5 

	if trator.x > 480 + trator.width/2 then
		trator:translate( -480*4, 0 )
	end

	if caminhao.x > 480 + caminhao.width/2 then
		caminhao:translate( -480*4, 0 )
	end

end

Runtime:addEventListener( "enterFrame", move )



