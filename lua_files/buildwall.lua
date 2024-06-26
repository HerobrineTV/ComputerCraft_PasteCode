local chat = peripheral.find("chatBox")

local args = {...}

local height = tonumber(args[2])
local length = tonumber(args[1])

chat.sendMessage("Starting to build!", "Maurer", "<>", "&b")

for i=1, height do
	for i2=1, length do
		turtle.digDown()
		turtle.placeDown()
		if i2 ~= length then
			turtle.forward()
		end
	end
	
	if i <= height then
		for i2=1, length-1 do
			turtle.back()
		end
		
		turtle.digUp()
		turtle.up()
	end
end

chat.sendMessage("Finished building!", "Maurer", "<>", "&b")