function varationize(colorR, colorG, colorB, modifyPercent)
	print("CurrRGB" .. colorR .. colorG .. colorB)
	colorR = colorR * modifyPercent
	colorG = colorG * modifyPercent
	colorB = colorB * modifyPercent
	
	local newColorRGB = colorR .. "," .. colorG .. "," .. colorB
	
	print("newColorRGB" .. newColorRGB)

	SKIN:Bang('!SetVariable', "Color2", newColorRGB)
end