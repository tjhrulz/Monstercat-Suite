function blur(inputPath, outputPath)
	local rootPath = SKIN:GetVariable("@")
	local magickPath = rootPath .. "ImageMagickScripts\\convert.exe"
	--local outputPath = SKIN:GetVariable("@") .. "images\\coverB.png"
	local blurAmount = tonumber(SKIN:GetVariable("BlurAmount", 32))
	
	
	if(inputPath ~= nil) and (string.len(inputPath) >= 1) then		
		local cmdCommand = rootPath .. "ImageMagickScripts\\convert.exe " .. inputPath .. " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath

		SKIN:Bang('!SetOption', 'RunBlurColor', 'Parameter', cmdCommand)
		if(SKIN:GetMeasure('RunBlurColor'):GetValue() == 0) then
			--print("Killing RunBlurColor")
			SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Kill')
			--print("RunBlurColor Value:" .. SKIN:GetMeasure('RunBlurColor'):GetValue())
		end
		--print("Running normal blur" .. SKIN:GetMeasure('RunBlurColor'):GetOption('Parameter'))
		SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Run')
	else
		local fallbackPath = SKIN:GetVariable("@") .. "images\\Fallback.png"		
		local cmdCommand = rootPath .. "ImageMagickScripts\\convert.exe " .. fallbackPath .. " -channel RGBA -blur 0x" .. blurAmount .. " " .. outputPath

		SKIN:Bang('!SetOption', 'RunBlurColor', 'Parameter', cmdCommand)
		if(SKIN:GetMeasure('RunBlurColor'):GetValue() == 0) then
			--print("Killing RunBlurColor")
			SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Kill')
			--print("RunBlurColor Value:" .. SKIN:GetMeasure('RunBlurColor'):GetValue())
		end
		--print("Running fallback blur" .. SKIN:GetMeasure('RunBlurColor'):GetOption('Parameter'))
		SKIN:Bang('!CommandMeasure', 'RunBlurColor', 'Run')
	end
end