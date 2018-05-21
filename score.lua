-- Creating Scoreboard
score = 0
scoreText = display.newText("Score", 0, 0, "Fixedsys", 90)
scoreText.anchorX, scoreText.anchorY = 0, 0
scoreText.x, scoreText.y = 20, 35

function updateScore()
	score = score + 1
	scoreText.text = "Score: " .. score
	scoreText.anchorX, scoreText.anchorY = 0, 0
	scoreText.x, scoreText.y = 20, 35
end

function resetScore()
	score = 0
	scoreText.text = "Score: " .. score
end