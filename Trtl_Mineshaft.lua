x=0
z=0
y=0
direction = 0

-----------------------------------------------------
--This section is for general movement functions

--*********** changeDirection
-- This function keeps track of the direction of the turtle when the turtle turns
function changeDirection(change)
	direction = (direction + change)% 4
end

function updateCoords(_direction)
	if direction == 0 then
		x=x+1
	elseif direction == 1 then
		z=z+1
	elseif direction == 2 then
		x=x-1
	else
		z=z-1
	end
end

--*********** forward
-- This function takes one paramater and will move the 
-- turtle forward x blocks and clear blocks in front of
-- it and attack entities in front of it
function forward(times)
	print("Moving forward "..times.." times")
    for i=1,times do
		while not true do--turtle.forward() do -- can't move forward so make a check for a block
			print("Blocked")
			if turtle.detect() then -- there is not a block must be an entity there for attack
				print("Attacking entity")
				turtle.attack()
			end
		end
		updateCoords(direction)
	end
end

function turn(direction, times)
	print("Turning "..direction.." "..times.." times")
	for i=1,times do
		if direction=="left" then
			--turtle.turnLeft()
			changeDirection(-1)
		else
			--turtle.turnRight()
			changeDirection(1)
		end
	end
end

function down(times)
end

function up(times)
end

function makeShaft()
end

-- test 2
print("Test 2")
turn('right',4)
print("Starting coords from: x="..x.." | z="..z)
forward(5)
print("Updating coords to: x="..x.." | z="..z)
turn('left',3)
forward(1)
print("Updating coords to: x="..x.." | z="..z)
turn('right',1)
forward(1)
print("Updating coords to: x="..x.." | z="..z)
turn('right',1)
forward(6)
print("Updating coords to: x="..x.." | z="..z)