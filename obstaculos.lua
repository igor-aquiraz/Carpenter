obstaculoBarro = display.newImage( "images/barro.png", 2200, 900)
obstaculoBarro.width  = 300
obstaculoBarro.height = 200
blocks:insert(obstaculoBarro)

obstaculoCavalete = display.newImage( "images/cavalete.png", 2200, 900)
obstaculoCavalete.width = 155
obstaculoCavalete.height = 170
blocks:insert(obstaculoCavalete)

obstaculoCanos = display.newImage( "images/canos.png", 2200, 900)
obstaculoCanos.width = 230
obstaculoCanos.height = 220
blocks:insert(obstaculoCanos)

contador = 0
check = math.random(3)
aux = -1 

function updateObstaculos()
	local tDelta = velocidade
	local xOffset = ( 0.1*tDelta )

	contador = contador + 1
	if (contador > 10) then
		blocks[check].x = blocks[check].x - xOffset/2.0
		if (blocks[check].x < 900) then
			contador = 0
			aux = check
			check = math.random(3)	
		end
	end

	if aux > -1 then
		blocks[aux].x = blocks[aux].x - xOffset/2.0
		if (blocks[aux].x < -5) then
			blocks[aux].x = 2200
			blocks[aux].animando = False
			aux = -1
		end 
	end
end

function resetObstaculos()
contador = 0
check = math.random(3)
aux = -1 

obstaculoBarro.x = 2200
obstaculoBarro.y = 900

obstaculoCavalete.x = 2200
obstaculoCavalete.y = 900

obstaculoCanos.x = 2200
obstaculoCanos.y = 900
end