
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
local obstaculo = display.newImage( sceneContainer, "images/obstaculo.png", 160, 230 )
local obstaculo1 = display.newImage( sceneContainer, "images/obstaculo1.png", 0, 250 )


-- Frame (runtime) listener to move objects
local function move( event )
	-- Move scene objects
	local tDelta = event.time - tPrevious
	tPrevious = event.time
	local xOffset = ( 0.1*tDelta )	

	obstaculo.x = obstaculo.x + xOffset*1.5
	obstaculo1.x = obstaculo1.x + xOffset*1.5

	if obstaculo.x > 480 + obstaculo.width/2 then
		obstaculo:translate( -480*4, 0 )
	end	

	if obstaculo1.x > 480 + obstaculo1.width/2 then
		obstaculo1:translate( -600*4, 0 )
	end		
end

Runtime:addEventListener( "enterFrame", move )

