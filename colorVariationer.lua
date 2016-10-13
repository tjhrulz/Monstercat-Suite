function RGBtoHSL(colorR, colorG, colorB)
	--I hate magic numbers, this makes me want to pull my hair out, but every number in here is litterally magic to me and will never change
	local colorH, colorS, colorL

	colorR = colorR / 255
	colorG = colorG / 255
	colorB = colorB / 255
	
	colorMax = math.max(colorR, colorG, colorB)
	colorMin = math.min(colorR, colorG, colorB)
	delta = colorMax - colorMin
	
	colorL = (colorMin + colorMax) / 2)
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
		elseif (colorG == colorMax ) then colorH = (1 / 3) + deltaR - deltaB
		elseif (colorB == colorMax ) then colorH = (2 / 3) + deltaG - deltaR

		if (colorH < 0 ) then colorH += 1
		if (colorH > 1 ) then colorH -= 1
	
	end
	
	return colorH, colorS, colorL
end

function HSLtoRGB(colorH, colorS, colorL)
	if (colorS == 0 ) then
	   colorR = colorL * 255
	   colorG = colorL * 255
	   colorB = colorL * 255
	else
	   if (colorL < 0.5) then local var_2 = colorL * (1 + colorS)
	   else var_2 = (colorL + colorS) - (colorS * colorL) end

	   local var_1 = 2 * colorL - var_2

	   R = 255 * Hue_2_RGB( var_1, var_2, colorH + (1 / 3)) 
	   G = 255 * Hue_2_RGB( var_1, var_2, colorH )
	   B = 255 * Hue_2_RGB( var_1, var_2, colorH - (1 / 3))
	end
end

function HuetoRGB( v1, v2, vH )
   if (vH < 0) then vH += 1
   if (vH > 1) then vH -= 1
   if ((6 * vH) < 1) then return (v1 + (v2 - v1) * 6 * vH)
   if ((2 * vH) < 1) then return (v2)
   if ((3 * vH) < 2) then return (v1 + (v2 - v1) * ((2 / 3) - vH) * 6)
   return v1
end

function colorSelector(genre)
	if (SKIN:GetVariable("EnableGenreColors") ~= "-1") and (genre ~= nil) and (string.len(genre) ~= 0) then
		--print("test:" .. SKIN:GetVariable("EnableGenreColors"))
		if string.find(genre, "Electro") then
			--print("test:" .. SKIN:GetVariable("Electro"))
			variationizer(SKIN:GetVariable("Electro"))
		elseif string.find(genre, "EDM") or string.find(genre, "Electronic") or string.find(genre, "Breaks") or string.find(genre, "Chillout") or string.find(genre, "Bounce") or string.find(genre, "Chill") then
			variationizer(SKIN:GetVariable("EDM"))
		elseif string.find(genre, "House") or string.find(genre, "Electro House") or string.find(genre, "Progressive House") then
			variationizer(SKIN:GetVariable("House"))
		elseif string.find(genre, "Drum & Bass") or string.find(genre, "DnB") then
			variationizer(SKIN:GetVariable("DnB"))
		elseif string.find(genre, "Dubstep") then
			variationizer(SKIN:GetVariable("Dubstep"))
		elseif string.find(genre, "Drumstep") then
			variationizer(SKIN:GetVariable("Drumstep"))
		elseif string.find(genre, "Glitch Hop") or string.find(genre, "GlitchHop") then
			variationizer(SKIN:GetVariable("GlitchHop"))
		elseif string.find(genre, "Trap") then
			variationizer(SKIN:GetVariable("Trap"))
		elseif string.find(genre, "Trance") or string.find(genre, "Deep House") then
			variationizer(SKIN:GetVariable("Trance"))
		elseif string.find(genre, "Hard Dance") then
		variationizer(SKIN:GetVariable("HardDance"))
		elseif string.find(genre, "Nu Disco") or string.find(genre, "NuDisco") or string.find(genre, "Disco") or string.find(genre, "Indie Dance") or string.find(genre, "Electro Swing") then
			variationizer(SKIN:GetVariable("NuDisco"))
		elseif string.find(genre, "Future") or string.find(genre, "Future Bass") then
		--print("test:" .. SKIN:GetVariable("Electro"))
			variationizer(SKIN:GetVariable("FutureBass"))
		elseif string.find(genre, "Mashup") or string.find(genre, "Mash Up") then
			variationizer(SKIN:GetVariable("Mashup"))
		else
			variationizer(SKIN:GetVariable("DefaultDynamicColor"))
		end
	end
end

function variationize(colorR, colorG, colorB, modifyPercent)
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

function colorize(colorR, colorG, colorB, colorType)

	local newColorRGB = -1
	local colorSpin = 150 --The only non magic number, this is the color we want different on the color wheel in degrees, since we are doing just split complementary for now its 150
	
	if (modifyPercent == -1) then
		--print("Color Denied")
		return(newColorRGB)
	elseif(colorType == 1) then
		newColorRGB = colorR .. "," colorG .. "," colorB
	else

		local colorH, colorS, colorL = RGBtoHSL(colorR, colorG, colorB)
			
		if(colorType == 2) then
			colorH = colorH + colorSpin
		elseif(colorType == 3) then
			colorH = colorH - colorSpin
		end

		--fml I have to convert it back, I cant imagine this is going to be nice on the CPU. Sorry CPU, thankfully you only have to do this a few times every couple minutes
		
		colorR, colorG, colorB = HSLtoRGB(colorH, colorS, colorL)
		
		newColorRGB = colorR .. "," .. colorG .. "," .. colorB
	end

	return newColorRGB
end

function variationizer(baseColorRGB)

	--print("baseColorRGB:" .. baseColorRGB)
	
	local baseColorR = tonumber(string.sub(baseColorRGB, 0, 3))
	local baseColorG = tonumber(string.sub(baseColorRGB, 5, 7))
	local baseColorB = tonumber(string.sub(baseColorRGB, 9, 11))
	
	local vizColor,baseColor,secondaryColor,wallpaperColor,backgroundColor,transBackgroundColor,textColor,BackgroundPanelColor
	local clockColor,minColor,hourColor,secColor
	
	if(SKIN:GetVariable("EnableSplitComplementaryColors", '0') == '0') then
	
		vizColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorModifier", '1.0'))
		baseColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorModifier", '1.0'))
		secondaryColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Modifier", '1.0'))
		wallpaperColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorModifier", '1.0'))
		--backgroundColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorModifier", '1.0'))
		--transBackgroundColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorModifier", '1.0'))
		textColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorModifier", '1.0'))
		clockColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockRingColorModifier", '1.0'))
		minColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("MinColorModifier", '1.0'))
		hourColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("HourColorModifier", '1.0'))
		secColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("SecColorModifier", '1.0'))
		BackgroundPanelColor = variationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundPanelColorModifier", '1.0'))
		
	else
	
		vizColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorType", '1.0'))
		baseColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorType", '1.0'))
		secondaryColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Type", '1.0'))
		wallpaperColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorType", '1.0'))
		--backgroundColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorType", '1.0'))
		--transBackgroundColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorType", '1.0'))
		textColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorType", '1.0'))
		clockColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockRingColorType", '1.0'))
		minColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("MinColorType", '1.0'))
		hourColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("HourColorType", '1.0'))
		secColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("SecColorType", '1.0'))
		BackgroundPanelColor = colorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundPanelColorType", '1.0'))
	
	end
	
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