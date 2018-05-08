local worldGroup = display.newGroup()
-- Default to top-left anchor point for new objects
display.setDefault( "anchorX", 0.0 )
display.setDefault( "anchorY", 0.0 )
-- Create a container for the entire scene
local sceneContainer = display.newContainer( worldGroup, 480, 320 )
sceneContainer.x, sceneContainer.y = 0,0
sceneContainer.anchorChildren = false


--Criar os Backgrounds
background = display.newImage( sceneContainer, "images/background.png", 0, 0 )
nuvens     = display.newImage( sceneContainer, "images/Nuvens.png", 0, -35 )
nuvens2    = display.newImage( sceneContainer, "images/Nuvens.png", display.contentWidth, -35 )
morro1     = display.newImage( sceneContainer, "images/morro1.png", 0, 155 )
morro2     = display.newImage( sceneContainer, "images/morro2.png", display.contentWidth, 140 ) 
calcada    = display.newImage( sceneContainer, "images/calcada.png", 0, 175 )
