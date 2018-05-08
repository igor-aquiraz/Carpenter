baseVelocidade = 80
velocidade = baseVelocidade
ultimavelocidade = velocidade

function updateSpeed()
	velocidade = velocidade + .004
	ultimavelocidade = velocidade
end

function resetSpeed()
	velocidade = baseVelocidade
	ultimavelocidade = baseVelocidade
end
