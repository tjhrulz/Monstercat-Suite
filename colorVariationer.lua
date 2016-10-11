function varationize(colorR, colorG, colorB, modifyPercent)
	print("Modify:" .. modifyPercent)
	modifyPercent = tonumber(modifyPercent)
	if (modifyPercent == -1)
		then
			print("Color Denied")
			return("-1")
		else
			print("Color:" .. colorR .. "," .. colorG .. "," .. colorB)
			colorR = colorR * modifyPercent
			colorG = colorG * modifyPercent
			colorB = colorB * modifyPercent
			
			local newColorRGB = colorR .. "," .. colorG .. "," .. colorB
			return (newColorRGB)
	end
end

function varationizer(baseColorR, baseColorG, baseColorB)

	local baseColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ColorModifier", '1.0'))
	local secondaryColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("Color2Modifier", '1.0'))
	local wallpaperColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("WallpaperColorModifier", '1.0'))
	local backgroundColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundColorModifier", '1.0'))
	local transBackgroundColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("BackgroundNonColorModifier", '1.0'))
	local textColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("TextColorModifier", '1.0'))
	local clockColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable("ClockColorModifier", '1.0'))
	
	if baseColor ~= -1 then SKIN:Bang('!SetVariable', "Color", baseColor) end
	if secondaryColor ~= -1 then SKIN:Bang('!SetVariable', "Color2", secondaryColor) end
	if wallpaperColor ~= -1 then SKIN:Bang('!SetVariable', "WallpaperColor", wallpaperColor) end
	if backgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundColor", backgroundColor) end
	if transBackgroundColor ~= -1 then SKIN:Bang('!SetVariable', "BackgroundNonColor", transBackgroundColor .. SKIN:GetVariable(BackgroundNonColorTransparency, '255')) end
	if textColor ~= -1 then SKIN:Bang('!SetVariable', "TextColor", textColor) end
	if clockColor ~= -1 then SKIN:Bang('!SetVariable', "ClockRing", clockColor .. SKIN:GetVariable(ClockRingTransparency, '255')) end
end