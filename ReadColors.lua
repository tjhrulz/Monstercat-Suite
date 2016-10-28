function genreKnown(genre)
	if (genre == nil) or ((string.len(genre)) == 0) then return false
	elseif string.find(genre, "Electro") then
		return true
	elseif string.find(genre, "EDM") or string.find(genre, "Electronic") or string.find(genre, "Breaks") or string.find(genre, "Chillout") or string.find(genre, "Bounce") or string.find(genre, "Chill") then
		return true
	elseif string.find(genre, "House") or string.find(genre, "Electro House") or string.find(genre, "Progressive House") then
		return true
	elseif string.find(genre, "Drum & Bass") or string.find(genre, "DnB") then
		return true
	elseif string.find(genre, "Dubstep") then
		return true
	elseif string.find(genre, "Drumstep") then
		return true
	elseif string.find(genre, "Glitch Hop") or string.find(genre, "GlitchHop") then
		return true
	elseif string.find(genre, "Trap") then
		return true
	elseif string.find(genre, "Trance") or string.find(genre, "Deep House") then
		return true
	elseif string.find(genre, "Hard Dance") then
		return true
	elseif string.find(genre, "Nu Disco") or string.find(genre, "NuDisco") or string.find(genre, "Disco") or string.find(genre, "Indie Dance") or string.find(genre, "Electro Swing") then
		return true
	elseif string.find(genre, "Future") or string.find(genre, "Future Bass") then
		return true
	elseif string.find(genre, "Mashup") or string.find(genre, "Mash Up") then
		return true
	else
		return false
	end
end

