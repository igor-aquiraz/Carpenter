
--obstaculos
obstaculoCone = display.newImage( "images/obstaculoCone.png", display.contentWidth, display.contentHeight - 30)
blocks:insert(obstaculoCone)

function updateObstaculos()
	local tDelta = velocidade
	local xOffset = ( 0.1*tDelta )

	obstaculoCone.x = obstaculoCone.x - xOffset/2.0
	if (obstaculoCone.x < -display.contentWidth) then
		obstaculoCone:translate(obstaculoCone.x + display.contentWidth, 0)
		obstaculoCone.x = display.contentWidth
	end
end

function resetObstaculos()
	obstaculoCone.x = display.contentHeight - 30 
end