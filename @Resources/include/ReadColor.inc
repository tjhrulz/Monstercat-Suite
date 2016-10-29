[Rainmeter]
Group=DynamicColors
OnRefreshAction=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[ReadColorsToUse]
Measure=Script
ScriptFile=#@#\scripts\ReadColors.lua

[MeasureAlbumChangedSpotifyNotifySelf]
Measure=Plugin
Plugin=SpotifyPlugin
Type=AlbumName
OnChangeAction=[!SetOption GetImagePath Text "[*MeasureAlbumArtSpotify*]"][!CommandMeasure DoReadUpdate "Stop 1"][!CommandMeasure DoReadUpdate "Execute 1"]

[MeasureAlbumChangedNotifySelf]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Album
OnChangeAction=[!CommandMeasure DoReadUpdate "Stop 1"][!CommandMeasure DoReadUpdate "Execute 1"]

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""

[DoReadUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeColors# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]