function readColor(rootPath, genre)

	input = ""
	
	if (tonumber(SKIN:GetVariable("EnableGenreColors")) == 1) then
		if(genreKnown(genre)
			if(tonumber(SKIN:GetVariable("EnableMultiColors", 0)) ~= 1) then
				input = ReadFile(rootPath .. "@Resources\\colors\\GenreOutput.txt")
				
				colors = -1
				
				for color in string.gmatch(input, "%s%b()%s") do
					colors = color
				end
			else
				input = ReadFile(rootPath .. "@Resources\\colors\\GenrePaletteOutput.txt")
				
				colors = {}
				
				local i = 1
				for color in string.gmatch(input, "%s%b()%s") do
					colors[i] = color
				end
	
			end
		else
	elseif (tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1)
		if(tonumber(SKIN:GetVariable("EnableMultiColors", 1)) ~= 1) then
			input = ReadFile(rootPath .. "@Resources\\colors\\AlbumOutput.txt")
			
			colors = {}
				
			local i = 1
			for color in string.gmatch(input, "%s%b()%s") do
				colors[i] = color
			end
		else
			input = ReadFile(rootPath .. "@Resources\\colors\\AlbumPaletteOutput.txt")
			
			colors = {}
				
			local i = 1
			for color in string.gmatch(input, "%s%b()%s") do
				colors[i] = color
			end
		end
	end
	
	
	if(tonumber(SKIN:GetVariable("EnableMultiColors", 0)) == 0) then

		input = 
		
	else
	
		baseColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorType", '1.0'))
		secondaryColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Type", '1.0'))
		wallpaperColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorType", '1.0'))
		--backgroundColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorType", '1.0'))
		--transBackgroundColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorType", '1.0'))
		textColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorType", '1.0'))
		clockColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockRingColorType", '1.0'))
		minColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("MinColorType", '1.0'))
		hourColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("HourColorType", '1.0'))
		secColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("SecColorType", '1.0'))
		BackgroundPanelColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundPanelColorType", '1.0'))
		vizColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorType", '1.0'))
		LogoColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("LogoColorType", '1.0'))
		
	end
	
	if(tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1) and (doAlbumColor == true) then
		--print("Do album palette here")
		doAlbumColor = false
		if(tonumber(SKIN:GetVariable("EnableMultiColors", 0)) == 0) then
		
			--baseColorRGB = SKIN:Bang('!CommandMeasure', 'RunAverageColor', 'Run')
			
			input = ReadFile("output.txt")
			
			--print(input)
			--print(string.find(input, "%("))
			--print(string.find(input, "%)"))
			if(input ~= nil) and (string.len(input) > 1) then
				baseColorRGB = string.sub(input, string.find(input, "%(")+1, string.find(input, "%)")-1)
				if(string.len(baseColorRGB) > 11) then
					baseColorRGB = string.sub(baseColorRGB,0,11)
				end
			else
				print("Error: Unable to get album art color, swtiching to default")
				baseColorRGB = SKIN:GetVariable("DefaultDynamicColor", "200,200,200")
			end
			--print(baseColorRGB)
			
			baseColorR = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ",")-1)
			baseColorRGB = string.sub(baseColorRGB, string.len(baseColorR)+2)
			baseColorG = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ",")-1)
			baseColorRGB = string.sub(baseColorRGB, string.len(baseColorR)+2)
			baseColorB = string.sub(baseColorRGB, 0, string.find(baseColorRGB, ","))
			
			if(baseColorR == nil) or (baseColorG == nil) or (baseColorB == nil) then
				baseColorR, baseColorG, baseColorB = 200
			end
			
			baseColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorModifier", '1.0'))
			secondaryColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Modifier", '1.0'))
			wallpaperColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorModifier", '1.0'))
			--backgroundColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorModifier", '1.0'))
			--transBackgroundColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorModifier", '1.0'))
			textColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorModifier", '1.0'))
			clockColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockRingColorModifier", '1.0'))
			minColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("MinColorModifier", '1.0'))
			hourColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("HourColorModifier", '1.0'))
			secColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("SecColorModifier", '1.0'))
			BackgroundPanelColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundPanelColorModifier", '1.0'))
			vizColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorModifier", '1.0'))
			LogoColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("LogoColorModifier", '1.0'))
		else
		
			palette = getPalette()
			
			if(input == nil) and (string.len(input) <= 1) then
				print("Error: Unable to get album art color, swtiching to default")
				palette = {"200,200,200","255,255,255","230,206,0","100,100,100","000,000,000","000,000,000"}
				palette[-1] = -1
			end
				
		
			baseColor = palette[tonumber(SKIN:GetVariable("ColorPalette", '1.0'))]
			secondaryColor = palette[tonumber(SKIN:GetVariable("Color2Palette", '1.0'))]
			wallpaperColor = palette[tonumber(SKIN:GetVariable("WallpaperColorPalette", '1.0'))]
			--backgroundColor = palette[tonumber(SKIN:GetVariable("BackgroundColorPalette", '1.0'))]
			--transBackgroundColor = palette[tonumber(SKIN:GetVariable("BackgroundNonColorPalette", '1.0'))]
			textColor = palette[tonumber(SKIN:GetVariable("TextColorPalette", '1.0'))]
			clockColor = palette[tonumber(SKIN:GetVariable("ClockRingColorPalette", '1.0'))]
			minColor = palette[tonumber(SKIN:GetVariable("MinColorPalette", '1.0'))]
			hourColor = palette[tonumber(SKIN:GetVariable("HourColorPalette", '1.0'))]
			secColor = palette[tonumber(SKIN:GetVariable("SecColorPalette", '1.0'))]
			backgroundPanelColor = palette[tonumber(SKIN:GetVariable("BackgroundPanelColorPalette", '1.0'))]
			vizColor = palette[tonumber(SKIN:GetVariable("VizColorPalette", '1.0'))]
			LogoColor = palette[tonumber(SKIN:GetVariable("LogoColorPalette", '1.0'))]
			
			testColor1 = palette[tonumber(SKIN:GetVariable("TestColorPalette1", '1.0'))]	
			testColor2 = palette[tonumber(SKIN:GetVariable("TestColorPalette2", '1.0'))]
			testColor3 = palette[tonumber(SKIN:GetVariable("TestColorPalette3", '1.0'))]
			testColor4 = palette[tonumber(SKIN:GetVariable("TestColorPalette4", '1.0'))]
			testColor5 = palette[tonumber(SKIN:GetVariable("TestColorPalette5", '1.0'))]
			testColor6 = palette[tonumber(SKIN:GetVariable("TestColorPalette6", '1.0'))]		
		end
	end	
	
	
	--print("TransTest: " .. backgroundPanelColor .. "," .. SKIN:GetVariable("BackgroundPanelColorTransparency", ',255'))
	--print("Test: " .. wallpaperColor)
	--print("Color: " .. baseColor)
	
	if vizColor ~= -1 then SKIN:Bang('!SetVariable', "VizColor", vizColor) end
	if LogoColor ~= -1 then SKIN:Bang('!SetVariable', "LogoColor", LogoColor) end
	if baseColor ~= -1 then SKIN:Bang('!SetVariable', "Color", baseColor) end
	if secondaryColor ~= -1 then SKIN:Bang('!SetVariable', "Color2", secondaryColor) end
	if wallpaperColor ~= -1 then SKIN:Bang('!SetVariable', "WallpaperColor", wallpaperColor) end
	--if backgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundColor", backgroundColor) end
	--if transBackgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundNonColor", transBackgroundColor .. SKIN:GetVariable(BackgroundNonColorTransparency, '255')) end
	if textColor ~= -1 then SKIN:Bang('!SetVariable', "TextColor", textColor) end
	if clockColor ~= -1 then SKIN:Bang('!SetVariable', "ClockRingColor", clockColor .. SKIN:GetVariable("ClockRingColorTransparency", ',255')) end
	if minColor ~= -1 then SKIN:Bang('!SetVariable', "MinColor", minColor) end
	if hourColor ~= -1 then SKIN:Bang('!SetVariable', "HourColor", hourColor) end
	if secColor ~= -1 then SKIN:Bang('!SetVariable', "SecColor", secColor) end
	if backgroundPanelColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundPanelColor", backgroundPanelColor .. SKIN:GetVariable("BackgroundPanelColorTransparency", ',255')) end
	
	if testColor1 ~= -1 then SKIN:Bang('!SetVariable', "TestColor1", testColor1) end
	if testColor2 ~= -1 then SKIN:Bang('!SetVariable', "TestColor2", testColor2) end
	if testColor3 ~= -1 then SKIN:Bang('!SetVariable', "TestColor3", testColor3) end
	if testColor4 ~= -1 then SKIN:Bang('!SetVariable', "TestColor4", testColor4) end
	if testColor5 ~= -1 then SKIN:Bang('!SetVariable', "TestColor5", testColor5) end
	if testColor6 ~= -1 then SKIN:Bang('!SetVariable', "TestColor6", testColor6) end
end

function ReadFile(FilePath)
	-- HANDLE RELATIVE PATH OPTIONS.
	FilePath = SKIN:MakePathAbsolute(FilePath)
	--print('ReadFile: ' .. FilePath)

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

	--print('Contents: ' .. Contents)
	
	return Contents
end