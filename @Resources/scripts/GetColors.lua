function colorSelector(genre)
	if (tonumber(SKIN:GetVariable("EnableGenreColors")) == 1) then
		if (genre == nil) or ((string.len(genre)) <= 1) then genre="" end

		--print("test:" .. SKIN:GetVariable("EnableGenreColors"))
		if string.find(genre, "Electro") then
			--print("test:" .. SKIN:GetVariable("Electro"))
			genreColorizer(SKIN:GetVariable("Electro"))
		elseif string.find(genre, "EDM") or string.find(genre, "Electronic") or string.find(genre, "Breaks") or string.find(genre, "Chillout") or string.find(genre, "Bounce") or string.find(genre, "Chill") then
			genreColorizer(SKIN:GetVariable("EDM"))
		elseif string.find(genre, "House") or string.find(genre, "Electro House") or string.find(genre, "Progressive House") then
			genreColorizer(SKIN:GetVariable("House"))
		elseif string.find(genre, "Drum & Bass") or string.find(genre, "DnB") then
			genreColorizer(SKIN:GetVariable("DnB"))
		elseif string.find(genre, "Dubstep") then
			genreColorizer(SKIN:GetVariable("Dubstep"))
		elseif string.find(genre, "Drumstep") then
			genreColorizer(SKIN:GetVariable("Drumstep"))
		elseif string.find(genre, "Glitch Hop") or string.find(genre, "GlitchHop") then
			genreColorizer(SKIN:GetVariable("GlitchHop"))
		elseif string.find(genre, "Trap") then
			genreColorizer(SKIN:GetVariable("Trap"))
		elseif string.find(genre, "Trance") or string.find(genre, "Deep House") then
			genreColorizer(SKIN:GetVariable("Trance"))
		elseif string.find(genre, "Hard Dance") then
			genreColorizer(SKIN:GetVariable("HardDance"))
		elseif string.find(genre, "Nu Disco") or string.find(genre, "NuDisco") or string.find(genre, "Disco") or string.find(genre, "Indie Dance") or string.find(genre, "Electro Swing") then
			genreColorizer(SKIN:GetVariable("NuDisco"))
		elseif string.find(genre, "Future") or string.find(genre, "Future Bass") then
		--print("test:" .. SKIN:GetVariable("Electro"))
			genreColorizer(SKIN:GetVariable("FutureBass"))
		elseif string.find(genre, "Mashup") or string.find(genre, "Mash Up") then
			genreColorizer(SKIN:GetVariable("Mashup"))
		else
			if (tonumber(SKIN:GetVariable("EnableAlbumColor")) == 0) then
				genreColorizer(SKIN:GetVariable("DefaultDynamicColor"))
			else
				albumColorizer(rootDir)
			end
		end
	else
		if (tonumber(SKIN:GetVariable("EnableAlbumColor")) == 0) then
			genreColorizer(SKIN:GetVariable("DefaultDynamicColor"))
		else
			albumColorizer(rootDir)
		end
	end
end

