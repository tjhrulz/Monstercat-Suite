function GetColors(doPalette)

	if(tonumber(doPalette) == 1) then
		print("unimplemented")
		
		palette = {"200,200,200","255,255,255","230,206,0","100,100,100","000,000,000","000,000,000"}
		palette[-1] = -1
	else
		ImagePath = SKIN:GetMeasure('GetImagePath'):GetOption('Text')
		vbsPath = SKIN:GetMeasure('CalcRootFilePath'):GetOption('Text')

		--print("AlbumArtLoc " .. ImagePath)

		if (ImagePath == nil) or (ImagePath == "") then
			--ImagePath = vbsPath .. "@Resources\\images\\Fallback.png"
			baseColorRGB = "200,200,200"
		else
			
			--SKIN:Bang('!CommandMeasure ' .. ImagePath .. ' "Kill"')
			
			command = vbsPath .. "ImagePath.bat " .. vbsPath .. " " .. ImagePath .. " " .. vbsPath
			-- -colors 16 -depth 8 -format "%c" histogram:info: | sort /r
			-- -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:
			cmdCommand = vbsPath .. "@Resources\\ImageMagickScripts\\convert.exe " .. ImagePath .. "  -scale 1x1! -format %[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)] info:"
			--cmdCommand = "echo test"
		
			SKIN:Bang('!SetOption', 'RunAverageColor', 'Parameter', cmdCommand)
			
			--print(cmdCommand)
			--print(SKIN:GetMeasure('RunAverageColor'):GetOption('Parameter'))
			--SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Kill')
			SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			--print(SKIN:Bang(cmdCommand))
		end
	end
end