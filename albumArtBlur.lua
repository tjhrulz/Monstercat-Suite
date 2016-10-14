function blur(path)
	--Converts Cover.png to CoverB.png
	local inputPath = path .. "cover.png"
	local outputPath = path .. "coverB.png"
	
	--os.execute("cmd /k echo " .. inputPath)
	os.execute("convert " .. inputPath .. " -channel RGBA -blur 0x32 " .. outputPath)
	os.execute("pasue")
	print(test)
	
	print(path)

end