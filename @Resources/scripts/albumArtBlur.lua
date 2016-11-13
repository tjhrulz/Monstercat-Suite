function blur(inputPath, outputPath)
	sleepFor(1)
	if(SKIN:GetMeasure('RunBlurColor'):GetValue() == 0) then
		--print("Killing RunBlurColor")
		SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Kill')
		--print("RunBlurColor Value:" .. SKIN:GetMeasure('RunBlurColor'):GetValue())
	end
	if(SKIN:GetMeasure('RunBlurColorFallback'):GetValue() == 0) then
		--print("Killing RunBlurColorFallback")
		SKIN:Bang('!CommandMeasure', 'RunBlurColorFallback', 'Kill')
		--print("RunBlurColorFallback Value:" .. SKIN:GetMeasure('RunBlurColorFallback'):GetValue())
	end
	--print("Sorry the album art color blur for monstercat is realy quick to init so the thread doesnt always have time to finish being killed, this wastes just enough time to solve that bug")
	sleepFor(1)
	
	--print("input:" .. inputPath)
	
	local magickPath = "C:\\img\\convert.exe"
	
	--local outputPath = SKIN:GetVariable("@") .. "images\\coverB.png"
	local blurAmount = tonumber(SKIN:GetVariable("BlurAmount", 32))
	
	if(inputPath ~= nil) and (string.len(inputPath) >= 1) then		
		local cmdCommand = magickPath .. " \"" .. inputPath .. "\"" ..  " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
		--print("Doing normal:" .. cmdCommand)
		SKIN:Bang('!SetOption', 'RunBlurColor', 'Parameter', cmdCommand) 
		SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Run')
	else
		--local fallbackPath = SKIN:GetVariable("@") .. "images\\Fallback.png"	
		local FallbackPath = getFallbackPath()	
		--print("Doing fallback:" .. FallbackPath)
		local cmdCommand = magickPath .. " \"" .. FallbackPath .. "\"" ..  " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
		
		SKIN:Bang('!SetOption', 'RunBlurColorFallback', 'Parameter', cmdCommand)
		SKIN:Bang('!CommandMeasure', 'RunBlurColorFallback', 'Run')
	end
	if(SKIN:GetMeasure('RunBlurColor'):GetValue() == -1) or (SKIN:GetMeasure('RunBlurColorFallback'):GetValue() == -1) then
		--print("First load:")
				
		if (SKIN:GetMeasure('RunBlurColorFallback'):GetValue() == -1) and ((imagePath == nil) or (string.len(imagePath) <= 1)) then
			sleepFor(5)
			if(SKIN:GetMeasure('RunBlurColorFallback'):GetValue() == 0) then
				print("Killing RunBlurColorFallback")
				SKIN:Bang('!CommandMeasure', 'RunBlurColorFallback', 'Kill')
				--print("RunBlurColorFallback Value:" .. SKIN:GetMeasure('RunBlurColorFallback'):GetValue())
			end
			sleepFor(1)			
			--local fallbackPath = SKIN:GetVariable("@") .. "images\\Fallback.png"	
			local FallbackPath = getFallbackPath()	
			--print("Doing fallback blur:" .. FallbackPath)
			local cmdCommand = magickPath .. " \"" .. FallbackPath .. "\"" ..  " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
			
			SKIN:Bang('!SetOption', 'RunBlurColorFallback', 'Parameter', cmdCommand)
			SKIN:Bang('!CommandMeasure', 'RunBlurColorFallback', 'Run')
		elseif (SKIN:GetMeasure('RunBlurColor'):GetValue() == -1) then
			sleepFor(5)
			if(SKIN:GetMeasure('RunBlurColor'):GetValue() == 0) then
				print("Killing RunBlurColor")
				SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Kill')
				--print("RunBlurColor Value:" .. SKIN:GetMeasure('RunBlurColor'):GetValue())
			end
			local cmdCommand = magickPath .. " \"" .. inputPath .. "\"" ..  " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
			--print("Doing normal blur:" .. cmdCommand)
			SKIN:Bang('!SetOption', 'RunBlurColor', 'Parameter', cmdCommand)
			SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Run')
		end
	end
