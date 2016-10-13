function colorSelector(genre)
	if (tonumber(SKIN:GetVariable("EnableDynamicColors")) == 1) then
		if (tonumber(SKIN:GetVariable("EnableGenreColors")) ~= -1) then
		
			if (genre ~= nil) or (string.len(genre)) ~= 0 then genre="" end
		
			--print("test:" .. SKIN:GetVariable("EnableGenreColors"))
			if string.find(genre, "Electro") then
				--print("test:" .. SKIN:GetVariable("Electro"))
				colorizer(SKIN:GetVariable("Electro"))
			elseif string.find(genre, "EDM") or string.find(genre, "Electronic") or string.find(genre, "Breaks") or string.find(genre, "Chillout") or string.find(genre, "Bounce") or string.find(genre, "Chill") then
				colorizer(SKIN:GetVariable("EDM"))
			elseif string.find(genre, "House") or string.find(genre, "Electro House") or string.find(genre, "Progressive House") then
				colorizer(SKIN:GetVariable("House"))
			elseif string.find(genre, "Drum & Bass") or string.find(genre, "DnB") then
				colorizer(SKIN:GetVariable("DnB"))
			elseif string.find(genre, "Dubstep") then
				colorizer(SKIN:GetVariable("Dubstep"))
			elseif string.find(genre, "Drumstep") then
				colorizer(SKIN:GetVariable("Drumstep"))
			elseif string.find(genre, "Glitch Hop") or string.find(genre, "GlitchHop") then
				colorizer(SKIN:GetVariable("GlitchHop"))
			elseif string.find(genre, "Trap") then
				colorizer(SKIN:GetVariable("Trap"))
			elseif string.find(genre, "Trance") or string.find(genre, "Deep House") then
				colorizer(SKIN:GetVariable("Trance"))
			elseif string.find(genre, "Hard Dance") then
			colorizer(SKIN:GetVariable("HardDance"))
			elseif string.find(genre, "Nu Disco") or string.find(genre, "NuDisco") or string.find(genre, "Disco") or string.find(genre, "Indie Dance") or string.find(genre, "Electro Swing") then
				colorizer(SKIN:GetVariable("NuDisco"))
			elseif string.find(genre, "Future") or string.find(genre, "Future Bass") then
			--print("test:" .. SKIN:GetVariable("Electro"))
				colorizer(SKIN:GetVariable("FutureBass"))
			elseif string.find(genre, "Mashup") or string.find(genre, "Mash Up") then
				colorizer(SKIN:GetVariable("Mashup"))
			else
				if (tonumber(SKIN:GetVariable("EnableAlbumColor")) == 0) then
					colorizer(SKIN:GetVariable("DefaultDynamicColor"))
				else
					
				end
			end
		else
			if (tonumber(SKIN:GetVariable("EnableAlbumColor")) == 0) then
				colorizer(SKIN:GetVariable("DefaultDynamicColor"))
			else
				
			end
		end
	end
end

function colorizer(baseColorRGB)

	--print("baseColorRGB:" .. baseColorRGB)
	
	local baseColorR = tonumber(string.sub(baseColorRGB, 0, 3))
	local baseColorG = tonumber(string.sub(baseColorRGB, 5, 7))
	local baseColorB = tonumber(string.sub(baseColorRGB, 9, 11))
	
	local vizColor,baseColor,secondaryColor,wallpaperColor,backgroundColor,transBackgroundColor,textColor,BackgroundPanelColor
	local clockColor,minColor,hourColor,secColor
	
	if(SKIN:GetVariable("EnableMultiColors", '0') == '0') then
	
		vizColor = percentColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorModifier", '1.0'))
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
		
	else
	
		vizColor = hueColorize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("VizColorType", '1.0'))
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