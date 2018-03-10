local composer = require( "composer" )

local scene = composer.newScene()


local function gotoPhases()
	composer.gotoScene( "scene.phases" )
end

local function gotoHighScores()
	composer.gotoScene( "scene.highscores" )
end

local function gotoCredits()
	composer.gotoScene( "scene.credits" )
end

local function gotoOptions()
	composer.gotoScene( "scene.options" )
end

local function gotoExit()
	composer.gotoScene( "exit" )
end


-- create()
function scene:create( event )

	local sceneGroup = self.view

	local background = display.newImageRect( sceneGroup, "images/menu.jpg", 480, 320 )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local title = display.newImageRect( sceneGroup, "images/OpcoesMenu.png", 270, 280 )
	title.x = display.contentCenterX + 100
	title.y = 70

	local playButton = display.newText( sceneGroup, "Play", display.contentCenterX + 100, 35, native.systemFont, 30 )
	playButton:setFillColor( 1, 1, 1 )

	local highScoresButton = display.newText( sceneGroup, "High Scores", display.contentCenterX + 100, 70, native.systemFont, 30 )
	highScoresButton:setFillColor( 1, 1, 1 )

	local creditsButton = display.newText( sceneGroup, "Credits", display.contentCenterX + 100, 110, native.systemFont, 30 )
	creditsButton:setFillColor( 1, 1, 1 )	

	local optionsButton = display.newText( sceneGroup, "Options", display.contentCenterX + 100, 148, native.systemFont, 30 )
	optionsButton:setFillColor( 1, 1, 1 )	

	local exitButton = display.newText( sceneGroup, "Exit", display.contentCenterX + 100, 185, native.systemFont, 30 )
	creditsButton:setFillColor( 1, 1, 1 )			

	playButton:addEventListener( "tap", gotoPhases )
	highScoresButton:addEventListener( "tap", gotoHighScores )
	creditsButton:addEventListener( "tap", gotoCredits )
	optionsButton:addEventListener( "tap", gotoOptions )
	exitButton:addEventListener( "tap", gotoExit )		
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
