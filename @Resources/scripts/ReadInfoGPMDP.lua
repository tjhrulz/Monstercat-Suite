albumArtOld = nil

function Update()
	
	fileToRead = SELF:GetOption('FileToRead')
	
	--"title": null,
    --"artist": null,
    --"album": null,
    --"albumArt": null
	--"current": 0,
    --"total": 0
	
	local File = io.open(fileToRead)
	if not File then
		print("Unable to open Google Play Music's playback json at " .. fileToRead)
	else
		local FileContents = File:read("*all")
		File:close()
		
		local songAlbumArt = nil

		--Convert JSON to lua table and set meters

		if (FileContents ~= nill) and (string.len(FileContents) > 1) then
		
			local songAlbumArts = string.gmatch(FileContents, '"albumArt"%b:\n')
			for word in songAlbumArts do songAlbumArt=word end
			
			songAlbumArt = string.sub(songAlbumArt, string.find(songAlbumArt, ":")+2, -4)
			
			--print(string.sub(songAlbumArt, 2, -7))
			
			if(albumArtOld == nil) or (songAlbumArt ~= albumArtOld) then
				albumArtOld = songAlbumArt
				if(songAlbumArt ~= "nu") and (string.len(songAlbumArt) > 4) then
				
					if(string.find(songAlbumArt, "default") ~= nil) then
						SKIN:Bang('!SetVariable', 'GPMSongAlbumArt', "")	
						--print("Using fallback info")		
					else
						SKIN:Bang('!SetVariable', 'GPMSongAlbumArt', string.sub(songAlbumArt, 2, -7))	
						--print(string.sub(songAlbumArt, 2, -7))				
					end
					
					SKIN:Bang('!UpdateMeasureGroup', 'AlbumArtUpdate')
				else
					SKIN:Bang('!SetVariable', 'GPMSongAlbumArt', "")
					
					SKIN:Bang('!UpdateMeasureGroup', 'AlbumArtUpdate')
				end	
			end
		
			--if nowPlaying_info.playing or oldSongInfo == nil then
			--SKIN:Bang('!SetVariable', 'SongPlaying', 1)
			--SKIN:Bang('!SetVariable', 'GPMDPOpen', 1)
			--	if oldSongInfo == nil or oldSongInfo.title ~= nowPlaying_info.song.title then
			--		--Set all variables
			--		SKIN:Bang('!SetVariable', 'CoverUrl', nowPlaying_info.song.albumArt)
			--		SKIN:Bang('!SetVariable', 'SongTitle', nowPlaying_info.song.title)
			--		SKIN:Bang('!SetVariable', 'SongArtist', nowPlaying_info.song.artist)
			--		SKIN:Bang('!SetVariable', 'SongAlbum', nowPlaying_info.song.album)
			--		SKIN:Bang('!CommandMeasure', 'MeasureImageDownload', "Update")
			--	end
			--	local seconds = nowPlaying_info.time.total/1000
			--	if  SKIN:GetMeter(SKIN:GetVariable("MeterTotalTime")) ~= nil then
			--		if math.floor(seconds/(60*60)) ~= 0  then
			--			SKIN:GetMeter(SKIN:GetVariable("MeterTotalTime")):SetText(string.format("%.2d:%.2d:%.2d", seconds/(60*60), seconds/60%60, seconds%60))
			--		else
			--			SKIN:GetMeter(SKIN:GetVariable("MeterTotalTime")):SetText(string.format("%.2d:%.2d", seconds/60%60, seconds%60))
			--		end
			--	end
			--	local currentSeconds = nowPlaying_info.time.current/1000
			--	if SKIN:GetMeter(SKIN:GetVariable("MeterCurrentTime")) ~= nil then
			--		if math.floor(currentSeconds/(60*60)) ~= 0 then
			--			SKIN:GetMeter(SKIN:GetVariable("MeterCurrentTime")):SetText(string.format("%.2d:%.2d:%.2d", currentSeconds/(60*60), currentSeconds/60%60, currentSeconds%60))
			--		else
			--			SKIN:GetMeter(SKIN:GetVariable("MeterCurrentTime")):SetText(string.format("%.2d:%.2d", currentSeconds/60%60, currentSeconds%60))
			--		end
			--	end
			--	SKIN:Bang('!SetVariable', 'Length', nowPlaying_info.time.current / nowPlaying_info.time.total)
			--	oldSongInfo = nowPlaying_info.song
			--else
			--	SKIN:Bang('!SetVariable', 'SongPlaying', 0)
			--	-- if nowPlaying_info.song.title == nil and nowPlaying_info.song.artist == nil then
			--	if nowPlaying_info.song.artist == nil or nowPlaying_info.time.total == 0 then
			--		SKIN:Bang('!SetVariable', 'GPMDPOpen', 0)
			--		print("Do fallback update")
			--	end
			--end
		else
			--print("Google Play Music's json file wsas empty. Did you turn on the external API?")
		end
	end
end