function genreColorizer(baseColorRGB)

	--I dislike lua strings, -1 is to not put the comma in the color, +2 is to skip over it, this is why you follow standard program conventions when making a language liek arrays start at 0 and substrings is based on number of chars to keep
	local baseColorR = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ",")-1)
	baseColorRGB = string.sub(baseColorRGB, string.len(baseColorR)+2)
	local baseColorG = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ",")-1)
	baseColorRGB = string.sub(baseColorRGB, string.len(baseColorG)+2)
	local baseColorB = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ","))
	
	local vizColor, baseColor, secondaryColor, wallpaperColor, backgroundColor, transBackgroundColor, textColor, backgroundPanelColor
	local clockColor, minColor, hourColor, secColor, LogoColor
	
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--It should be noted that the output files are in the order of the colors listed here, do not read them out of order and ensure that you add new colors to ReadColors.lua
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	if(tonumber(SKIN:GetVariable("EnableMultiColors", 0)) ~= 1) then

		baseColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorModifier", '1.0'))
		secondaryColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Modifier", '1.0'))
		wallpaperColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorModifier", '1.0'))
		--backgroundColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorModifier", '1.0'))
		--transBackgroundColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorModifier", '1.0'))
		textColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorModifier", '1.0'))
		textColor2 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColor2Modifier", '1.0'))
		clockColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockRingColorModifier", '1.0'))
		minColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("MinColorModifier", '1.0'))
		hourColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("HourColorModifier", '1.0'))
		secColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("SecColorModifier", '1.0'))
		backgroundPanelColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundPanelColorModifier", '1.0'))
		vizColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorModifier", '1.0'))
		LogoColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("LogoColorModifier", '1.0'))
		
		if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
			testColor1 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier1", '1.0'))	
			testColor2 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier2", '1.0'))
			testColor3 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier3", '1.0'))
			testColor4 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier4", '1.0'))
			testColor5 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier5", '1.0'))
			testColor6 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier6", '1.0'))
		end
	
		local file = io.open(SKIN:GetVariable("@") .. "colors\\GenreOutput.txt", "w")
		io.output(file)
		io.write("(" .. baseColor .. ")")
		io.write("(" .. secondaryColor .. ")")
		io.write("(" .. wallpaperColor .. ")")
		--io.write("(" .. backgroundColor .. ")")
		--io.write("(" .. transBackgroundColor .. ")")
		io.write("(" .. textColor .. ")")
		io.write("(" .. textColor2 .. ")")
		io.write("(" .. clockColor .. ")")
		io.write("(" .. minColor .. ")")
		io.write("(" .. hourColor .. ")")
		io.write("(" .. secColor .. ")")
		io.write("(" .. backgroundPanelColor .. ")")
		io.write("(" .. vizColor .. ")")
		io.write("(" .. LogoColor .. ")")
		if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
			io.write("(" .. testColor1 .. ")")
			io.write("(" .. testColor2 .. ")")
			io.write("(" .. testColor3 .. ")")
			io.write("(" .. testColor4 .. ")")
			io.write("(" .. testColor5 .. ")")
			io.write("(" .. testColor6 .. ")")
		end
		io.close(file)
	else
	
		baseColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorType", '1.0'))
		secondaryColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Type", '1.0'))
		wallpaperColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorType", '1.0'))
		--backgroundColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorType", '1.0'))
		--transBackgroundColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorType", '1.0'))
		textColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorType", '1.0'))
		textColor2 = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColor2Type", '1.0'))
		clockColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockRingColorType", '1.0'))
		minColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("MinColorType", '1.0'))
		hourColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("HourColorType", '1.0'))
		secColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("SecColorType", '1.0'))
		backgroundPanelColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundPanelColorType", '1.0'))
		vizColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorType", '1.0'))
		LogoColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("LogoColorType", '1.0'))
			
		if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
			testColor1 = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorType1", '1.0'))	
			testColor2 = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorType2", '1.0'))
			testColor3 = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorType3", '1.0'))
			testColor4 = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorType4", '1.0'))
			testColor5 = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorType5", '1.0'))
			testColor6 = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorType6", '1.0'))
		end
		
		local file = io.open(SKIN:GetVariable("@") .. "colors\\GenrePaletteOutput.txt", "w")
		io.output(file)
		io.write("(" .. baseColor .. ")")
		io.write("(" .. secondaryColor .. ")")
		io.write("(" .. wallpaperColor .. ")")
		--io.write("(" .. backgroundColor .. ")")
		--io.write("(" .. transBackgroundColor .. ")")
		io.write("(" .. textColor .. ")")
		io.write("(" .. textColor2 .. ")")
		io.write("(" .. clockColor .. ")")
		io.write("(" .. minColor .. ")")
		io.write("(" .. hourColor .. ")")
		io.write("(" .. secColor .. ")")
		io.write("(" .. backgroundPanelColor .. ")")
		io.write("(" .. vizColor .. ")")
		io.write("(" .. LogoColor .. ")")
		if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
			io.write("(" .. testColor1 .. ")")
			io.write("(" .. testColor2 .. ")")
			io.write("(" .. testColor3 .. ")")
			io.write("(" .. testColor4 .. ")")
			io.write("(" .. testColor5 .. ")")
			io.write("(" .. testColor6 .. ")")
		end
		io.close(file)
	end
	--It can be helpful to uncomment this for dev pruposes to see text color sooner, make sure to remvoe ReadColors from song info though
	
	--if vizColor ~= -1 then SKIN:Bang('!SetVariable', "VizColor", vizColor) end
	--if LogoColor ~= -1 then SKIN:Bang('!SetVariable', "LogoColor", LogoColor) end
	--if baseColor ~= -1 then SKIN:Bang('!SetVariable', "Color", baseColor) end
	--if secondaryColor ~= -1 then SKIN:Bang('!SetVariable', "Color2", secondaryColor) end
	--if wallpaperColor ~= -1 then SKIN:Bang('!SetVariable', "WallpaperColor", wallpaperColor) end
	----if backgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundColor", backgroundColor) end
	----if transBackgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundNonColor", transBackgroundColor .. SKIN:GetVariable(BackgroundNonColorTransparency, '255')) end
	--if textColor ~= -1 then SKIN:Bang('!SetVariable', "TextColor", textColor) end
	--if clockColor ~= -1 then SKIN:Bang('!SetVariable', "ClockRingColor", clockColor .. SKIN:GetVariable("ClockRingColorTransparency", ',255')) end
	--if minColor ~= -1 then SKIN:Bang('!SetVariable', "MinColor", minColor) end
	--if hourColor ~= -1 then SKIN:Bang('!SetVariable', "HourColor", hourColor) end
	--if secColor ~= -1 then SKIN:Bang('!SetVariable', "SecColor", secColor) end
	--if backgroundPanelColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundPanelColor", backgroundPanelColor .. SKIN:GetVariable("BackgroundPanelColorTransparency", ',255')) end
	--
	--if testColor1 ~= -1 then SKIN:Bang('!SetVariable', "TestColor1", testColor1) end
	--if testColor2 ~= -1 then SKIN:Bang('!SetVariable', "TestColor2", testColor2) end
	--if testColor3 ~= -1 then SKIN:Bang('!SetVariable', "TestColor3", testColor3) end
	--if testColor4 ~= -1 then SKIN:Bang('!SetVariable', "TestColor4", testColor4) end
	--if testColor5 ~= -1 then SKIN:Bang('!SetVariable', "TestColor5", testColor5) end
	--if testColor6 ~= -1 then SKIN:Bang('!SetVariable', "TestColor6", testColor6) end
