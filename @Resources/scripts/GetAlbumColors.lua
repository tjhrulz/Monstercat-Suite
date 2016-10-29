function GetColors()
	KillAllRunning()
	if(tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1) then
		if(tonumber(SKIN:GetVariable("EnableMultiColors", 1)) == 1) then
			local ImagePath = SKIN:GetMeasure('GetImagePath'):GetOption('Text')
			local rootPath = SKIN:GetVariable("ROOTCONFIGPATH")
			
			if (ImagePath == nil) or (string.len(ImagePath) <= 1) then
				print("No Image defined, switching to histogram fallback:" .. ImagePath)
				FallbackPath = rootPath .. "@Resources\\images\\Fallback.png"
				
				local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))
			
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. FallbackPath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
			
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)
				
				--print(cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			else
				--print(ImagePath)

				local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))
			
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. ImagePath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
			
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				
				--print(cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		else
			local ImagePath = SKIN:GetMeasure('GetImagePath'):GetOption('Text')
			local rootPath = SKIN:GetVariable("ROOTCONFIGPATH")

			if (ImagePath == nil) or (string.len(ImagePath) <= 1) then
				print("No Image defined, switching to histogram of fallback image")
				FallbackPath = rootPath .. "@Resources\\images\\Fallback.png"
				
				local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))

				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. FallbackPath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
			
				SKIN:Bang('!SetOption', 'RunFallbackAverageColor', 'Parameter', cmdCommand)
				
				SKIN:Bang('!CommandMeasure', 'RunFallbackAverageColor', 'Run')
			else
			
				local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))

				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. ImagePath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
			
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

function KillAllRunning()
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
	print("Sorry the album art color selector for monstercat is seomhow ready quick enough that the thread doesnt always have time to finish being killed, this wastes just enough time to solve that bug")
end