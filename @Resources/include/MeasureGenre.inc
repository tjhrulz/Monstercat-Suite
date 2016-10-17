[Variables]
@include=#@#variables.ini
#[!CommandMeasure CalcBlurAlbumArt blur([MeasureAlbumArt] , [CalcEscapedFilePath])]
[Rainmeter]
OnRefreshAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[CalcEscapedFilePath]
Measure=String
String="#@#images\"
Substitute="\":"\\"

[CalcBlurAlbumArt]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\albumArtBlur.lua

[CalcVarationScript]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\colorVariationer.lua

[MeasureAlbumArt]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Cover
Substitute="\":"\\"
OnChangeAction=[!CommandMeasure CalcBlurAlbumArt "blur('[MeasureAlbumArt], [CalcEscapedFilePath]')"]

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""
OnChangeAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]