end

function albumColorizer(rootDir)

	local vizColor, baseColor, secondaryColor, wallpaperColor, backgroundColor, transBackgroundColor, textColor, BackgroundPanelColor
	local clockColor, minColor, hourColor, secColor, LogoColor
	local testColor1, testColor2, testColor3, testColor4, testColor5, testColor6
	
	if(tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1) then
		if(tonumber(SKIN:GetVariable("EnableMultiColors", 0)) ~= 1) then
		
			local input = ReadFile(SKIN:GetVariable("@") .. "colors\\Histogram.txt")
			local baseColorRGB = 0,0,0
			
			if(input ~= nil) and (string.len(input) > 1) then
				baseColorRGB = string.sub(input, string.find(input, "%(")+1, string.find(input, "%)")-1)
				if(string.len(baseColorRGB) > 11) then
					baseColorRGB = string.sub(baseColorRGB,0,11)
				end
			else
				print("Error: Input for album art color was empty, switching to default")
				baseColorRGB = SKIN:GetVariable("DefaultDynamicColor", "200,200,200")
			end
			
			if(baseColorRGB == nil) then
				--print("Error: Input wasn't empty but didn't contain a color in it, switching to  default")
				baseColorRGB = SKIN:GetVariable("DefaultDynamicColor", "200,200,200")
			end
			
			local baseColorR = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ",")-1)
			baseColorRGB = string.sub(baseColorRGB, string.len(baseColorR)+2)
			local baseColorG = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ",")-1)
			baseColorRGB = string.sub(baseColorRGB, string.len(baseColorR)+2)
			local baseColorB = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ","))
			
			if(baseColorR == nil) or (baseColorG == nil) or (baseColorB == nil) then
				print("Error: Badly formed color for primary album color, switching to  default")
				baseColorRGB = SKIN:GetVariable("DefaultDynamicColor", "200,200,200")
				baseColorR = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ",")-1)
				baseColorRGB = string.sub(baseColorRGB, string.len(baseColorR)+2)
				baseColorG = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ",")-1)
				baseColorRGB = string.sub(baseColorRGB, string.len(baseColorR)+2)
				baseColorB = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ","))
			end
			
			baseColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorModifier", '1.0'))
			secondaryColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Modifier", '1.0'))
			wallpaperColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorModifier", '1.0'))
			--backgroundColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorModifier", '1.0'))
			--transBackgroundColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorModifier", '1.0'))
			textColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorModifier", '1.0'))
			textColor2 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColor2Modifier", '1.0'))
			clockColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockRingColorModifier", '1.0'))
			minColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("MinColorModifier", '1.0'))
			hourColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("HourColorModifier", '1.0'))
			secColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("SecColorModifier", '1.0'))
			backgroundPanelColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundPanelColorModifier", '1.0'))
			vizColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorModifier", '1.0'))
			LogoColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("LogoColorModifier", '1.0'))
			
			if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
				testColor1 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier1", '1.0'))
				testColor2 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier2", '1.0'))
				testColor3 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier3", '1.0'))
				testColor4 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier4", '1.0'))
				testColor5 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier5", '1.0'))
				testColor6 = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TestColorModifier6", '1.0'))
			end
			
			local file = io.open(SKIN:GetVariable("@") .. "colors\\AlbumOutput.txt", "w")
			io.output(file)
			io.write("(" .. baseColor .. ")")
			io.write("(" .. secondaryColor .. ")")
			io.write("(" .. wallpaperColor .. ")")
			--io.write("(" .. backgroundColor .. ")")
			--io.write("(" .. transBackgroundColor .. ")")
			io.write("(" .. textColor .. ")")
			io.write("(" .. textColor2 .. ")")
			io.write("(" .. clockColor .. ")")
			io.write("(" .. minColor .. ")")
			io.write("(" .. hourColor .. ")")
			io.write("(" .. secColor .. ")")
			io.write("(" .. backgroundPanelColor .. ")")
			io.write("(" .. vizColor .. ")")
			io.write("(" .. LogoColor .. ")")
			if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
				io.write("(" .. testColor1 .. ")")
				io.write("(" .. testColor2 .. ")")
				io.write("(" .. testColor3 .. ")")
				io.write("(" .. testColor4 .. ")")
				io.write("(" .. testColor5 .. ")")
				io.write("(" .. testColor6 .. ")")
			end
			io.close(file)
			
		else

			local palette = {}
			
			local input = SKIN:GetVariable("@") .. "colors\\Histogram.txt"
			
			if(input == nil) or (string.len(input) <= 1) then
				print("Error: Unable to find histogram file, switching to a built in fallback. If you managed to trigger this you got problems with your rainmeter install")
				palette = {"000,000,000","20,20,20","100,100,100","127,127,127","200,200,200","255,255,255"}
				palette[-1] = -1
			else 
				palette = getPalette(input)
				
				if(palette[1] == nil)  then
					--print("Error: Histogram file malformed, switching to a built in fallback")
					palette = {"000,000,000","20,20,20","100,100,100","127,127,127","200,200,200","255,255,255"}
					palette[-1] = -1				
				end
			end
			
			baseColor = palette[tonumber(SKIN:GetVariable("ColorPalette", '1.0'))]
			secondaryColor = palette[tonumber(SKIN:GetVariable("Color2Palette", '1.0'))]
			wallpaperColor = palette[tonumber(SKIN:GetVariable("WallpaperColorPalette", '1.0'))]
			--backgroundColor = palette[tonumber(SKIN:GetVariable("BackgroundColorPalette", '1.0'))]
			--transBackgroundColor = palette[tonumber(SKIN:GetVariable("BackgroundNonColorPalette", '1.0'))]
			textColor = palette[tonumber(SKIN:GetVariable("TextColorPalette", '1.0'))]
			textColor2 = palette[tonumber(SKIN:GetVariable("TextColor2Palette", '1.0'))]
			clockColor = palette[tonumber(SKIN:GetVariable("ClockRingColorPalette", '1.0'))]
			minColor = palette[tonumber(SKIN:GetVariable("MinColorPalette", '1.0'))]
			hourColor = palette[tonumber(SKIN:GetVariable("HourColorPalette", '1.0'))]
			secColor = palette[tonumber(SKIN:GetVariable("SecColorPalette", '1.0'))]
			backgroundPanelColor = palette[tonumber(SKIN:GetVariable("BackgroundPanelColorPalette", '1.0'))]
			vizColor = palette[tonumber(SKIN:GetVariable("VizColorPalette", '1.0'))]
			LogoColor = palette[tonumber(SKIN:GetVariable("LogoColorPalette", '1.0'))]
			
			if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
				testColor1 = palette[tonumber(SKIN:GetVariable("TestColorPalette1", '1.0'))]	
				testColor2 = palette[tonumber(SKIN:GetVariable("TestColorPalette2", '1.0'))]
				testColor3 = palette[tonumber(SKIN:GetVariable("TestColorPalette3", '1.0'))]
				testColor4 = palette[tonumber(SKIN:GetVariable("TestColorPalette4", '1.0'))]
				testColor5 = palette[tonumber(SKIN:GetVariable("TestColorPalette5", '1.0'))]
				testColor6 = palette[tonumber(SKIN:GetVariable("TestColorPalette6", '1.0'))]
			end	
		
			local file = io.open(SKIN:GetVariable("@") .. "colors\\AlbumPaletteOutput.txt", "w")
			io.output(file)
			io.write("(" .. baseColor .. ")")
			io.write("(" .. secondaryColor .. ")")
			io.write("(" .. wallpaperColor .. ")")
			--io.write("(" .. backgroundColor .. ")")
			--io.write("(" .. transBackgroundColor .. ")")
			io.write("(" .. textColor .. ")")
			io.write("(" .. textColor2 .. ")")
			io.write("(" .. clockColor .. ")")
			io.write("(" .. minColor .. ")")
			io.write("(" .. hourColor .. ")")
			io.write("(" .. secColor .. ")")
			io.write("(" .. backgroundPanelColor .. ")")
			io.write("(" .. vizColor .. ")")
			io.write("(" .. LogoColor .. ")")
			if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
				io.write("(" .. testColor1 .. ")")
				io.write("(" .. testColor2 .. ")")
				io.write("(" .. testColor3 .. ")")
				io.write("(" .. testColor4 .. ")")
				io.write("(" .. testColor5 .. ")")
				io.write("(" .. testColor6 .. ")")
			end
			io.close(file)	
		end
		--It can be helpful to uncomment this for dev pruposes to see text color sooner, make sure to remvoe ReadColors from song info though
		
		--if vizColor ~= -1 then SKIN:Bang('!SetVariable', "VizColor", vizColor) end
		--if LogoColor ~= -1 then SKIN:Bang('!SetVariable', "LogoColor", LogoColor) end
		--if baseColor ~= -1 then SKIN:Bang('!SetVariable', "Color", baseColor) end
		--if secondaryColor ~= -1 then SKIN:Bang('!SetVariable', "Color2", secondaryColor) end
		--if wallpaperColor ~= -1 then SKIN:Bang('!SetVariable', "WallpaperColor", wallpaperColor) end
		----if backgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundColor", backgroundColor) end
		----if transBackgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundNonColor", transBackgroundColor .. SKIN:GetVariable(BackgroundNonColorTransparency, '255')) end
		--if textColor ~= -1 then SKIN:Bang('!SetVariable', "TextColor", textColor) end
		--if clockColor ~= -1 then SKIN:Bang('!SetVariable', "ClockRingColor", clockColor .. SKIN:GetVariable("ClockRingColorTransparency", ',255')) end
		--if minColor ~= -1 then SKIN:Bang('!SetVariable', "MinColor", minColor) end
		--if hourColor ~= -1 then SKIN:Bang('!SetVariable', "HourColor", hourColor) end
		--if secColor ~= -1 then SKIN:Bang('!SetVariable', "SecColor", secColor) end
		--if backgroundPanelColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundPanelColor", backgroundPanelColor .. SKIN:GetVariable("BackgroundPanelColorTransparency", ',255')) end
		--
		--if testColor1 ~= -1 then SKIN:Bang('!SetVariable', "TestColor1", testColor1) end
		--if testColor2 ~= -1 then SKIN:Bang('!SetVariable', "TestColor2", testColor2) end
		--if testColor3 ~= -1 then SKIN:Bang('!SetVariable', "TestColor3", testColor3) end
		--if testColor4 ~= -1 then SKIN:Bang('!SetVariable', "TestColor4", testColor4) end
		--if testColor5 ~= -1 then SKIN:Bang('!SetVariable', "TestColor5", testColor5) end
		--if testColor6 ~= -1 then SKIN:Bang('!SetVariable', "TestColor6", testColor6) end
	end	
