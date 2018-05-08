local worldGroup = display.newGroup()
-- Default to top-left anchor point for new objects
display.setDefault( "anchorX", 0.0 )
display.setDefault( "anchorY", 0.0 )
-- Create a container for the entire scene
local sceneContainer = display.newContainer( worldGroup, 480, 320 )
sceneContainer.x, sceneContainer.y = 0,0
sceneContainer.anchorChildren = false

--Criar os Backgrounds
background = display.newImage("images/background.png", 0, 0 )
nuvens     = display.newImage("images/Nuvens.png", 0, -35 )
nuvens2    = display.newImage("images/Nuvens.png", display.contentWidth, -35 )
morro1     = display.newImage("images/morro1.png", 0, 155 )
morro2     = display.newImage("images/morro2.png", display.contentWidth, 140 ) 
calcada    = display.newImage("images/calcada.png", 0, 175 )

function updateBackgrounds()

	nuvens.x = nuvens.x - (velocidade/55)
	if nuvens.x < -display.contentWidth then
		nuvens.x = display.contentWidth
	end

	nuvens2.x = nuvens2.x - (velocidade/55)
	if nuvens2.x < -display.contentWidth then
		nuvens2.x = display.contentWidth
	end

    morro1.x = morro1.x - (velocidade/55)
	if morro1.x < -display.contentWidth then
		morro1.x = display.contentWidth
	end

	 morro2.x = morro2.x - (velocidade/55)
	if morro2.x < -display.contentWidth then
		morro2.x = display.contentWidth
	end
end

function resetBackgrounds()
	background.x = 0 
	background.y = 0

	nuvens.x = 0
	nuvens.y = -35

	nuvens.x = display.contentWidth
	nuvens.y = -35

	morro1.x = 0
	morro1.y = 155

	morro2.x = display.contentWidth
	morro2.y = 140	

	calcada.x = 0
	calcada.y = 175
end
