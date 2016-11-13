function GetColors(imagePath)
	sleepFor(1)
	if(SKIN:GetMeasure('RunAverageColor'):GetValue() == 0) then
		--print("Killing RunAverageColor")
		SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Kill')
		--print("RunAverageColor Value:" .. SKIN:GetMeasure('RunAverageColor'):GetValue())
	end
	if(SKIN:GetMeasure('RunFallbackAverageColor'):GetValue() == 0) then
		--print("Killing RunFallbackAverageColor")
		SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Kill')
		--print("RunFallbackAverageColor Value:" .. SKIN:GetMeasure('RunFallbackAverageColor'):GetValue())
	end
	--print("Sorry the album art color selector for monstercat is somehow quick enough that the thread doesnt always have time to finish being killed, this wastes just enough time to solve that bug")
	sleepFor(1)
	
	--print("input:" .. imagePath)
	
	--local rootPath = "\"" .. SKIN:GetVariable("ROOTCONFIGPATH")
	local magickPath = SKIN:GetVariable("MagickPath", SKIN:GetVariable("@") .. "ImageMagickScripts\\convert.exe")
	local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))
	imagePath = "\"" .. imagePath .. "\""
	
	--print(magickPath)
	--print(SKIN:GetMeasure('RunAverageColor'):GetOption('Parameter'))
	
	if(tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1) then
		if(tonumber(SKIN:GetVariable("EnableMultiColors", 1)) == 1) then
			
			if (imagePath == nil) or (string.len(imagePath) <= 1) then
				--print("No Image defined, switching to histogram fallback:" .. imagePath)
				local FallbackPath = getFallbackPath()
				--print("No Image defined, current fallback:" .. FallbackPath)
			
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = magickPath .. " " .. FallbackPath .. "  -colors ".. colorsToGet .. " -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)

				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			else
				--print(imagePath)
			
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = magickPath .. " " .. imagePath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		else

			if(SKIN:GetMeasure('RunAverageColor'):GetValue() == -1) and (SKIN:GetMeasure('RunFallbackAverageColor'):GetValue() == -1) then
				local cmdCommand = magickPath .. " " .. FallbackPath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			
				cmdCommand = magickPath .. " " .. imagePath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
				--print("Doing init:" .. imagePath)
			elseif (imagePath == nil) or (string.len(imagePath) <= 1) then
				--print("No Image defined, switching to histogram of fallback image")
				local FallbackPath = getFallbackPath()		

				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = magickPath .. " " .. FallbackPath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)
				
				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			else
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = magickPath .. " " .. imagePath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		end
		if(SKIN:GetMeasure('RunAverageColor'):GetValue() == -1) or (SKIN:GetMeasure('RunFallbackAverageColor'):GetValue() == -1) then
			--print("First load:")
			
			if (SKIN:GetMeasure('RunFallbackAverageColor'):GetValue() == -1) and ((imagePath == nil) or (string.len(imagePath) <= 1)) then
				sleepFor(3)
				if(SKIN:GetMeasure('RunFallbackAverageColor'):GetValue() == 0) then
					--print("Killing RunFallbackAverageColor")
					SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Kill')
					--print("RunFallbackAverageColor Value:" .. SKIN:GetMeasure('RunFallbackAverageColor'):GetValue())
				end
				sleepFor(1)			
				--print("No Image defined, switching to histogram of fallback image")
				--print("No Image defined, First run, switching to histogram fallback:" .. imagePath)
				local FallbackPath = getFallbackPath()
				--print("No Image defined, First run, current fallback:" .. FallbackPath)		

				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = magickPath .. " " .. FallbackPath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)
				
				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			elseif (SKIN:GetMeasure('RunAverageColor'):GetValue() == -1) then
				sleepFor(3)
				if(SKIN:GetMeasure('RunAverageColor'):GetValue() == 0) then
					--print("Killing RunAverageColor")
					SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Kill')
					--print("RunAverageColor Value:" .. SKIN:GetMeasure('RunAverageColor'):GetValue())
				end
				sleepFor(1)
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = magickPath .. " " .. imagePath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		end
	else
		--[!CommandMeasure CalcColorsToUse "colorSelector('[MeasureGenre]')"]
		--print("Hey self don't forget to add the dynamic color push on the fallback for when we dont do histograms") --I probably still will forget and wonder why it isnt working :P
		--For the record I did forget but the since I can't push it down and we use timers it didn't matter :P
		
		SKIN:Bang('!CommandMeasure', 'CalcColorsToUse', "colorSelector('[MeasureGenre]')")
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
	  print(temp)
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