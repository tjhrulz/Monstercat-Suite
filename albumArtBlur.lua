function blur(inputPath, outputPath)
	--Converts Cover.png to CoverB.png
	--local inputPath = path .. "cover.png"
	
	if(outputPath ~= nil) 
	then
		outputPath = outputPath .. "coverB.png"
		
		--convert rose: -scale 1x1\! -format '%[pixel:s]' info:- -- get average color imagemagick
		--Does not appear to be a way to get several colors found in the source image in imagemagick except for
		--convert  tree.gif  -define histogram:unique-colors=true -format %c histogram:info:-
		
		--os.execute("cmd /k echo " .. inputPath)
		os.execute("cmd /k convert " .. inputPath .. " -channel RGBA -blur 0x32 ")
		os.execute("pasue")
		print(test)
		
		print(path)
	end
end