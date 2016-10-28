[Variables]
#[!CommandMeasure CalcBlurAlbumArt blur([MeasureAlbumArt] , [CalcEscapedFilePath])]

[Rainmeter]
#OnRefreshAction=[!CommandMeasure DoUpdate "Execute 1"]

[CalcColorsToUse]
Measure=Script
ScriptFile=#@#\scripts\GetColors.lua

[CalcAlbumHistogram]
Measure=Script
ScriptFile=#@#\scripts\GetAlbumColors.lua

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
;OnChangeAction=[!SetOption GetImagePath Text "[*MeasureAlbumArtSpotify*]"][!CommandMeasure DoUpdate "Stop 1"][!CommandMeasure DoUpdate "Execute 1"]
;OnUpdateAction=[!SetOption GetImagePath Text "[*MeasureAlbumArtSpotify*]"][SetOption MeasureAlbumArtSpotify OnUpdateAction "a"]

[MeasureAlbumChangedNotify]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Album
OnChangeAction=[!SetOption GetImagePath Text "[*MeasureAlbumArt*]"][!CommandMeasure DoUpdate "Stop 1"][!CommandMeasure DoUpdate "Execute 1"]
;OnUpdateAction=[!SetOption GetImagePath Text "[*MeasureAlbumArt*]"][!Log asdf][SetOption MeasureAlbumChangedNotify OnUpdateAction "a"]

[GetImagePath]
Measure=String
Text="#@#images\Fallback.png"
DynamicVariables=1

[RunFallbackAverageColor]
Measure=Plugin
Plugin=RunCommand
OutputFile="#@#colors\Histogram.txt"
OutputType='ANSI'
DynamicVariables=1
FinishAction=[!CommandMeasure CalcColorsToUse "colorSelector('[MeasureGenre]')"][!Updategroup DynamicColors][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[RunAverageColor]
Measure=Plugin
Plugin=RunCommand
OutputFile="#@#colors\Histogram.txt"
OutputType='ANSI'
DynamicVariables=1
FinishAction=[!CommandMeasure CalcColorsToUse "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[DoUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeFetch# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure CalcAlbumHistogram "GetColors()"]

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""