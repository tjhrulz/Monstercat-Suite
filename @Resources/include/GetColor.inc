[Rainmeter]
OnRefreshAction=[!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]

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
Substitute="\":"\\"

[MeasureAlbumArtSpotify]
Measure=String
Text="#@#images\cover.png"

;[MeasureAlbumChangedNotifySpotify]
;Measure=Plugin
;Plugin=SpotifyPlugin
;Type=AlbumName
;OnChangeAction=[!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]
;OnUpdateAction=[SetOption MeasureAlbumArtSpotify OnUpdateAction "a"]

[MeasureAlbumChangedNotify]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Album
OnChangeAction=[!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]
;OnUpdateAction=[!Log asdf][SetOption MeasureAlbumChangedNotify OnUpdateAction "a"]

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

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""

[DoWriteUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeFetch# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure CalcAlbumHistogram "GetColors('[MeasureAlbumArt]')"]