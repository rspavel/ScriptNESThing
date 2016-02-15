--Set the emulator to run at normal speed.
emu.speedmode("normal")

--Add functions and variables here if you are a good programmer

--Reset the game to be fresh and to hopefully sync up the RNG
emu.poweron()

--Helper table to set values: Default to everything off
local joyTable = {}
joyTable["up"] = false
joyTable["down"] = false
joyTable["left"] = false
joyTable["right"] = false
joyTable["A"] = false
joyTable["B"]  = false
joyTable["start"] = false
joyTable["select"] = false

while true do
  --Get the current frame
  local frame = emu.framecount()
  emu.message(frame)

  --Add logic based on frame

  -- On frame 600, press start
  if frame == 700 then
    --Press start on player 1: Lua does not index from 0
    joyTable["start"] = true
  end
  -- Ten frame later, unpress it
  if frame == 710 then
    joyTable["start"] = false
  end
  if frame == 800 then
    --Press start on player 1: Lua does not index from 0
    joyTable["start"] = true
  end
  -- Ten frame later, unpress it
  if frame == 810 then
    joyTable["start"] = false
  end
  -- 1700 is roughly when the game actually starts
	-- Walk down the hallway
	if frame >= 1900 and frame < 2200 then
		joyTable["right"] = true
	end
	-- Ignore the dude
	if frame == 2200 then
		joyTable["right"] = false
		joyTable["A"] = true
	end
	if frame == 2210 then
		joyTable["A"] = false
	end
	-- Walk some more
	if frame >= 2211 and frame < 2400 then
		joyTable["right"] = true
	end
	--Respond to the dude
	if frame == 2400 then
		joyTable["right"] = false
		joyTable["A"] = true
	end
	if frame == 2410 then
		joyTable["A"] = false
	end
	if frame == 2450 then
		joyTable["right"] = false
		joyTable["A"] = true
	end
	if frame == 2460 then
		joyTable["A"] = false
	end
	--Jump up
	if frame >= 2470 and frame < 2500 then
		joyTable["A"] = true
		joyTable["right"] = true
	end
	if frame >= 2500 and frame < 2530 then
		joyTable["A"] = false
		joyTable["right"] = true
	end
	if frame >= 2540 and frame < 2570 then
		joyTable["A"] = true
		joyTable["right"] = true
	end
	-- Kill the guy
	if frame == 2570 then
		joyTable["right"] = false
		joyTable['B'] = true
	end
	if frame == 2580 then
		joyTable['B'] = false
	end
	-- Talk to him again...
	if frame == 2710 then
		joyTable["A"] = true
	end
	if frame == 2720 then
		joyTable["A"] = false
	end
	if frame == 2850 then
		joyTable["A"] = true
	end
	if frame == 2860 then
		joyTable["A"] = false
	end
	if frame == 3000 then
		joyTable["A"] = true
	end
	if frame == 3010 then
		joyTable["A"] = false
	end
	if frame == 3070 then
		joyTable["A"] = true
	end
	if frame == 3080 then
		joyTable["A"] = false
	end
	if frame == 3120 then
		joyTable["A"] = true
	end
	if frame == 3130 then
		joyTable["A"] = false
	end
	if frame == 3150 then
		joyTable["A"] = true
	end
	if frame == 3160 then
		joyTable["A"] = false
	end
	if frame == 3200 then
		joyTable["A"] = true
	end
	if frame == 3210 then
		joyTable["A"] = false
	end
	if frame == 3240 then
		joyTable["A"] = true
	end
	if frame == 3250 then
		joyTable["A"] = false
	end
	if frame == 3280 then
		joyTable["A"] = true
	end
	if frame == 3290 then
		joyTable["A"] = false
	end
	if frame == 3320 then
		joyTable["A"] = true
	end
	if frame == 3330 then
		joyTable["A"] = false
	end
	--And the rest is an exercise for you!



	joypad.set(1, joyTable)


  --Increment actual frame
  emu.frameadvance()
end
