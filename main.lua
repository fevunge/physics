local paint = require("paint")
local FPS = 59.94

local function ground()
	paint.apply(0.3, 0.8, 0.3)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 50, love.graphics.getWidth(), 50)
end

function love.load()
	rect = {}
	rect.energy = 2000
	rect.x = 100
	rect.y = 0
	rect.width = 50
	rect.height = 50
	rect.velocity = 0
	object = {}
	love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
end

function love.update(delta)
	if rect.x > love.graphics.getWidth() then
		rect.x = -rect.width
	end
	if (rect.y + rect.height) < love.graphics.getHeight() - 50 then
		rect.y = rect.y + (9.8 * delta * FPS)
	elseif love.keyboard.isDown("w") then
		if rect.energy > 500 then
			print("jump")
			rect.y = rect.y - rect.height * (rect.energy / 500)
			if rect.energy > 55 then
				rect.energy = rect.energy - 55
			else
				rect.energy = 0
			end
		end
	end
	if love.keyboard.isDown("right") then
		rect.x = rect.x + (rect.velocity * (rect.energy / 1000)) * delta * FPS
		if rect.energy > 5 then
			rect.energy = rect.energy - (5 + (rect.velocity / 100))
		else
			rect.energy = 0
		end
	elseif love.keyboard.isDown("left") then
		rect.x = rect.x - (rect.velocity * (rect.energy / 1000)) * delta * FPS
		if rect.energy > 5 then
			rect.energy = rect.energy - (5 + (rect.velocity / 100))
		else
			rect.energy = 0
		end
	end
	if love.keyboard.isDown("a") then
		if rect.velocity < 500 then
			rect.velocity = rect.velocity + 0.1
		end
	end
	if love.keyboard.isDown("d") then
		if rect.velocity > 0 then
			rect.velocity = rect.velocity - 0.1
		end
	end
	rect.energy = rect.energy + 2.5
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		rect.x = x
		rect.y = y
	end
end

function love.draw()
	love.graphics.print(("velocity %.2f px/s"):format(rect.velocity), 20, 20)
	love.graphics.print(("energy %.2f J"):format(rect.energy), 20, 40)
	paint.apply(0.8, 0.2, 0.2)
	love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
	ground()
end
