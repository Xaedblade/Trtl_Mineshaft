x=0; z=0; y=0
direction = 0

-----------------------------------------------------
-- This section is for general movement functions
-- These functions keeps track of the direction
-- and location of the turtle
-----------------------------------------------------

-- updates the direction of the turtle regardless
-- of how many turns by mod 4
function updateDirection(change)
	direction = (direction + change)% 4
end

-- updates the coordinates of the turtle after
-- moving based on the direction
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

-- updates the turtle's y coordinate by number
-- provided
function updateHeight(change)
	y=y+change
end

-----------------------------------------------------
--
--
-----------------------------------------------------
-- This function takes one paramater and will
-- move the turtle forward x blocks and clear
-- blocks in front of it and attack entities
-- in front of it
function forward(times)
	for i=1,times do
		--forward so make a check for a block
		while not turtle.forward() do
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

function turn(direction,times)
	for i=1,times do
		if direction=="left" then
			turtle.turnLeft()
			updateDirection(-1)
		else
			turtle.turnRight()
			updateDirection(1)
		end
	end
end

function down(times)
	for i=1, times do
		if turtle.down() then
			updateHeight(-1)
    else
      print("stuck")
		end
	end
end

function up(times)
	for i=1, times do
		if turtle.up() then
			updateHeight(1)
		end
	end
end

function digLevel()
  result = true

  isBlock, Block = turtle.inspect()
  if isBlock then
    if not (Block.name == 'minecraft:bedrock') then
      print("turtle digs")
      turtle.dig()
    else
      print("Can't dig")
      result = false
    end
  end

  isDnBlock, dnBlock = turtle.inspectDown()
  if isDnBlock then
  	if not (dnBlock.name == 'minecraft:bedrock') then
  		print("turtle digs down")
  		turtle.digDown()
  	else
  		print("Reached the bottom")
  		result = false
  	end
  end

	return result
end

function makeShaft()
	while digLevel() do
		down(1)
		print("Digging down")
	end
  for i=0, y do
    up(1)
    print("y ="..y)
  end
end

-----------------------------------------------------
-- Tests
-----------------------------------------------------

function test4()
	makeShaft()
end

function test3()

	print("Test 3")
	print("Starting fr: d="..direction.." | x="..
	x.." | z="..z.." | y="..y)
	up(2)
	print("update height: 2")
	print("updating to: d="..direction.." | x="..
	x.." | z="..z.." | y="..y)
	down(2)
	print("update height: -2")
	print("updating to: d="..direction.." | x="..
	x.." | z="..z.." | y="..y)
	down(5)
	print("update height: -5")
	print("updating to: d="..direction.." | x="..
	x.." | z="..z.." | y="..y)

	print(" ")
	print("Expected Results")
	y=0
	print("Starting fr: d="..direction.." | x="..
	x.." | z="..z.." | y="..y)
	updateHeight(2)
	print("update height: 2")
	print("updating to: d="..direction.." | x="..
	x.." | z="..z.." | y="..y)
	updateHeight(-2)
	print("update height: -2")
	print("updating to: d="..direction.." | x="..
	x.." | z="..z.." | y="..y)
	updateHeight(-5)
	print("update height: -5")
	print("updating to: d="..direction.." | x="..
	x.." | z="..z.." | y="..y)
end

function test2()
end

function test1()
end

test4()
