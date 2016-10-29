[Rainmeter]
Group=DynamicColors
OnRefreshAction=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0][!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]

[CalcColorsToUse]
Measure=Script
ScriptFile=#@#\scripts\GetColors.lua

[CalcAlbumHistogram]
Measure=Script
ScriptFile=#@#\scripts\GetAlbumColors.lua

[ReadColorsToUse]
Measure=Script
ScriptFile=#@#\scripts\ReadColors.lua

[MeasureAlbumArtSpotify]
Measure=String
String=#@#images\cover.png
Substitute="\":"\\"

[MeasureAlbumChangedNotifySpotify]
Measure=Plugin
Plugin=SpotifyPlugin
Type=AlbumName
OnChangeAction=[!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]

[MeasureAlbumChangedSpotifyNotifySelf]
Measure=Plugin
Plugin=SpotifyPlugin
Type=AlbumName
OnChangeAction=[!CommandMeasure DoReadUpdate "Stop 1"][!CommandMeasure DoReadUpdate "Execute 1"]

[GetImagePath]
Measure=String
Text=""
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
ProcessUpdate1=[!CommandMeasure CalcAlbumHistogram "GetColors('[MeasureAlbumArtSpotify]')"]

[DoReadUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeColors# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]