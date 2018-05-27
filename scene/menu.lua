local composer = require( "composer" )

local scene = composer.newScene()

local musicTrack
musicTrack = audio.loadStream( "audio/Doh_De_Oh.mp3")


local function gotoPhases()
	audio.stop(1)
	composer.gotoScene( "scene.phase1" )
end

local function gotoCredits()
	composer.gotoScene( "scene.credits" )
end

local function gotoExit()
	--composer.gotoScene( "exit" )
end


-- create()
function scene:create( event )

	local sceneGroup = self.view

	--Imagem Menu
	local background = display.newImageRect( sceneGroup, "images/menu.jpg", display.contentWidth, display.contentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	--Butão Play
	local playButton    = display.newImage("images/playButton.png", 950, 550)
	playButton.width  = 520
	playButton.height = 168

	--Botão Créditos
	local creditsButton = display.newImage("images/creditosButton.png", 950, 730 )
	creditsButton.width  = 520
	creditsButton.height = 168

	--Botão Sair
	local exitButton    = display.newImage("images/sairButton.png", 950, 920 )
	exitButton.width  = 520
	exitButton.height = 168

	playButton:addEventListener( "tap", gotoPhases )
	creditsButton:addEventListener( "tap", gotoCredits )
	--exitButton:addEventListener( "tap", gotoExit )	
	audio.play( musicTrack, { channel=1, loops=-1 } )	
end

-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then

	elseif ( phase == "did" ) then

	end
end

-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
	end
end

-- destroy()
function scene:destroy( event )
	local sceneGroup = self.view
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
