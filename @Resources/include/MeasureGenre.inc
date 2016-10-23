[Variables]
@include=#@#variables.ini
#[!CommandMeasure CalcBlurAlbumArt blur([MeasureAlbumArt] , [CalcEscapedFilePath])]
[Rainmeter]
OnRefreshAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[CalcVarationScript]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\colorVariationer.lua

[MeasureAlbumArt]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Cover
Substitute="\":"\\"

[MeasureAlbumArtSpotify]
Measure=String
String="#@#images\cover.png"
Substitute="\":"\\"

;[MeasureAlbumChangedNotifySpotify]
;Measure=Plugin
;Plugin=SpotifyPlugin
;Type=AlbumName
;OnChangeAction=[!SetOption GetAverageColor Parameter "[*MeasureAlbumArtSpotify*]"]

[MeasureAlbumChangedNotify]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Album
;OnChangeAction=[!SetOption GetAverageColor Parameter "[*MeasureAlbumArt*]"]

[GetAverageColor]
Measure=Plugin
Plugin=RunCommand
Program=#ROOTCONFIGPATH#GetColor.vbs
Parameter=[MeasureAlbumArtSpotify]
;FinishAction=[!SetOptionGroup DynamicDynamic DynamicVariables 0]

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""
OnChangeAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]