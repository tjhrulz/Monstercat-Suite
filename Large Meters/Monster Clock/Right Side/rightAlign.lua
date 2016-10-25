function Initialize()
   SavedMaxW = nil
end

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
   end

   local MaxW = 0

   for i,v in ipairs(W) do
      if v > MaxWidth then MaxWidth = v end
   end
   
   print(MaxWidth)

   if MaxW ~= SavedMaxW then
      SKIN:Bang('!MoveMeter', MaxW, Y[1], 'text1')
      SKIN:Bang('!MoveMeter', MaxW, Y[2], 'mainString')
      SavedMaxW = MaxW
   end
end