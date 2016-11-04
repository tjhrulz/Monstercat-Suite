[Rainmeter]
Group=DynamicColors
OnRefreshAction=[!CommandMeasure DoReadUpdate "Stop 1"][!CommandMeasure DoReadUpdate "Execute 1"]

[CalcColorsToUse]
Measure=Script
ScriptFile=#@#\scripts\GetColors.lua

[CalcAlbumHistogram]
Measure=Script
ScriptFile=#@#\scripts\GetAlbumColors.lua

[ReadColorsToUse]
Measure=Script
ScriptFile=#@#\scripts\ReadColors.lua

[GetSongInfo]
Measure=Script
ScriptFile="#@#\scripts\GetInfoGPMDP.lua"
FileToRead=#ReadPath#
UpdateDivider=10

[MeasureAlbumArtGPMDP]
Measure=String
String=#CURRENTPATH#DownloadFile\image1.jpg
Substitute="\":"\\"

[MeasureAlbumChangedNotifyGPMDP]
Measure=Plugin
Plugin=WebParser
URL=#CoverUrl#
Download=1
DynamicVariables=1
DownloadFile=image1.jpg
FinishAction=[!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]

[MeasureAlbumChangedNotifyGPMDPSelf]
Measure=Plugin
Plugin=WebParser
URL=#CoverUrl#
Download=1
DynamicVariables=1
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
FinishAction=[!CommandMeasure CalcColorsToUse "colorSelector('')"][!Updategroup DynamicColors][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[RunAverageColor]
Measure=Plugin
Plugin=RunCommand
OutputFile="#@#colors\Histogram.txt"
OutputType='ANSI'
DynamicVariables=1
FinishAction=[!CommandMeasure CalcColorsToUse "colorSelector('')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[DoWriteUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait 1 | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure CalcAlbumHistogram "GetColors('[MeasureAlbumArtGPMDP]')"]

[DoReadUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeColors# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure ReadColorsToUse "readColor('')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]