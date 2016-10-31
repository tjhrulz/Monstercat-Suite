[Rainmeter]
Group=DynamicColors
OnRefreshAction=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0][!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]

[CalcColorsToUse]
Measure=Script
ScriptFile=#@#\scripts\GetColors.lua

[CalcAlbumHistogram]
Measure=Script
ScriptFile=#@#\scripts\GetAlbumColors.lua

[CalcEscapedFilePath]
Measure=String
String="#@#images\coverB-0.#WallpaperImageType#"
Substitute="\":"\\"

[CalcBlurAlbumArt]
Measure=Script
ScriptFile=#@#\scripts\albumArtBlur.lua

[GetImagePath]
Measure=String
String=[MeasureWallpaper]
Substitute="\":"\\"
DynamicVariables=1

[ReadColorsToUse]
Measure=Script
ScriptFile=#@#\scripts\ReadColors.lua

[MeasureWallpaper]
Measure=Plugin
Plugin=QuotePlugin
PathName=#BackgroundPathName#
UpdateDivider=#FactandImageUpdateRate#
OnChangeAction=[!CommandMeasure DoBlurUpdate "Stop 1"][!CommandMeasure DoBlurUpdate "Execute 1"][!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]

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

[MeasureChangeBackground]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait 1 | DoMyDynamicUpdate
IfCondition=(#ChangeWallpaper# = 1)
IfTrueAction=[!SetOption MeasureChangeBackground DoMyDynamicUpdate """[!SetOptionGroup backgroundArt DynamicVariables 0][!SetWallpaper #@#images\coverB-0.#WallpaperImageType# "Stretch"]"""]
IfCondition2=(#ChangeWallpaper# <> 1)
IfTrueAction2=[!SetOption MeasureChangeBackground DoMyDynamicUpdate """[!SetOptionGroup backgroundArt DynamicVariables 0]"""]

[RunBlurColor]
Measure=Plugin
Plugin=RunCommand
DynamicVariables=1
FinishAction=[!CommandMeasure MeasureChangeBackground "Stop 1"][!CommandMeasure MeasureChangeBackground "Execute 1"]

[RunBlurColorFallback]
Measure=Plugin
Plugin=RunCommand
FinishAction=[!CommandMeasure MeasureChangeBackground "Stop 1"][!CommandMeasure MeasureChangeBackground "Execute 1"]

[DoBlurUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait 1 | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure CalcBlurAlbumArt "blur('[CalcEscapedBackgroundPath]','[CalcEscapedFilePath]')"]

[DoWriteUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait 100 | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure CalcAlbumHistogram "GetColors('[GetImagePath]')"]

[DoReadUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeColors# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure ReadColorsToUse "readColor('')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]