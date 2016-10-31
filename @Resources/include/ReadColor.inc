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
OnChangeAction=[!CommandMeasure DoReadUpdate "Stop 1"][!CommandMeasure DoReadUpdate "Execute 1"]

[MeasureAlbumChangedNotifySelf]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Title
OnChangeAction=[!CommandMeasure DoReadUpdate "Stop 1"][!CommandMeasure DoReadUpdate "Execute 1"]

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""

[MeasureConfig1State]
Measure=Plugin
Plugin=WebParser
URL=file://#SETTINGSPATH#Rainmeter.ini
RegExp=(?siU).*Monstercat\-Suite\\Background\\Slideshow.*Active=(.*)
StringIndex=1
FinishAction=[!EnableMeasure MeasureConfig1Active][!UpdateMeasure MeasureConfig1Active]

[MeasureConfig1Active]
Measure=Calc
Formula=[MeasureConfig1State]
DynamicVariables=1
UpdateDivider=-1
Disabled=1
IfCondition=MeasureConfig1Active > 0
IfTrueAction=[!SetOption MeasureWallpaper UpdateDivider #FactandImageUpdateRate#]
IfFalseAction=[!SetOption MeasureWallpaper UpdateDivider -1]

[MeasureWallpaper]
Measure=Calc
UpdateRandom=1
UpdateDivider=-1
OnChangeAction=[!Log "Doing update"][!CommandMeasure DoBlurUpdate "Stop 1"][!CommandMeasure DoBlurUpdate "Execute 1"]OnChangeAction=[!CommandMeasure DoWriteUpdate "Stop 1"][!CommandMeasure DoWriteUpdate "Execute 1"]


[DoReadUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeColors# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]