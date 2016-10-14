[Variables]
@include=#@#variables.ini

[Rainmeter]
OnRefreshAction=[!CommandMeasure CalcBlurAlbumArt "blur('#@#images\coverB.png')"][!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

[CalcBlurAlbumArt]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\albumArtBlur.lua

[CalcVarationScript]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\colorVariationer.lua

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
RegExpSubstitute=1
Substitute="[^a-zA-Z0-9]":""
OnChangeAction=[!CommandMeasure CalcBlurAlbumArt "blur('#@#images\\coverB.png')"][!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]