function checkCollisions()
	wasOnGround = onGround

	for a = 1, blocks.numChildren, 1 do
		if(collisionRect.y - 5> blocks[a].y - 150 and blocks[a].x - 25 < collisionRect.x and blocks[a].x + 25 > collisionRect.x) then
			velocidade = 0
			MatarCarpenter()
		end
	end


	for a = 1, blocks.numChildren, 1 do
		if(carpenter.y >= blocks[a].y - 170 and blocks[a].x < carpenter.x + 60 and blocks[a].x > carpenter.x - 60) then
			carpenter.y = blocks[a].y - 171
			onGround = true
			break
		else
			onGround = false
		end
	end
end