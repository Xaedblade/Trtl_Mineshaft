GPS = {0,0,0}
direction = 1

-----------------------------------------------------
--This section is for general movement functions

--*********** changeDirection
-- This function keeps track of the direction of the turtle when the turtle turns
function changeDirection(change)
	direction = (direction + change)% 4
	print("New direction is "..direction)
end

--*********** forward
-- This function takes one paramater and will move the 
-- turtle forward x blocks and clear blocks in front of
-- it and attack entities in front of it
function forward(times)
	print("Moving forward "..times.." times")
    for i=0,times do
		while not turtle.forward() do -- can't move forward so make a check for a block
			print("Blocked")
			if turtle.detect() then -- there is not a block must be an entity there for attack
				print("Attacking entity")
				turtle.attack()
			end
		end
	end
end

function turn(direction, times)
	print("Turning "..direction.." ".." times")
	for i=0,times do
		if direction="left" then
			turtle.turnLeft()
			changeDirection(-1)
		else
			turtle.turnRight()
			changeDirection(1)
		end
	end
end

function down(times)
end

function up(times)
end

function back(times)
end


function makeShaft()
end

turn('right',3)