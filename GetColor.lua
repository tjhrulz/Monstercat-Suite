function GetColors(doPalette)
	if(tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1) then
		if(tonumber(doPalette) == 1) then
			ImagePath = SKIN:GetMeasure('GetImagePath'):GetOption('Text')
			vbsPath = SKIN:GetMeasure('CalcRootFilePath'):GetOption('Text')

			if (ImagePath == nil) or (string.len(ImagePath) <= 1) then
				--print("IPF" .. ImagePath)
			
				--FallbackPath = vbsPath .. "@Resources\\images\\output.txt"
				--
				--cmdCommand = "more " .. FallbackPath
				--
				--SKIN:Bang('!SetOption', 'CopyAverageColor', 'Parameter', cmdCommand)
				--KillAllRunning()
				--
				--SKIN:Bang('!CommandMeasure', 'CopyAverageColor', 'Run')
			else

				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				cmdCommand = vbsPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. ImagePath .. "  -colors 6 -depth 8 -format %c histogram:info: | sort /r"
			
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				KillAllRunning()
				--print("IP" .. ImagePath)
				
				--print(cmdCommand)
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		else
			ImagePath = SKIN:GetMeasure('GetImagePath'):GetOption('Text')
			vbsPath = SKIN:GetMeasure('CalcRootFilePath'):GetOption('Text')

			if (ImagePath == nil) or (string.len(ImagePath) <= 1) then
				--FallbackPath = vbsPath .. "@Resources\\images\\output.txt"
				--
				--cmdCommand = "more " .. FallbackPath
				--
				--SKIN:Bang('!SetOption', 'CopyAverageColor', 'Parameter', cmdCommand)
				--KillAllRunning()
				--
				--SKIN:Bang('!CommandMeasure', 'CopyAverageColor', 'Run')
			else

				-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
				-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
				cmdCommand = vbsPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. ImagePath .. "  -colors 6 -depth 8 -format %c histogram:info: | sort /r"
			
				SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
				KillAllRunning()
				
				SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			end
		end
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