end

function percentColorize(colorR, colorG, colorB, modifyPercent)
	--print("Modify:" .. modifyPercent)
	
	modifyPercent = tonumber(modifyPercent)
	if (modifyPercent == -1) then
			--print("Color Denied")
			return(-1)
	else
		--print("Color:" .. colorR .. "," .. colorG .. "," .. colorB)
		colorR = colorR * modifyPercent
		colorG = colorG * modifyPercent
		colorB = colorB * modifyPercent
		
		if (colorR > 255) then colorR = 255 end
		if (colorG > 255) then colorG = 255 end
		if (colorB > 255) then colorB = 255 end
		
		local newColorRGB = colorR .. "," .. colorG .. "," .. colorB
		return (newColorRGB)
	end
end

function hueColorize(colorR, colorG, colorB, colorType)

	--print("ColorRGB:" .. colorR .. "," .. colorG .. "," .. colorB)

	local newColorRGB = -1
	local colorSpin = 0.04 --The only non magic number, this is the color we want different on the color wheel in degrees, since we are doing just split complementary for now its 150
	--print("Colortype: " .. colorType)
	if (tonumber(colorType) == -1) then
		--print("Color Denied")
		return(newColorRGB)
	elseif(tonumber(colorType) == 1) then
		newColorRGB = colorR .. "," .. colorG .. "," .. colorB
	else

		local colorH, colorS, colorL = RGBtoHSL(colorR, colorG, colorB)
			
		if(tonumber(colorType) == 2) then
			colorH = colorH + colorSpin
			colorL = colorL +.2
		elseif(tonumber(colorType) == 3) then
			colorH = colorH - colorSpin
			colorL = colorL +.2
		end
		if(colorH<0) then
			--print("colortosmall")
			colorH = colorH + 1
		end
		if(colorH>1) then
			--print("colortobig")
			colorH = colorH - 1
		end
		if(colorL<0) then
			--print("colortosmall")
			colorL = 0
		end
		if(colorL>1) then
			--print("colortobig")
			colorL = 1
		end
		--print("ColorHSL:" .. colorH .. "," .. colorS .. "," .. colorL)
		--fml I have to convert it back, I cant imagine this is going to be nice on the CPU. Sorry CPU, thankfully you only have to do this a few times every couple minutes
		
		colorR, colorG, colorB = HSLtoRGB(colorH, colorS, colorL)
		
		newColorRGB = colorR .. "," .. colorG .. "," .. colorB
	end

	--print("newColorRGB:" .. newColorRGB)
	return newColorRGB
