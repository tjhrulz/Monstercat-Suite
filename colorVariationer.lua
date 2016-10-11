function varationize(colorR, colorG, colorB, modifyPercent)


	print("Color:" .. colorR .. "," .. colorG .. "," .. colorB)
	colorR = colorR * modifyPercent
	colorG = colorG * modifyPercent
	colorB = colorB * modifyPercent
	
	local newColorRGB = colorR .. "," .. colorG .. "," .. colorB
	print("Variation:" .. newColorRGB)
	return (newColorRGB)
end

function varationizer(baseColorR, baseColorG, baseColorB)

	

	local baseColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable(ColorModifier, '1.0'))
	print("BaseColor:" .. baseColor)
	local secondaryColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable(Color2Modifier, '1.0'))
	local wallpaperColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable(WallpaperColorModifier, '1.0'))
	local backgroundColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable(BackgroundColor, '1.0'))
	local transBackgroundColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable(BackgroundNonColorModifier, '1.0'))
	local textColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable(TextColorModifier, '1.0'))
	local clockColor = varationize(baseColorR, baseColorG, baseColorB, SKIN:GetVariable(ClockColorModifier, '1.0'))
	
	SKIN:Bang('!SetVariable', "Color", baseColor)
	SKIN:Bang('!SetVariable', "Color2", secondaryColor)
	SKIN:Bang('!SetVariable', "WallpaperColor", wallpaperColor)
	SKIN:Bang('!SetVariable', "BackgroundColor", backgroundColor)
	SKIN:Bang('!SetVariable', "BackgroundNonColor", transBackgroundColor .. SKIN:GetVariable(BackgroundNonColorTransparency, '255'))
	SKIN:Bang('!SetVariable', "TextColor", textColor)
	SKIN:Bang('!SetVariable', "ClockRing", clockColor .. SKIN:GetVariable(ClockRingTransparency, '255'))
end