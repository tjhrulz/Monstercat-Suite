function blur(inputPath, outputPath)

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
	sleepFor(10)
	
	local rootPath = SKIN:GetVariable("@")
	local magickPath = rootPath .. "ImageMagickScripts\\convert.exe"
	local FallbackPath = getFallbackPath()
	
	--local outputPath = SKIN:GetVariable("@") .. "images\\coverB.png"
	local blurAmount = tonumber(SKIN:GetVariable("BlurAmount", 32))
	
	if(inputPath ~= nil) and (string.len(inputPath) >= 1) then		
		local cmdCommand = rootPath .. "ImageMagickScripts\\convert.exe " .. inputPath .. " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath

		SKIN:Bang('!SetOption', 'RunBlurColor', 'Parameter', cmdCommand)
		SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Run')
	else
		--local fallbackPath = SKIN:GetVariable("@") .. "images\\Fallback.png"		
		local cmdCommand = rootPath .. "ImageMagickScripts\\convert.exe " .. FallbackPath .. " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
		
		SKIN:Bang('!SetOption', 'RunBlurColorFallback', 'Parameter', cmdCommand)
		SKIN:Bang('!CommandMeasure', 'RunBlurColorFallback', 'Run')
	end
end

function getFallbackPath()
	local fallbackPath = SKIN:GetVariable("ROOTCONFIGPATH")
	
	currDay = tonumber(os.date("%d"))
	currMonth = tonumber(os.date("%m"))
	currYear = tonumber(os.date("%y"))
	
	--print(currDay .. ":" .. currMonth .. ":" .. currYear)
	
	if(tonumber(SKIN:GetVariable("EnableSeasonalFallback", 1)) == 1) then
		fallbackPath = fallbackPath .. "@Resources\\images\\Fallbacks\\"
		
		if (currMonth == 12) or (currMonth == 1) or (currMonth == 2) then
			fallbackPath = fallbackPath .. "Winter.png"
		elseif (currMonth == 3) or (currMonth == 4) or (currMonth == 5) then
			fallbackPath = fallbackPath .. "Spring.png"
		elseif (currMonth == 6) or (currMonth == 7) or (currMonth == 8) then
			fallbackPath = fallbackPath .. "Summer.png"
		elseif (currMonth == 9) or (currMonth == 10) or (currMonth == 11) then
			fallbackPath = fallbackPath .. "Fall.png"
		end
	else
		fallbackPath = fallbackPath .. "@Resources\\images\\Fallback.png"	
	end
	
	--print(fallbackPath)
	
	return fallbackPath
end

function sleepFor(n)
	SKIN:Bang(SKIN:GetVariable("@") .. "scripts\\sleep.vbs " .. n)	
end