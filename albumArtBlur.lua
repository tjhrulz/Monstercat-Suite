function blur(rootPath, inputPath, outputPath)
	--Converts Cover.png to CoverB.png
	--local inputPath = path .. "cover.png"
	
	--print("dir1 " .. rootPath)
	--print("dir2 " .. inputPath)
	--print("dir3 " .. outputPath)
	magickPath = rootPath .. "@Resources\\ImageMagickScripts\\convert.exe"
	
	if(inputPath ~= nil) and  (inputPath ~= "")
	then
		outputPath = outputPath .. "coverB.png"
		
		--convert rose: -scale 1x1\! -format '%[pixel:s]' info:- -- get average color imagemagick
		--Does not appear to be a way to get several colors found in the source image in imagemagick except for
		--convert  tree.gif  -define histogram:unique-colors=true -format %c histogram:info:-
		--convert %1 -channel RGBA -blur 0x32 %2
		--print("cmd /k" .. rootPath .. "imageMagickBlur.bat " .. inputPath .. " " .. outputPath)
		os.execute(rootPath .. "imageMagickBlur.bat " .. magickPath .. " " .. inputPath .. " " .. outputPath)
		
	else
		fallbackPath = outputPath .. "artworkB.png"
		outputPath = outputPath .. "coverB.png"
		
		os.execute("copy" .. " " .. fallbackPath .. " " .. outputPath)
	end
	
	--background = SKIN:GetMeter('Background')
	--May be unneeded but sometimes fails to update background after finishing, need to be careful that this doesnt cause an infinite loop on load if I re enable onrefresh
	SKIN:Bang('!Refresh')
end