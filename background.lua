local worldGroup = display.newGroup()
-- Default to top-left anchor point for new objects
display.setDefault( "anchorX", 0.0 )
display.setDefault( "anchorY", 0.0 )
-- Create a container for the entire scene
local sceneContainer = display.newContainer( worldGroup, 1920, 1080 )
sceneContainer.x, sceneContainer.y = 0,0
sceneContainer.anchorChildren = false

--Criar os Backgrounds
fundo     = display.newImage("images/fundo.png", 0, 0)
nuvens       = display.newImage("images/nuvens.png", 0, 0)
nuvens2      = display.newImage("images/nuvens.png", 4096, 0)

campo     = display.newImage("images/Campo.png", 0, 50 )
campo2    = display.newImage("images/Campo.png", 5740, 50)

pista     = display.newImage("images/Pista.png", 0, 600 )
pista2    = display.newImage("images/Pista.png", 5740, 600 )

function updateBackgrounds()
	nuvens.x = nuvens.x - (velocidade/100)
	if nuvens.x < -4096 then
		nuvens.x = 4096
	end
	nuvens2.x = nuvens2.x - (velocidade/100)
	if nuvens2.x < -4096 then
		nuvens2.x = 4096
	end


	campo.x = campo.x - (velocidade/50)
	if campo.x < -5740 then
		campo.x = 5720
	end
	campo2.x = campo2.x - (velocidade/50)
	if campo2.x < -5740 then
		campo2.x = 5720
	end


	pista.x = pista.x - (velocidade/40)
	if pista.x < -5740 then
		pista.x = 5720
	end
	pista2.x = pista2.x - (velocidade/40)
	if pista2.x < -5740 then
		pista2.x = 5720
	end
end


function resetBackgrounds()
	campo.x = 0
	campo.y = 50
	campo2.x = 5740
	campo2.y = 50 

	nuvens.x = 0
	nuvens.y = 0
	nuvens.x = 4096
	nuvens.y = 0

	pista.x = 0
	pista.y = 600
	pista2.x = 5740
	pista2.y = 600 

end
