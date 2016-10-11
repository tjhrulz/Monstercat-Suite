[Variables]
@include=#@#variables.ini

[Rainmeter]
OnRefreshAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

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
OnChangeAction=[!CommandMeasure CalcVarationScript "colorSelector('[MeasureGenre]')"][!SetOptionGroup DynamicDynamic DynamicVariables 0]

; Styles
[StyleStaticBar]
BarColor=#VizColor#

[StyleGenreBar]
BarColor=#VizColor#
DynamicVariables=1