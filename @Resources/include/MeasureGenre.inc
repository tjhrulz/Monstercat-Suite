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

[MeasureAlbumArtSpotify]
Measure=String
Text="#@#images\cover.png"

;[MeasureAlbumChangedNotifySpotify]
;Measure=Plugin
;Plugin=SpotifyPlugin
;Type=AlbumName
;OnChangeAction=[!SetOption GetAverageColor Text "[*MeasureAlbumArtSpotify*]"]

[MeasureAlbumChangedNotify]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Album
OnChangeAction=[!SetOption GetAverageColor Text "[*MeasureAlbumArt*]"]

[GetAverageColor]
Measure=String
Text="#@#images\cover.png"

[RunAverageColor]
Measure=Plugin
Plugin=RunCommand
Program="cmd \U"
State=Show
OutputFile="asdf.txt"
;FinishAction=[!SetOptionGroup DynamicDynamic DynamicVariables 0]

[CalcRootFilePath]
Measure=String
Text="#ROOTCONFIGPATH#"
Substitute="\":"\\"

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""
OnChangeAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]