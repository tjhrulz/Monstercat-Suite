[Rainmeter]
;Group=DynamicColors
OnRefreshAction=[!CommandMeasure DoReadUpdate "Stop 1"][!CommandMeasure DoReadUpdate "Execute 1"]

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

[GetSongInfo]
Measure=Script
ScriptFile="#@#\scripts\GetInfoGPMDP.lua"
FileToRead=#ReadPath#
UpdateDivider=1

[MeasureAlbumArtGPMDP]
Measure=String
String=#CURRENTPATH#DownloadFile\image1.jpg
Substitute="\":"\\"
UpdateDivider = -1
Group = AlbumArtUpdate
OnUpdateAction=[!CommandMeasure DoReadUpdate "Stop 1"][!CommandMeasure DoReadUpdate "Execute 1"]

[MeasureAlbumChangedNotifyGPMDP]
Measure=Plugin
Plugin=WebParser
URL=#GPMSongAlbumArt#
DynamicVariables=1
Download=1
DownloadFile=image1.jpg
UpdateRate = -1
FinishAction=[!UpdateMeterGroup CoverGroup]

;[MeasureWallpaperConfigState]
;Measure=Plugin
;Plugin=WebParser
;URL=file://#SETTINGSPATH#Rainmeter.ini
;RegExp=(?siU)\[Monstercat-Suite\\Background\\Slideshow\].*?Active=(\d+)
;StringIndex=1
;FinishAction=[!EnableMeasure MeasureWallpaperChangedNotifySelf][!UpdateMeasure MeasureWallpaperChangedNotifySelf]
;
;[MeasureWallpaperChangedNotifySelf]
;Measure=Calc
;Formula=[MeasureWallpaperConfigState]
;DynamicVariables=1
;UpdateDivider=-1
;Disabled=1
;IfCondition=MeasureWallpaperChangedNotifySelf > 0
;IfTrueAction=[!CommandMeasure DoReadUpdateRepeat "Execute 1"]

[DoReadUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeColors# | ProcessUpdate1 
ProcessUpdate1=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

;[DoReadUpdateRepeat]
;Measure=Plugin
;Plugin=ActionTimer
;ActionList1=Wait #WaitTimeColors# | Repeat ProcessUpdate1R, #FactandImageUpdateRatems#, 10000
;ProcessUpdate1R=[!CommandMeasure ReadColorsToUse "readColor('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]