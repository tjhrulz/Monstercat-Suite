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

function readColor(genre)

	local input = ""
	local colors = {}
	local rootPath = SKIN:GetVariable("@")
	
	if (tonumber(SKIN:GetVariable("EnableGenreColors")) == 1) then
		if(genreKnown(genre)) then
			if(tonumber(SKIN:GetVariable("EnableMultiColors", 0)) ~= 1) then
				input = ReadFile(rootPath .. "colors\\GenreOutput.txt")
				
				i = 1
				for color in string.gmatch(input, "%b()") do
					colors = string.sub(color, 2, -2)
					i = i + 1
				end
			else
				input = ReadFile(rootPath .. "colors\\GenrePaletteOutput.txt")
				
				local i = 1
				for color in string.gmatch(input, "%b()") do
					colors[i] = string.sub(color, 2, -2)
					i = i + 1
				end
	
			end
		elseif(tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) ~= 1) then
			if(tonumber(SKIN:GetVariable("EnableMultiColors", 0)) ~= 1) then
				input = ReadFile(rootPath .. "colors\\GenreOutput.txt")
				
				i = 1
				for color in string.gmatch(input, "%b()") do
					colors = string.sub(color, 2, -2)
					i = i + 1
				end
			else
				input = ReadFile(rootPath .. "colors\\GenrePaletteOutput.txt")
				
				local i = 1
				for color in string.gmatch(input, "%b()") do
					colors[i] = string.sub(color, 2, -2)
					i = i + 1
				end
	
			end
		end
	elseif (tonumber(SKIN:GetVariable("EnableAlbumColor", 1)) == 1) then
		if(tonumber(SKIN:GetVariable("EnableMultiColors", 1)) ~= 1) then
			input = ReadFile(rootPath .. "colors\\AlbumOutput.txt")
				
			local i = 1
			for color in string.gmatch(input, "%b()") do
				colors[i] = string.sub(color, 2, -2)
					i = i + 1
			end
		else
			input = ReadFile(rootPath .. "colors\\AlbumPaletteOutput.txt")
				
			local i = 1
			for color in string.gmatch(input, "%b()") do
				colors[i] = string.sub(color, 2, -2)
				i = i + 1
			end
		end
	end
	
	if colors[1] ~= -1 then SKIN:Bang('!SetVariable', "Color", colors[1]) end
	if colors[2] ~= -1 then SKIN:Bang('!SetVariable', "Color2", colors[2]) end
	if colors[3] ~= -1 then SKIN:Bang('!SetVariable', "WallpaperColor", colors[3]) end
	--if backgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundColor", backgroundColor) end
	--if transBackgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundNonColor", transBackgroundColor .. SKIN:GetVariable(BackgroundNonColorTransparency, '255')) end
	if colors[4] ~= -1 then SKIN:Bang('!SetVariable', "TextColor", colors[4]) end
	if colors[5] ~= -1 then SKIN:Bang('!SetVariable', "TextColor2", colors[5]) end
	if colors[6] ~= -1 then SKIN:Bang('!SetVariable', "ClockRingColor", colors[6] .. SKIN:GetVariable("ClockRingColorTransparency", ',255')) end
	if colors[7] ~= -1 then SKIN:Bang('!SetVariable', "MinColor", colors[7]) end
	if colors[8] ~= -1 then SKIN:Bang('!SetVariable', "HourColor", colors[8]) end
	if colors[9] ~= -1 then SKIN:Bang('!SetVariable', "SecColor", colors[9]) end
	if colors[10] ~= -1 then SKIN:Bang('!SetVariable', "BackgroundPanelColor", colors[10] .. SKIN:GetVariable("BackgroundPanelColorTransparency", ',255')) end
	if colors[11] ~= -1 then SKIN:Bang('!SetVariable', "VizColor", colors[11]) end
	if colors[12] ~= -1 then SKIN:Bang('!SetVariable', "LogoColor", colors[12]) end
	if(tonumber(SKIN:GetVariable("EnableDevMode", 0)) == 1) then
		if colors[13] ~= -1 then SKIN:Bang('!SetVariable', "TestColor1", colors[13]) end
		if colors[14] ~= -1 then SKIN:Bang('!SetVariable', "TestColor2", colors[14]) end
		if colors[15] ~= -1 then SKIN:Bang('!SetVariable', "TestColor3", colors[15]) end
		if colors[16] ~= -1 then SKIN:Bang('!SetVariable', "TestColor4", colors[16]) end
		if colors[17] ~= -1 then SKIN:Bang('!SetVariable', "TestColor5", colors[17]) end
		if colors[18] ~= -1 then SKIN:Bang('!SetVariable', "TestColor6", colors[18]) end
	end
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