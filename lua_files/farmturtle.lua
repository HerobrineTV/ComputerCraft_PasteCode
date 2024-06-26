local width = 7
local height = 7
local wasLeft = false

while true do
    for i=1, width do
        for i2=1, height-1 do
            turtle.placeDown()
            turtle.forward()
        end
        if i ~= width then
            turtle.placeDown()
            if wasLeft == false then
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
                wasLeft = true
            else
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
                wasLeft = false
            end
            turtle.placeDown()
        else
            wasLeft = false
        end
    end
    sleep(60)
    turtle.turnRight()
    for i=1, height-1 do
        turtle.forward()
    end
    turtle.turnRight()
    for i=1, width-1 do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.turnRight()
end