end

function getPalette(filePath)
	------------------------------------------------------------------------------------
	--Note anything in this function that casues runtime or compile time errors doesn't seem to trigger the rainmeter log (or im going insane/had wierd bugs), you have been warned 
	------------------------------------------------------------------------------------	

	local input = ReadFile(filePath)
	
	local palette = {}
	
	--print(input)
	--Trying to match this regex \([\s\S]+?\) which is a pain without a cheat sheet with what all the regex translations are to do them in lua
	local i=1

	for color in string.gmatch(input, "%s%b()%s") do
		palette[i] = color	
		palette[i] = string.sub(palette[i], 3, -3)
		
		--print((string.sub(palette[i], 0, 3) ..  ":" .. string.sub(palette[i], 5, 7)  ..  ":" .. string.sub(palette[i], 9, 11)))
		
		i = i + 1
	end
	
	--print("Palette size:" .. table.getn(palette))
	--print("Colors to keep size:" .. tonumber(SKIN:GetVariable("ColorsToKeep", 6)))
	if(table.getn(palette) < tonumber(SKIN:GetVariable("ColorsToKeep", 6))) and (table.getn(palette) > 0) then
		
		local i = table.getn(palette)+1
		print("Not engouh colors:" .. i)
		while (i <= tonumber(SKIN:GetVariable("ColorsToKeep", 6))) do
			
			maxLoc = table.getn(palette)
			math.randomseed(os.time())
			
			local newR = (string.sub(palette[math.random(maxLoc)], 0, 3) + string.sub(palette[math.random(maxLoc)], 0, 3)) /2
			local newG = (string.sub(palette[math.random(maxLoc)], 5, 7) + string.sub(palette[math.random(maxLoc)], 5, 7)) /2
			local newB = (string.sub(palette[math.random(maxLoc)], 9, 11) + string.sub(palette[math.random(maxLoc)], 9, 11)) /2
			
			if(newR < 10) then
				newR = "  " .. newR
			elseif (newR < 100) then
				newR = " " .. newR
			end
			if(newG < 10) then
				newG = "  " .. newG
			elseif (newG < 100) then
				newG = " " .. newG
			end
			if(newB < 10) then
				newB = "  " .. newB
			elseif (newB < 100) then
				newB = " " .. newB
			end
			
			palette[i] =  newR  .. string.sub(palette[i], 4, 4) .. newG .. string.sub(palette[i], 8, 8) .. newB
			
			i = i + 1
		end		
	end
	
	for i=(tonumber(SKIN:GetVariable("ColorsToKeep", 6))+1), table.getn(palette), 1 do
		palette[i] = nil
	end
	
	for i = 1, table.getn(palette), 1 do
		darkestColor=tonumber(SKIN:GetVariable("DarkestColorAverage", 0))
		brightestColor=tonumber(SKIN:GetVariable("LightestColorAverage", 255))
		
		if(string.len(palette[i]) > 11) then
			palette[i] = string.sub(palette[i],0,11)
		end
		
		averageColor=(string.sub(palette[i], 0, 3)+ string.sub(palette[i], 5, 7) + string.sub(palette[i], 9, 11)) / 3
		
		if (averageColor < darkestColor) then 
			local addedColor = math.ceil(darkestColor - averageColor)
			local newR = string.sub(palette[i], 0, 3) + addedColor
			local newG = string.sub(palette[i], 5, 7) + addedColor
			local newB = string.sub(palette[i], 9, 11) + addedColor
			
			if(newR < 10) then
				newR = "  " .. newR
			elseif (newR < 100) then
				newR = " " .. newR
			end
			if(newG < 10) then
				newG = "  " .. newG
			elseif (newG < 100) then
				newG = " " .. newG
			end
			if(newB < 10) then
				newB = "  " .. newB
			elseif (newB < 100) then
				newB = " " .. newB
			end
			
			palette[i] = newR  .. string.sub(palette[i], 4, 4) .. newG .. string.sub(palette[i], 8, 8) .. newB
		elseif (averageColor > brightestColor) then
			local addedColor = math.ceil(brightestColor - averageColor)
			local newR = string.sub(palette[i], 0, 3) + addedColor
			local newG = string.sub(palette[i], 5, 7) + addedColor
			local newB = string.sub(palette[i], 9, 11) + addedColor
			
			if(newR < 10) then
				newR = "  " .. newR
			elseif (newR < 100) then
				newR = " " .. newR
			end
			if(newG < 10) then
				newG = "  " .. newG
			elseif (newG < 100) then
				newG = " " .. newG
			end
			if(newB < 10) then
				newB = "  " .. newB
			elseif (newB < 100) then
				newB = " " .. newB
			end
			
			palette[i] = newR  .. string.sub(palette[i], 4, 4) .. newG .. string.sub(palette[i], 8, 8) .. newB
		end
	end
	
	if(tonumber(SKIN:GetVariable("SortColors", 1))) then
		palette = InsertionSortColors(palette)
	end
	
	palette[-1] = -1

	return palette
