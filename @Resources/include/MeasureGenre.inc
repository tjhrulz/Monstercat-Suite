[Variables]
@include=#@#variables.ini

[CalcVarationScript]
Measure=Script
ScriptFile=#ROOTCONFIGPATH#\colorVariationer.lua

[MeasureGenre]
Measure=Plugin
Plugin=NowPlaying
PlayerName=#PlayerName#
PlayerType=Genre
UpdateDivider=10
; You can add your own genres here.
; Use | as dividier and replace spaces with \s (otherwise it won't work)
; Electro
IfMatch=Electro
IfMatchAction=[!CommandMeasure CalcVarationScript "varationizer(#Electro#)"]
; Electronic/EDM
IfMatch2=EDM|Electronic|Breaks|Chillout|Bounce|Chill
IfMatchAction2=[!CommandMeasure CalcVarationScript "varationizer(#EDM#)"]
; House/Progressive House
IfMatch3=House|Electro\sHouse|Progressive\sHouse
IfMatchAction3=[!CommandMeasure CalcVarationScript "varationizer(#House#)"]
; Drum & Bass
IfMatch4=Drum\s&\sBass|DnB
IfMatchAction4=[!CommandMeasure CalcVarationScript "varationizer(#DnB#)"]
; Dubstep
IfMatch5=Dubstep
IfMatchAction5=[!CommandMeasure CalcVarationScript "varationizer(#Dubstep#)"]
; Drumstep
IfMatch6=Drumstep
IfMatchAction6=[!CommandMeasure CalcVarationScript "varationizer(#Drumstep#)"]
; Glitch Hop
IfMatch7=Glitch\sHop|GlitchHop
IfMatchAction7=[!CommandMeasure CalcVarationScript "varationizer(#GlitchHop#)"]
; Trap
IfMatch8=Trap
IfMatchAction8=[!CommandMeasure CalcVarationScript "varationizer(#Trap#)"]
; Trance
IfMatch9=Trance|Deep\sHouse
IfMatchAction9=[!CommandMeasure CalcVarationScript "varationizer(#Trance#)"]
; Hard Dance
IfMatch10=Hard\sDance
IfMatchAction10=][!CommandMeasure CalcVarationScript "varationizer(#HardDance#)"]
; Nu Disco/Indie Dance
IfMatch11=Nu\sDisco|NuDisco|Disco|Indie\sDance|Electro\sSwing
IfMatchAction11=[!CommandMeasure CalcVarationScript "varationizer(#NuDisco#)"]
; Future Bass
IfMatch12=Future|Future\sBass
IfMatchAction12=[!CommandMeasure CalcVarationScript "varationizer(#FutureBass#)"]
; Here is an example for an custom genre. Colors need to be rgb(a) values.
IfMatch13=Mashup|Mash\sUp
IfMatchAction13=[!CommandMeasure CalcVarationScript "varationizer(#Mashup#)"]
IfNotMatchAction=[!CommandMeasure CalcVarationScript "varationizer(#DefaultDynamicColor#)"]

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