end

function getFallbackPath()
	local fallbackPath = SKIN:GetVariable("ROOTCONFIGPATH")
	
	currDay = tonumber(os.date("%d"))
	currMonth = tonumber(os.date("%m"))
	currYear = tonumber(os.date("%y"))
	currYearF = tonumber(os.date("%Y"))
	
	--print(currDay .. ":" .. currMonth .. ":" .. currYear)
	
	local dates = ReadFile(fallbackPath .. "@Resources\\Holidays.txt")
	local dateFileToLoad = nil
	
	for i=1, table.getn(dates), 1 do
		--print(dates[i])	

		dateCutoff = string.find(dates[i], "%d?%d.%d?%d.?%d?%d?%d?%d?")
		easterCutoff = string.find(dates[i], "Easter")
		thanksgivingCutoff = string.find(dates[i], "Thanksgiving")
		
		if (dateCutoff ~= nil) then
			dateToCheck = string.sub(dates[i], dateCutoff)
			
			if (dateToCheck == currMonth .. "/" .. currDay) or (dateToCheck == currMonth .. "/" .. currDay .. "/" .. currYear) or (dateToCheck == currMonth .. "/" .. currDay .. "/" .. currYearF) then
				dateFileToLoad = string.sub(dates[i], 0, dateCutoff-2)
				--print("date:" .. dateFileToLoad)
			end
		elseif (easterCutoff ~= nil) then
			dateToCheck = string.sub(dates[i], easterCutoff)
		elseif (thanksgivingCutoff ~= nil) then
			dateToCheck = string.sub(dates[i], thanksgivingCutoff)
		end
		
		--print(dateToCheck)
		
	end
	
	if(tonumber(SKIN:GetVariable("EnableSeasonalFallback", 1)) == 1) then
		fallbackPath = fallbackPath .. "@Resources\\images\\Fallbacks\\"
		
		if (dateFileToLoad ~= nil) then
			fallbackPath = fallbackPath .. dateFileToLoad .. ".png"
		elseif (currMonth == 12) or (currMonth == 1) or (currMonth == 2) then
			fallbackPath = fallbackPath .. "Winter.png"
		elseif (currMonth == 3) or (currMonth == 4) or (currMonth == 5) then
			fallbackPath = fallbackPath .. "Spring.png"
		elseif (currMonth == 6) or (currMonth == 7) or (currMonth == 8) then
			fallbackPath = fallbackPath .. "Summer.png"
		elseif (currMonth == 9) or (currMonth == 10) or (currMonth == 11) then
			fallbackPath = fallbackPath .. "Fall.png"
		else
			fallbackPath = SKIN:GetVariable("ROOTCONFIGPATH") .. "@Resources\\images\\Fallback.png"	
		end
	else
		fallbackPath = fallbackPath .. "@Resources\\images\\Fallback.png"	
	end
	
	--print(fallbackPath)
	
	return "\"" .. fallbackPath .. "\""
end

function ReadFile(FilePath)
	-- HANDLE RELATIVE PATH OPTIONS.
	FilePath = SKIN:MakePathAbsolute(FilePath)

	-- OPEN FILE.
	local File = io.open(FilePath)

	-- HANDLE ERROR OPENING FILE.
	if not File then
		print('ReadFile: unable to open file at ' .. FilePath)
		return
	end

	-- READ FILE CONTENTS AND CLOSE.
	local Contents = {}
	
	local temp = File:read('*l')
	local i = 1
	while temp ~= nil do
      Contents[i] = temp
	  temp = File:read('*l')
	  i=i+1
    end
	
	File:close()
	
	return Contents
end

function sleepFor(n)
	for i=0, n, 1 do
		SKIN:Bang(SKIN:GetVariable("@") .. "scripts\\sleep.vbs " .. "10")	
	end
end