local composer = require( "composer" )

local scene = composer.newScene()

local function gotoMenu()
	composer.gotoScene( "scene.menu" )
end

function scene:create( event )
	--Imagem Creditos
	local creditos = display.newImage("images/creditos.png", display.contentWidth, display.contentHeight )
	creditos.x = display.contentCenterX
	creditos.y = display.contentCenterY

	local voltarButton = display.newImage("images/voltar.png", 1000, 900 ) 
	voltarButton.width  = 520
	voltarButton.height = 168

	voltarButton:addEventListener( "tap", gotoMenu )
end

scene:addEventListener( "create", scene )

return scene