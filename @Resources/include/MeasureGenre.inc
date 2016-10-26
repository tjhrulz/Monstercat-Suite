[Variables]
@include=#@#variables.ini
#[!CommandMeasure CalcBlurAlbumArt blur([MeasureAlbumArt] , [CalcEscapedFilePath])]

[Rainmeter]
OnRefreshAction=[!CommandMeasure DoUpdate "Stop 1"][!CommandMeasure DoUpdate "Execute 1"]

[CalcVarationScript]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\colorVariationer.lua

[CalcAlbumArtColorScript]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\GetColor.lua

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
;OnChangeAction=[!SetOption GetImagePath Text "[*MeasureAlbumArtSpotify*]"]

[MeasureAlbumChangedNotify]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Album
OnChangeAction=[!SetOption GetImagePath Text "[*MeasureAlbumArt*]"]

[GetImagePath]
Measure=String
;Text="#@#images\Fallback.png"
DynamicVariables=1

[RunAverageColor]
Measure=Plugin
Plugin=RunCommand
OutputFile="output.txt"
OutputType='ANSI'
DynamicVariables=1
;FinishAction=[!SetOptionGroup DynamicDynamic DynamicVariables 0]

[CalcRootFilePath]
Measure=String
Text="#ROOTCONFIGPATH#"
Substitute="\":"\\"

[DoUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Wait #WaitTimeFetch# | ProcessUpdate1 | Wait #WaitTimeFetch# | ProcessUpdate2 | Wait #WaitTimeProcess# | DoDynamicUpdate
ProcessUpdate1=[!CommandMeasure CalcAlbumArtColorScript "GetColors(#EnableMultiColors#)"]
ProcessUpdate2=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"]
DoDynamicUpdate=[!SetOptionGroup DynamicDynamic DynamicVariables 0]

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""
OnChangeAction=[!CommandMeasure DoUpdate "Stop 1"][!CommandMeasure DoUpdate "Execute 1"]