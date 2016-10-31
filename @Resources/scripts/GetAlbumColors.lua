function GetColors(imagePath)
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
	sleepFor(10)
	
	print(imagePath)
	
	if(tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1) then
		if(tonumber(SKIN:GetVariable("EnableMultiColors", 1)) == 1) then
			local rootPath = SKIN:GetVariable("ROOTCONFIGPATH")				
			local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))
			
			if(SKIN:GetMeasure('RunAverageColor'):GetValue() == -1) and (SKIN:GetMeasure('RunFallbackAverageColor'):GetValue() == -1) then
				FallbackPath = rootPath .. "@Resources\\images\\Fallback.png"
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe \"" .. FallbackPath .. "\"  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
				
				cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe \"" .. imagePath .. "\"  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
				--print("Doing init:" .. imagePath)
			elseif (imagePath == nil) or (string.len(imagePath) <= 1) then
				--print("No Image defined, switching to histogram fallback:" .. imagePath)
				FallbackPath = rootPath .. "@Resources\\images\\Fallback.png"
			
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe \"" .. FallbackPath .. "\"  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)

				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			else
				--print(imagePath)
			
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe \"" .. imagePath .. "\"  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				print(SKIN:GetMeasure('RunAverageColor'):GetOption('Parameter'))
				
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		else
			local rootPath = SKIN:GetVariable("ROOTCONFIGPATH")
			local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))

			if(SKIN:GetMeasure('RunAverageColor'):GetValue() == -1) and (SKIN:GetMeasure('RunFallbackAverageColor'):GetValue() == -1) then
				FallbackPath = rootPath .. "@Resources\\images\\Fallback.png"
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe \"" .. FallbackPath .. "\"  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			
				cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe \"" .. imagePath .. "\"  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
				--print("Doing init:" .. imagePath)
			elseif (imagePath == nil) or (string.len(imagePath) <= 1) then
				--print("No Image defined, switching to histogram of fallback image")
				FallbackPath = rootPath .. "@Resources\\images\\Fallback.png"				

				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe \"" .. FallbackPath .. "\"  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)
				
				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			else
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe \"" .. imagePath .. "\"  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
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

function sleepFor(n)
	SKIN:Bang(SKIN:GetVariable("@") .. "scripts\\sleep.vbs " .. n)	
end