end

function InsertionSortColors(t)
	for i=2, table.getn(t), 1 do
		temp = t[i]
		j=i-1
		while j >= 1 and  ((string.sub(t[j], 0, 3)+ string.sub(t[j], 5, 7) + string.sub(t[j], 9, 11)) / 3) > ((string.sub(temp, 0, 3)+ string.sub(temp, 5, 7) + string.sub(temp, 9, 11)) / 3) do
			t[j+1] = t[j]
			j = j -1
		end  
		t[j+1] = temp
	end
  
  return t
end

function RGBtoHSL(colorR, colorG, colorB)
	--I hate magic numbers, this makes me want to pull my hair out, but every number in here is litterally magic to me and will never change
	local colorH, colorS, colorL

	colorR = colorR / 255
	colorG = colorG / 255
	colorB = colorB / 255
	
	colorMax = math.max(colorR, colorG, colorB)
	colorMin = math.min(colorR, colorG, colorB)
	delta = colorMax - colorMin
	
	colorL = ((colorMin + colorMax) / 2)
	if(delta == 0) then
		colorH = 0
		colorS = 0		
	else
		if (colorL < 0.5) then
			colorS = delta / (colorMax + colorMin)
		else
			colorS = delta / (2 - colorMax - colorMin)
		end
		
		local deltaR = (((colorMax - colorR) / 6) + (delta / 2)) / delta
		local deltaG = (((colorMax - colorG) / 6) + (delta / 2)) / delta
		local deltaB = (((colorMax - colorB) / 6) + (delta / 2)) / delta
		
		if (colorR == colorMax) then colorH = deltaB - deltaG
		elseif (colorG == colorMax) then colorH = (1 / 3) + deltaR - deltaB
		elseif (colorB == colorMax) then colorH = (2 / 3) + deltaG - deltaR
		end
		
		if (colorH < 0) then colorH = colorH + 1 end
		if (colorH > 1) then colorH = colorH - 1 end
	
	end
	
	return colorH, colorS, colorL
