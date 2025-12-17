local paint = require("paint")
local renderVelocity = 59.94

local function ground()
	paint.apply(0.3, 0.8, 0.3)
	love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 50, love.graphics.getWidth(), 50)
end

function love.load()
	X = 100
	Y = 0
	love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
end

function love.update(delta)
	if X > love.graphics.getWidth() then
		X = -50
	end
	if (Y + 50) < love.graphics.getHeight() - 50 then
		Y = Y + (9.8 * delta * renderVelocity)
	end
	if love.keyboard.isDown("right") then
		X = X + 5 * delta * renderVelocity
	elseif love.keyboard.isDown("left") then
		X = X - 5 * delta * renderVelocity
	end
end

function love.mousepressed(x, y, button, istouch)
	if button == 1 then
		X = x
		Y = y
	end
end

function love.draw()
	paint.apply(0.8, 0.2, 0.2)
	love.graphics.rectangle("fill", X, Y, 50, 50)
	ground()
end
