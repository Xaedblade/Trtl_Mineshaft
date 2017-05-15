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

function updateHeight(change)
	y=y+change
end

--*********** forward
-- This function takes one paramater and will 
-- move the turtle forward x blocks and clear 
-- blocks in front of it and attack entities in
-- front of it
function forward(times)
	for i=1,times do
		
		--turtle.forward() do -- can't move
		--forward so make a check for a block
		while not true do
			print("Blocked")

			-- there is not a block must
			-- be an entity there for attack
			if turtle.detect() then 
				print("Attacking entity")
				turtle.attack()
			end
		end
		updateCoords(direction)
	end
end

function turn(direction, times)
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
print("Starting fr: d="..direction.." => 4 | x="..x.." | z="..z)
turn('right',4)
print("d = "..direction)
forward(5)
print("Updating to: d="..direction.." => 5 | x="..x.." | z="..z)
turn('left',3)
print("d = "..direction)
forward(1)
print("Updating to: d="..direction.." => 1 | x="..x.." | z="..z)
turn('right',1)
print("d = "..direction)
forward(1)
print("Updating to: d="..direction.." => 1 | x="..x.." | z="..z)
turn('right',1)
print("d = "..direction)
forward(6)
print("Updating to: d="..direction.." => 6 | x="..x.." | z="..z)