end

function HSLtoRGB(colorH, colorS, colorL)

	local colorR, colorG, colorB

	if (colorS == 0 ) then
	   colorR = colorL * 255
	   colorG = colorL * 255
	   colorB = colorL * 255
	else
		local var_2
		if (colorL < 0.5) then var_2 = colorL * (1 + colorS)
		else var_2 = (colorL + colorS) - (colorS * colorL) end

		local var_1 = 2 * colorL - var_2
	
		colorR = 255 * HuetoRGB( var_1, var_2, colorH + (1 / 3)) 
		colorG = 255 * HuetoRGB( var_1, var_2, colorH )
		colorB = 255 * HuetoRGB( var_1, var_2, colorH - (1 / 3))
	end
	
	return colorR, colorG, colorB
	
	--print("ColorHSLtoRGB:" .. colorR .. "," .. colorG .. "," .. colorB)
end

function HuetoRGB( v1, v2, vH )
   if (vH < 0) then vH = vH+1 end
   if (vH > 1) then vH = vH-1 end
   if ((6 * vH) < 1) then return (v1 + (v2 - v1) * 6 * vH) end
   if ((2 * vH) < 1) then return (v2) end
   if ((3 * vH) < 2) then return (v1 + (v2 - v1) * ((2 / 3) - vH) * 6) end
   return v1
end

function ReadFile(FilePath)
	-- HANDLE RELATIVE PATH OPTIONS.
	FilePath = SKIN:MakePathAbsolute(FilePath)

	-- OPEN FILE.
	local File = io.open(FilePath)

	-- HANDLE ERROR OPENING FILE.
	if not File then
		print('ReadFile: unable to open file at ' .. FilePath)
		return
	end

	-- READ FILE CONTENTS AND CLOSE.
	local Contents = File:read('*all')
	File:close()
	
	return Contents
end