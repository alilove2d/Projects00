player = {}
comp = {}

cw = 800
ch = 600
printx = 0
printy = 0

function love.load()
--load once at launch
	love.window.setMode(cw, ch, {resizable=false,vsync=false})
	love.window.setTitle('DiCE')
	love.graphics.setBackgroundColor(1,1,0)
	math.randomseed(os.time())

	player.name = "You"
	comp.name = "Computer"
	player.img = love.graphics.newImage('img/d0.png')
	comp.img = love.graphics.newImage('img/d0.png')
	font = love.graphics.setNewFont("font/orbitron-bold-webfont.ttf", 48)

	start = true
end

function love.draw()
--main loop
	love.graphics.setColor(1,1,1)
	if start == false then
		if player.roll > comp.roll then
			love.graphics.setColor(0.2,1,0.2)
			love.graphics.printf("player wins!", 0, ch-76, cw, 'center')
			love.graphics.setColor(1,1,1)
		elseif player.roll < comp.roll then
			love.graphics.setColor(1,0.2,0.2)
			love.graphics.printf("Computer wins!", 0, ch-76, cw, 'center')
			love.graphics.setColor(1,1,1)
		else
			love.graphics.setColor(1,0.2,0.2)
			love.graphics.printf("Tie!", 0, ch-76, cw, 'center')
			love.graphics.setColor(1,1,1)

	end
	else
	-- start message
		love.graphics.printf("Click to roll", 0, ch-76, cw, 'center')
	end
-- which dice display represents the player depending on which side of the screen the player clicks to roll
	if printx < cw*0.5 then
		love.graphics.draw(player.img, 100, 200, 0, 0.2, 0.2)
		love.graphics.draw(comp.img, cw*0.6, 200, 0, 0.2, 0.2)

		love.graphics.setColor(1,1,1)
		love.graphics.printf("Player", 0, 30, 300, 'center')
		love.graphics.setColor(1,1,1)

		love.graphics.setColor(1,1,1)
		love.graphics.printf("Computer", 0, 30, 1000, 'center')
		love.graphics.setColor(1,1,1)
	elseif printx > cw*0.5 then
		love.graphics.draw(comp.img, 100, 200, 0, 0.2, 0.2)
		love.graphics.draw(player.img, cw*0.6, 200, 0, 0.2, 0.2)

		love.graphics.setColor(1,1,1)
		love.graphics.printf("Computer", 0, 30, 300, 'center')
		love.graphics.setColor(1,1,1)

		love.graphics.setColor(1,1,1)
		love.graphics.printf("Player", 0, 30, 1000, 'center')
		love.graphics.setColor(1,1,1)
	end
end

function love.mousereleased(x, y, button)
	printx = x
	printy = y
	
	if button == 1 then
		start = false
		comp.roll = math.random(1,6)
		player.roll = math.random(1,6)
		-- set graphics
		player.img = love.graphics.newImage('img/die'..player.roll..'.png')
		comp.img = love.graphics.newImage('img/comp-die'..comp.roll..'.png')
	elseif button == 2 then
		start = false
		comp.roll = math.random(4,6)
		player.roll = math.random(1,3)
		player.img = love.graphics.newImage('img/die'..player.roll..'.png')
		comp.img = love.graphics.newImage('img/comp-die'..comp.roll..'.png')
	elseif button == 3 then
		start = false
		comp.roll = math.random(1,2)
		player.roll = math.random(3,6)
		player.img = love.graphics.newImage('img/die'..player.roll..'.png')
		comp.img = love.graphics.newImage('img/comp-die'..comp.roll..'.png')
	end
end
