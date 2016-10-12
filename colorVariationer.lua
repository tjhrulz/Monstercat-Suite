function colorSelector(genre)
	if (SKIN:GetVariable("EnableGenreColors") ~= "-1") and (genre ~= nil) and (string.len(genre) ~= 0) then
		--print("test:" .. SKIN:GetVariable("EnableGenreColors"))
		if string.find(genre, "Electro") then
			--print("test:" .. SKIN:GetVariable("Electro"))
			varationizer(SKIN:GetVariable("Electro"))
		elseif string.find(genre, "EDM") or string.find(genre, "Electronic") or string.find(genre, "Breaks") or string.find(genre, "Chillout") or string.find(genre, "Bounce") or string.find(genre, "Chill") then
			varationizer(SKIN:GetVariable("EDM"))
		elseif string.find(genre, "House") or string.find(genre, "Electro House") or string.find(genre, "Progressive House") then
			varationizer(SKIN:GetVariable("House"))
		elseif string.find(genre, "Drum & Bass") or string.find(genre, "DnB") then
			varationizer(SKIN:GetVariable("DnB"))
		elseif string.find(genre, "Dubstep") then
			varationizer(SKIN:GetVariable("Dubstep"))
		elseif string.find(genre, "Drumstep") then
			varationizer(SKIN:GetVariable("Drumstep"))
		elseif string.find(genre, "Glitch Hop") or string.find(genre, "GlitchHop") then
			varationizer(SKIN:GetVariable("GlitchHop"))
		elseif string.find(genre, "Trap") then
			varationizer(SKIN:GetVariable("Trap"))
		elseif string.find(genre, "Trance") or string.find(genre, "Deep House") then
			varationizer(SKIN:GetVariable("Trance"))
		elseif string.find(genre, "Hard Dance") then
		varationizer(SKIN:GetVariable("HardDance"))
		elseif string.find(genre, "Nu Disco") or string.find(genre, "NuDisco") or string.find(genre, "Disco") or string.find(genre, "Indie Dance") or string.find(genre, "Electro Swing") then
			varationizer(SKIN:GetVariable("NuDisco"))
		elseif string.find(genre, "Future") or string.find(genre, "Future Bass") then
		--print("test:" .. SKIN:GetVariable("Electro"))
			varationizer(SKIN:GetVariable("FutureBass"))
		elseif string.find(genre, "Mashup") or string.find(genre, "Mash Up") then
			varationizer(SKIN:GetVariable("Mashup"))
		else
			varationizer(SKIN:GetVariable("DefaultDynamicColor"))
		end
	end
end

function varationize(colorR, colorG, colorB, modifyPercent)
	--print("Modify:" .. modifyPercent)
	modifyPercent = tonumber(modifyPercent)
	if (modifyPercent == -1)
		then
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

function varationizer(baseColorRGB)

	--print("baseColorRGB:" .. baseColorRGB)
	
	local baseColorR = tonumber(string.sub(baseColorRGB, 0, 3))
	local baseColorG = tonumber(string.sub(baseColorRGB, 5, 7))
	local baseColorB = tonumber(string.sub(baseColorRGB, 9, 11))

	
	local vizColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorModifier", '1.0'))
	local baseColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorModifier", '1.0'))
	local secondaryColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Modifier", '1.0'))
	local wallpaperColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorModifier", '1.0'))
	--local backgroundColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorModifier", '1.0'))
	--local transBackgroundColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorModifier", '1.0'))
	local textColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorModifier", '1.0'))
	local clockColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockRingColorModifier", '1.0'))
	local minColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("MinColorModifier", '1.0'))
	local hourColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("HourColorModifier", '1.0'))
	local secColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("SecColorModifier", '1.0'))
	local BackgroundPanelColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundPanelColorModifier", '1.0'))
	
	--print("TransTest: " .. BackgroundPanelColor .. "," .. SKIN:GetVariable("BackgroundPanelColorTransparency", ',255'))
	--print("Test: " .. wallpaperColor)
	
	if vizColor ~= -1 then SKIN:Bang('!SetVariable', "VizColor", vizColor) end
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
	if BackgroundPanelColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundPanelColor", BackgroundPanelColor .. SKIN:GetVariable("BackgroundPanelColorTransparency", ',255')) end
		
end