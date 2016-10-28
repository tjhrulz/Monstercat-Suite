[Variables]

[Rainmeter]
Group=DynamicColors
OnRefreshAction=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"]

[ReadColorsToUse]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\ReadColors.lua

;[MeasureAlbumChangedNotifySpotify]
;Measure=Plugin
;Plugin=SpotifyPlugin
;Type=AlbumName
;OnChangeAction=[!SetOption GetImagePath Text "[*MeasureAlbumArtSpotify*]"][!CommandMeasure DoUpdate "Stop 1"][!CommandMeasure DoUpdate "Execute 1"]
;OnUpdateAction=[!SetOption GetImagePath Text "[*MeasureAlbumArtSpotify*]"][SetOption MeasureAlbumArtSpotify OnUpdateAction "a"]

[MeasureAlbumChangedNotify]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Album
;OnChangeAction=[!SetOption GetImagePath Text "[*MeasureAlbumArt*]"][!CommandMeasure DoUpdate "Stop 1"][!CommandMeasure DoUpdate "Execute 1"]
;OnUpdateAction=[!SetOption GetImagePath Text "[*MeasureAlbumArt*]"][!Log asdf][SetOption MeasureAlbumChangedNotify OnUpdateAction "a"]

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""