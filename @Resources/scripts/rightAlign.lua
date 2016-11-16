function Initialize()
   SavedMaxW = 0
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
	  --print("W " .. W[i])
	  --print("Y " .. Y[i])
   end

   local MaxWidth = 0

   for i,v in ipairs(W) do
      if v > MaxWidth then MaxWidth = v end
   end
   
   --print("asdf " .. SavedMaxW .. "," .. MaxWidth)

   if MaxWidth >= SavedMaxW then
      SKIN:Bang('!MoveMeter', MaxWidth, Y[1], 'text1')
      SKIN:Bang('!MoveMeter', MaxWidth, Y[2], 'mainString')
      SavedMaxW = MaxWidth
   end
end