
--obstaculos
obstaculoCone = display.newImage( "images/ObstaculoCone.png", 500, 280)
obstaculoCone.width = 50
obstaculoCone.height = 50
blocks:insert(obstaculoCone)

obstaculoBarro = display.newImage( "images/barro.png", obstaculoCone.x + 250, 270)
obstaculoBarro.width = 90
obstaculoBarro.height = 80
blocks:insert(obstaculoBarro)

obstaculoCavalete = display.newImage( "images/cavalete.png", obstaculoBarro.x + 250, 280)
obstaculoCavalete.width = 60
obstaculoCavalete.height = 70
blocks:insert(obstaculoCavalete)

obstaculoCanos = display.newImage( "images/canos.png", obstaculoCavalete.x + 250, 270)
obstaculoCanos.width = 90
obstaculoCanos.height = 80
blocks:insert(obstaculoCanos)

contador = 0
check = math.random(4)

function updateObstaculos()
	local tDelta = velocidade
	local xOffset = ( 0.1*tDelta )

	contador = contador + 1
	if (contador > 30) then
		blocks[check].x = blocks[check].x - xOffset/2.0
		blocks[check].mover = false
		if (blocks[check].x < -display.contentWidth) then
			blocks[check]:translate(blocks[check].x + display.contentWidth, 0)
			blocks[check].x = 550
		end

		if (blocks[check].x == 550) then
			contador = 0
			check = math.random(4)
		end
	end

	--[[
	obstaculoCone.x = obstaculoCone.x - xOffset/2.0
	if (obstaculoCone.x < -display.contentWidth) then
		obstaculoCone:translate(obstaculoCone.x + display.contentWidth, 0)
		obstaculoCone.x = display.contentWidth
	end

	obstaculoBarro.x = obstaculoBarro.x - xOffset/2.0
	if (obstaculoBarro.x < -display.contentWidth) then
		obstaculoBarro:translate(obstaculoBarro.x + display.contentWidth, 0)
		obstaculoBarro.x = display.contentWidth
	end

	obstaculoCavalete.x = obstaculoCavalete.x - xOffset/2.0
	if (obstaculoCavalete.x < -display.contentWidth) then
		obstaculoCavalete:translate(obstaculoCavalete.x + display.contentWidth, 0)
		obstaculoCavalete.x = display.contentWidth
	end

	obstaculoCanos.x = obstaculoCanos.x - xOffset/2.0
	if (obstaculoCanos.x < -display.contentWidth) then
		obstaculoCanos:translate(obstaculoCanos.x + display.contentWidth, 0)
		obstaculoCanos.x = display.contentWidth
	end
	--]]
end

function resetObstaculos()
obstaculoCone.x = 550 
obstaculoCone.y = 280

obstaculoBarro.x = 550
obstaculoBarro.y = 270

obstaculoCavalete.x = 550
obstaculoCavalete.y = 280

obstaculoCanos.x = 550
obstaculoCanos.y = 270
end