local paint = {}

function paint.apply(red, green, blue)
	love.graphics.setColor(red, green, blue)
end

return paint
