[Variables]

[Rainmeter]
Group=DynamicColors
OnRefreshAction=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]
#OnUpdateAction=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[ReadColorsToUse]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\ReadColors.lua

;[MeasureAlbumChangedSpotifyNotifySelf]
;Measure=Plugin
;Plugin=SpotifyPlugin
;Type=AlbumName
;OnChangeAction=[!SetOption GetImagePath Text "[*MeasureAlbumArtSpotify*]"][!CommandMeasure DoUpdate "Stop 1"][!CommandMeasure DoUpdate "Execute 1"]
;OnUpdateAction=[SetOption MeasureAlbumArtSpotify OnUpdateAction "a"]

[MeasureAlbumChangedNotifySelf]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Album
OnChangeAction=[!CommandMeasure DoUpdate "Stop 1"][!CommandMeasure DoUpdate "Execute 1"]
;OnUpdateAction=[!Log asdf][SetOption MeasureAlbumChangedNotify OnUpdateAction "a"]

[DoUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeProcess# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]