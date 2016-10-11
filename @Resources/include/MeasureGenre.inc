[Variables]
@include=#@#variables.ini

[Rainmeter]
OnRefreshAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"]

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
OnChangeAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"]

; Styles
[StyleStaticBar]
BarColor=#Color#
[StyleStaticMeter]
SolidColor=#Color#
[StyleStaticTint]
ImageTint=#Color#

[StyleGenreMeter]
SolidColor=#Color#
DynamicVariables=1
[StyleGenreBar]
BarColor=#Color#
DynamicVariables=1
[StyleGenreTint]
ImageTint=#Color#
DynamicVariables=1