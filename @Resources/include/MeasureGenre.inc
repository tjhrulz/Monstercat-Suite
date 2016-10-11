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
IfMatchAction=[!SetVariable Color "#Electro#"][!CommandMeasure CalcVarationScript "varationize(#Electro#, #Color2Modifier#)"]
; Electronic/EDM
IfMatch2=EDM|Electronic|Breaks|Chillout|Bounce|Chill
IfMatchAction2=[!SetVariable Color "#EDM#"][!CommandMeasure CalcVarationScript "varationize(#EDM#, #Color2Modifier#)"]
; House/Progressive House
IfMatch3=House|Electro\sHouse|Progressive\sHouse
IfMatchAction3=[!SetVariable Color "#House#"][!CommandMeasure CalcVarationScript "varationize(#House#, #Color2Modifier#)"]
; Drum & Bass
IfMatch4=Drum\s&\sBass|DnB
IfMatchAction4=[!SetVariable Color "#DnB#"][!CommandMeasure CalcVarationScript "varationize(#DnB#, #Color2Modifier#)"]
; Dubstep
IfMatch5=Dubstep
IfMatchAction5=[!SetVariable Color "#Dubstep#"][!CommandMeasure CalcVarationScript "varationize(#Dubstep#, #Color2Modifier#)"]
; Drumstep
IfMatch6=Drumstep
IfMatchAction6=[!SetVariable Color "#Drumstep#"][!CommandMeasure CalcVarationScript "varationize(#Drumstep#, #Color2Modifier#)"]
; Glitch Hop
IfMatch7=Glitch\sHop|GlitchHop
IfMatchAction7=[!SetVariable Color "#GlitchHop#"][!CommandMeasure CalcVarationScript "varationize(#GlitchHop#, #Color2Modifier#)"]
; Trap
IfMatch8=Trap
IfMatchAction8=[!SetVariable Color "#Trap#"][!CommandMeasure CalcVarationScript "varationize(#Trap#, #Color2Modifier#)"]
; Trance
IfMatch9=Trance|Deep\sHouse
IfMatchAction9=[!SetVariable Color "#Trance#"][!CommandMeasure CalcVarationScript "varationize(#Trance#, #Color2Modifier#)"]
; Hard Dance
IfMatch10=Hard\sDance
IfMatchAction10=[!SetVariable Color "#HardDance#"][!CommandMeasure CalcVarationScript "varationize(#HardDance#, #Color2Modifier#)"]
; Nu Disco/Indie Dance
IfMatch11=Nu\sDisco|NuDisco|Disco|Indie\sDance|Electro\sSwing
IfMatchAction11=[!SetVariable Color "#NuDisco#"][!CommandMeasure CalcVarationScript "varationize(#NuDisco#, #Color2Modifier#)"]
; Future Bass
IfMatch12=Future|Future\sBass
IfMatchAction12=[!SetVariable Color "#FutureBass#"][!CommandMeasure CalcVarationScript "varationize(#FutureBass#, #Color2Modifier#)"]
; Here is an example for an custom genre. Colors need to be rgb(a) values.
IfMatch13=Mashup|Mash\sUp
IfMatchAction13=[!SetVariable Color "#Mashup#"][!CommandMeasure CalcVarationScript "varationize(#Mashup#, #Color2Modifier#)"]
IfNotMatchAction=[!SetVariable Color "#DefaultDynamicColor#"][!CommandMeasure CalcVarationScript "varationize(#DefaultDynamicColor#, #Color2Modifier#)"]

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