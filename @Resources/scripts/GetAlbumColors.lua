function GetColors()
	if(tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1) then
		if(tonumber(SKIN:GetVariable("EnableMultiColors", 1)) == 1) then
			local ImagePath = SKIN:GetMeasure('GetImagePath'):GetOption('Text')
			local rootPath = SKIN:GetVariable("ROOTCONFIGPATH")
			
			if (ImagePath == nil) or (string.len(ImagePath) <= 1) then
				print("No Image defined, switching to histogram fallback")
				local FallbackPath = rootPath .. "@Resources\\colors\\HistogramFallback.txt"
				
				local cmdCommand = "more " .. FallbackPath
				
				SKIN:Bang('!SetOption', 'CopyAverageColor', 'Parameter', cmdCommand)
				KillAllRunning()
				
				SKIN:Bang('!CommandMeasure', 'CopyAverageColor', 'Run')
			else
				--print("IP" .. ImagePath)

				local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))
			
				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. ImagePath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
			
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				KillAllRunning()
				
				--print(cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		else
			local ImagePath = SKIN:GetMeasure('GetImagePath'):GetOption('Text')
			local rootPath = SKIN:GetVariable("ROOTCONFIGPATH")

			if (ImagePath == nil) or (string.len(ImagePath) <= 1) then
				print("No Image defined, switching to histogram fallback")
				FallbackPath = rootPath .. "@Resources\\colors\\HistogramFallback.txt"
				
				cmdCommand = "more " .. FallbackPath
				
				SKIN:Bang('!SetOption', 'CopyAverageColor', 'Parameter', cmdCommand)
				KillAllRunning()
				
				SKIN:Bang('!CommandMeasure', 'CopyAverageColor', 'Run')
			else
			
				local colorsToGet = tonumber(SKIN:GetVariable("ColorsToGet", 12))

				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				local cmdCommand = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. ImagePath .. "  -colors ".. colorsToGet .." -depth 8 -format %c histogram:info: | sort /r"
			
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				KillAllRunning()
				
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		end
	else
		--[!CommandMeasure CalcColorsToUse "colorSelector('[MeasureGenre]')"]
		print("Hey self don't forget to add the dynamic color push on the fallback for when we dont do histograms") --I probably still will forget and wonder why it isnt working :P
		
		SKIN:Bang('!CommandMeasure', 'CalcColorsToUse', "colorSelector('[MeasureGenre]')")
	end
end

function KillAllRunning()
	if(SKIN:GetMeasure('RunAverageColor'):GetValue() == 0) then
		SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Kill')
	end
	if(SKIN:GetMeasure('CopyAverageColor'):GetValue() == 0) then
		SKIN:Bang('!CommandMeasure', 'CopyAverageColor', 'Kill')
	end
end