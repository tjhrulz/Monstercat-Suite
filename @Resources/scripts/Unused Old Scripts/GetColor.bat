%1@Resources\ImageMagickScripts\convert.exe %2  -scale 1x1! -format %%[fx:int(255*r+.5)],%%[fx:int(255*g+.5)],%%[fx:int(255*b+.5)] info: > test.txt