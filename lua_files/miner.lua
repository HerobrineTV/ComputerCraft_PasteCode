local error1 = "No Fuel!"
local error2 = "Tool Broken!"
local tunnellenght = 3
local spacebetween = 2
local tunnels = 10
local backway = tunnels*(spacebetween+1)

for i=1, tunnels do

	for i=1, tunnellenght do

		while turtle.detect()==true do
			turtle.dig()
			os.sleep(0.5)
		end

		turtle.forward()

	end

	turtle.turnLeft()
	turtle.turnLeft()

	for i=1, tunnellenght do

		turtle.forward()

	end

	turtle.turnRight()
	turtle.dig()
	turtle.forward()
	turtle.digDown()

	for i=1, spacebetween do

		while turtle.detect()==true do
			turtle.dig()
			os.sleep(0.5)
		end

		turtle.forward()
		turtle.digDown()

	end

	turtle.turnRight()
	turtle.refuel()

end

turtle.turnRight()

for i=1, backway do

	while turtle.detect()==true do

		turtle.dig()
		turtle.digDown()

	end

	turtle.forward()

end