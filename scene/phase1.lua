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

require("carpenter")

--obstaculos
local obstaculoCone = display.newImage( sceneContainer, "images/obstaculoCone.png", display.contentWidth, display.contentHeight - 50)

--botoes
local BotaoBater = display.newImage( sceneContainer, "images/buttonBater.png", display.contentWidth -60, display.contentHeight - 60 )


return scene