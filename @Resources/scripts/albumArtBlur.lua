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
	
	local rootPath = SKIN:GetVariable("@")
	local magickPath = rootPath .. "ImageMagickScripts\\convert.exe"
	--local outputPath = SKIN:GetVariable("@") .. "images\\coverB.png"
	local blurAmount = tonumber(SKIN:GetVariable("BlurAmount", 32))
	
	if(SKIN:GetMeasure('RunBlurColor'):GetValue() == -1) and (SKIN:GetMeasure('RunBlurColorFallback'):GetValue() == -1) then
		local cmdCommand = rootPath .. "ImageMagickScripts\\convert.exe " .. inputPath .. " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
		SKIN:Bang('!SetOption', 'RunBlurColor', 'Parameter', cmdCommand)
		SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Run')		

		local fallbackPath = SKIN:GetVariable("@") .. "images\\Fallback.png"		
		cmdCommand = rootPath .. "ImageMagickScripts\\convert.exe " .. fallbackPath .. " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
		SKIN:Bang('!SetOption', 'RunBlurColorFallback', 'Parameter', cmdCommand)
		SKIN:Bang('!CommandMeasure', 'RunBlurColorFallback', 'Run')
	else
		if(inputPath ~= nil) and (string.len(inputPath) >= 1) then		
			local cmdCommand = rootPath .. "ImageMagickScripts\\convert.exe " .. inputPath .. " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
			
			SKIN:Bang('!SetOption', 'RunBlurColor', 'Parameter', cmdCommand)
			SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Run')
		else
			local fallbackPath = SKIN:GetVariable("@") .. "images\\Fallback.png"		
			local cmdCommand = rootPath .. "ImageMagickScripts\\convert.exe " .. fallbackPath .. " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath
			
			SKIN:Bang('!SetOption', 'RunBlurColorFallback', 'Parameter', cmdCommand)
			SKIN:Bang('!CommandMeasure', 'RunBlurColorFallback', 'Run')
		end
	end
end