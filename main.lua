local paint = require("paint")
local FPS = 59.94

local function ground()
	paint.apply(0.3, 0.8, 0.3)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 50, love.graphics.getWidth(), 50)
end

function love.load()
	rect = {}
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
	end
	if love.keyboard.isDown("w") then
		rect.y = rect.y - rect.height / 2
	end
	if love.keyboard.isDown("a") then
		rect.velocity = rect.velocity + 0.1
	end
	if love.keyboard.isDown("d") then
		rect.velocity = rect.velocity - 0.1
	end
	if love.keyboard.isDown("right") then
		rect.x = rect.x + rect.velocity * delta * FPS
	elseif love.keyboard.isDown("left") then
		rect.x = rect.x - rect.velocity * delta * FPS
	end
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		rect.x = x
		rect.y = y
	end
end

function love.draw()
	love.graphics.print(("velocity %.2f"):format(rect.velocity), 20, 20)
	paint.apply(0.8, 0.2, 0.2)
	love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
	ground()
end
