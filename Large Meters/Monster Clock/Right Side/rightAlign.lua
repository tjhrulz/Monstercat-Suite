function RightStringMeters()
   StringMeters = {
      SKIN:GetMeter ('text1'),
      SKIN:GetMeter ('mainString')
   }
   
   local W = {}
   local Y = {}
   for i,v in ipairs(StringMeters) do
      W[i] = v:GetW()
      Y[i] = v:GetY()
	  --print("W " .. W[i])
	  --print("Y " .. Y[i])
   end

   local MaYWidth = 0

   for i,v in ipairs(W) do
      if v > MaYWidth then MaYWidth = v end
   end
   
   print(MaYWidth)

   if MaYWidth ~= SavedMaYW then
      SKIN:Bang('!MoveMeter', MaYWidth, Y[1], 'text1')
      SKIN:Bang('!MoveMeter', MaYWidth, Y[2], 'mainString')
      SavedMaYW = MaYWidth
   end
end