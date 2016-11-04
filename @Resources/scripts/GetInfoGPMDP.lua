songTitleOld = nil

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
		
		local songArtist, songAlbumArt, songLength, songPosition = nil

		--Convert JSON to lua table and set meters

		if (FileContents ~= nill) and (string.len(FileContents) > 1) then
		
			local songTitles = string.gmatch(FileContents, '"title"%b:,\n')
			local songArtists = string.gmatch(FileContents, '"artist"%b:,\n')
			local songAlbumArts = string.gmatch(FileContents, '"albumArt"%b:\n')
			local songPositions = string.gmatch(FileContents, '"current"%b:,\n')
			local songLengths = string.gmatch(FileContents, '"total"%b:,')
			
			for word in songTitles do songTitle=word end
			for word in songArtists do songArtist=word end
			for word in songAlbumArts do songAlbumArt=word end
			for word in songLengths do songLength=word end
			for word in songPositions do songPosition=word end
		
			songTitle = string.sub(songTitle, string.find(songTitle, ":")+2, -3)
			songArtist = string.sub(songArtist, string.find(songArtist, ":")+2, -3)
			songAlbumArt = string.sub(songAlbumArt, string.find(songAlbumArt, ":")+2, -4)
			songPosition = string.sub(songPosition, string.find(songPosition, ":")+2, -3) / 1000
			songLength = string.sub(songLength, string.find(songLength, ":")+2, -3) / 1000
			
			local songPositionMin = math.floor(songPosition / 60)
			local songPositionSec = math.floor(songPosition % 60 + .5)
			
			local songLengthMin = math.floor(songLength / 60)
			local songLengthSec = math.floor(songLength % 60 + .5)
			
			if(string.len(songPositionMin) < 2) then songPositionMin = "0" .. songPositionMin end
			if(string.len(songPositionSec) < 2) then songPositionSec = "0" .. songPositionSec end
			if(string.len(songLengthMin) < 2) then songLengthMin = "0" .. songLengthMin end
			if(string.len(songLengthSec) < 2) then songLengthSec = "0" .. songLengthSec end
		
			songPosition = songPositionMin .. ":" .. songPositionSec
			songLength = songLengthMin .. ":" .. songLengthSec
			
			--print(string.sub(songTitle, 2, -2))
			--print(string.sub(songArtist, 2, -2))
			--print(songPosition)
			--print(songLength)
			
			if(songTitleOld == nil) or (songTitle ~= songTitleOld) then
				songTitleOld = songTitle
				if(songTitle ~= "null") then
					SKIN:Bang('!SetVariable', 'GPMSongTitle', string.sub(songTitle, 2, -2))
					SKIN:Bang('!SetVariable', 'GPMSongArtist', string.sub(songArtist, 2, -2))
					SKIN:Bang('!SetVariable', 'GPMSongPosition', songPosition)
					SKIN:Bang('!SetVariable', 'GPMSongLength', songLength)
					if(string.find(songAlbumArt, "default") ~= nil) then
						SKIN:Bang('!SetVariable', 'GPMSongAlbumArt', "")	
						--print("Using fallback info")		
					else
						SKIN:Bang('!SetVariable', 'GPMSongAlbumArt', string.sub(songAlbumArt, 2, -7))	
						--print(string.sub(songAlbumArt, 2, -7))				
					end
					
					SKIN:Bang('!SetOptionGroup', 'TitleGroup', 'DynamicVariables', '0')
					SKIN:Bang('!SetOptionGroup', 'ArtistGroup', 'DynamicVariables', '0')
					SKIN:Bang('!SetOptionGroup', 'CoverGroup', 'DynamicVariables', '0')
					SKIN:Bang('!SetOptionGroup', 'MediaPosition', 'DynamicVariables', '0')
					SKIN:Bang('!SetOptionGroup', 'MediaDuration', 'DynamicVariables', '0')
					
					SKIN:Bang('!UpdateMeasureGroup', 'AlbumArtDonwload')
				else
					SKIN:Bang('!SetVariable', 'GPMSongTitle', SKIN:GetVariable("NoTrackNameText", "N/A"))
					SKIN:Bang('!SetVariable', 'GPMSongArtist', SKIN:GetVariable("NoTrackNameText", "N/A"))
					SKIN:Bang('!SetVariable', 'GPMSongAlbumArt', "")
					SKIN:Bang('!SetVariable', 'GPMSongPosition', "00:00")
					SKIN:Bang('!SetVariable', 'GPMSongLength', "00:00")
					
					SKIN:Bang('!SetOptionGroup', 'TitleGroup', 'DynamicVariables', '0')
					SKIN:Bang('!SetOptionGroup', 'ArtistGroup', 'DynamicVariables', '0')
					SKIN:Bang('!SetOptionGroup', 'CoverGroup', 'DynamicVariables', '0')
					SKIN:Bang('!SetOptionGroup', 'MediaPosition', 'DynamicVariables', '0')
					SKIN:Bang('!SetOptionGroup', 'MediaDuration', 'DynamicVariables', '0')
				
					SKIN:Bang('!UpdateMeasureGroup', 'AlbumArtDonwload')
				end
			else
				SKIN:Bang('!SetVariable', 'GPMSongPosition', songPosition)	
				SKIN:Bang('!SetOptionGroup', 'MediaPosition', 'DynamicVariables', '1')		
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
			print("Google Play Music's json file wsas empty. Did you turn on the external API?")
		end
	end
end
