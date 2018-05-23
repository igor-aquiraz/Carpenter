
function checkCollisions()
	wasOnGround = onGround
	for a = 1, blocks.numChildren, 1 do
		if(collisionRect.y - 5> blocks[a].y - 300 and blocks[a].x - 100 < collisionRect.x and blocks[a].x + 100 > collisionRect.x) then
			carpenter:setSequence("pular")
			carpenter:play()
			correCrianca()
			carpenter:setSequence("carpenter")
			carpenter:play()
			if (crianca.x > 2000) then
				velocidade = 0
				MatarCarpenter()
			end
			
		end
	end
end