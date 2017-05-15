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

function updateHeight(change,_direction)
	print("Going ".._direction.." "..change)
	if _direction=="up" then
		y=y+change
	else
		y=y-change
	end
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



-- test 3
print("Test 3")
print("Starting fr: d="..direction.." => 4 | x="..x.." | z="..z.." | y="..y)
updateHeight(2,"up")
updateHeight(2,"down")
updateHeight(5,"down")
print("updating to: d="..direction.." => 4 | x="..x.." | z="..z.." | y="..y)
