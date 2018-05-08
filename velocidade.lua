baseVelocidade = 80
velocidade = baseVelocidade
ultimavelocidade = velocidade

function updateVelocidade()
	velocidade = velocidade + .004
	ultimavelocidade = velocidade
end

function resetVelocidade()
	velocidade = baseVelocidade
	ultimavelocidade = baseVelocidade
end
