#A WIP rainmeter suite based on the Monstercat Visualizer skin by marcopixel.
Includes Do I need a jacket support from FlyingHyrax, multiple system info and networking meters. More to come

#Example from latest release
![alt text](http://i.imgur.com/QGcgfsr.png "Example of full dev setup using Google Play Music")

#Examples
![alt text](http://i.imgur.com/0RQkrPo.png "Example using Spotify album art")
![alt text](http://i.imgur.com/xMnjmQ3.png "Example using iTunes album art")
![alt text](http://i.imgur.com/oQHPdZH.png "Example using Google Play Music album art")
![alt text](http://i.imgur.com/Nihw4QV.png "Example using iTunes genre")
![alt text](http://i.imgur.com/YupiDIK.png "Example using iTunes genre and album art")


==============================================================================
#Highly Tentative Roadmap

##Current Major Version
* v0.7.0  Skins that support laptop/desktop specific features, Multigraph CPU, GPU, and IO graphs  
* v0.7.1 Logos that support system info  
* v0.7.2 Auto seasonal and holiday fallback images (Having issues finding images)  
* v0.7.5r GPMDP Support (Likely will a very be limited version similar to how spotify was at first, I will look into a websocket plugin later if I don't go my own route)  
* v0.7.6c Toggle visibility buttons, Label verbosity configuration  
* v0.7.10 Use new BetterMusicPlugin for Google Play music support, general CPU enhancements  
* v0.7.11 Small versions of music player and clock?, volume changer  
* v0.7.15 Reworked ReadColor to update itself on finish of GetColor (I think I have figured out a way to do this)

##Future Major Versions
* v0.8.0r - Weather & News support  
* v0.9.0r - Appointments  
* v0.9.5r - Calendar  
* v1.0.0r - Installer updated, Notification system, App launcher, full planned meter feature set  

##Post 1.0
* v1.1r - Support for dynamic color keyboards  
* v1.2r - Networking top processes plugin  
* v2.0r - Machine learning album art color selector, I'm kidding (Maybe)  

##When they are done
* Plugin that will get music info form GPMDP, Soundnode, and potentially from supported websites when using chrome  

###Small versionless future changes
* Flag and pull based album art color system? (Will require me to find a way to do this)  
* Visualizer version of PCMR circle logo  
* Registry editing of system colors since the auto color picker in windows is sometimes meh? HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM  
* Background sideshow - There was issues with CPU and RAM usage of queueing up that many requests and it would do them all at once and pull them off of a stack once requested eating up RAM even when not using it. Ill rebuild using Lua eventually and see if that fixes it. Also was always getting passed the old image  
* Meters will change to variant on middle click, I only wanna do this if it can include the alt system  
* Add more versions of CPU and GPU info (I don't think I will do this as the info is not too needed (And I don't need to see my FPS hit 59 and want to replace my computer) and all new and old info would need to be labeled to differentiate it 
* Large 12 hour clock (With variant where 12hr is replaced by Monstercat logo)  
* A version of the RSS display for displaying mobile versions of websites? I found a way to display in an iframe in rainmeter, doubt I will do this though as it feels too much.  
* Complimentary colors update, I wrote the whole system for this and my calculations are sometimes off by a little bit which is fine but it really does not look good.  
* Button to toggle visibility of small meters and side panels (Similar to enigma)  
* Little icon individual program launchers to match the button mentioned above  
* Modified versions of the logos that integrate simple system status (CPU, GPU, Ping are the 3 I am thinking about doing)  

#Bugs

##Always
- [ ] If you are using a spotify meter and spotify is running and playing and you reload a meter it will not update the color but instead use the old color
- [ ] Spotify info stays on spotify close instead of switch to fallback and saying N/A
- [ ] When spotify isn't running there is a lot of log spam, I think this is from the plugin and not my misuse of it hopefully I can turn it off
- [ ] When using songs that are in the cloud on iTunes images do not work, I think this is an issue with iTunes and not me
- [X] Pinging conditionals do not work after first time they are triggered
- [ ] Check and possibly fix if DINTFMI only working on first load since afterwards it may always use old data
- [ ] Look into if CPU being off by about a factor of about 2 (Seems to be half actual on advancedCPU and ferpnom) on CPU reader and top processes is a bug in task manager, rainmeter dlls, or if it is just my machine
- [ ] Installer is not updated and should not be used
- [ ] Using the music switcher multiple times in rapid succesion can cause rainmeter to crash Update: looking at log file I am guessing that the regex is the culprit, my guess is that if the regex is rerun before finsihing it crashes

##Unlikely
- [ ] Multiple color values below of above the color cutoff for can lead to multiple of the same color, however just shifting everything by the cutoff amount could also result in a color being the same as well, I think I will rewrite the cutoff to look for dupes and if there are the add more colors from the list
- [ ] Sometimes the image is unable to load for the background image
- [X] There is no char limit in the top process meters, thus it is possible for a executable with a long name to display under the usage percent and draw beyond the width of the meter

##Very Unlikely
- [ ] GPMDP when skipping very fast (Like before album art downloads) repeatedly can end up locking the album art requiring you to restart rainmeter
- [ ] If the fallback image finishes computing the image inbetween songs and before its thread gets killed and the song album art blur computes quickly it is possible for the album art blur to be the fallback image instead of the album art image (This was really hard to reproduce)
- [ ] Rarely a thread is detected as running but when it goes to be killed it is already dead, likely is finishing gracefully before the kill command happens. Not a major bug just causes occasional log spam

##Minor
- [ ] Several bars variants need to be checked for code consistency, such as percentual being set on some of the ferpnom meters, process being spelled wrong, or other logical bugs, and missoptimizations within them
- [ ] Top processes bars do not use scale value on AdvancedCPU meters (Low priority due to percentual possibly scaling based on max value causing for percentage changes)
- [ ] Album art color fetch runs when a genre color will end up being decided (Not as big a deal as I figured it would be since histogram takes up little cpu time)
- [ ] Dynamic variables are turned on unnecessarily, many meters can be made to have better performance
- [ ] There is an extra file in the image directory called cover (No extension) that downloads on every song change on spotify, not sure why seems to have been introduced in commit 5cf865deacb6fcb190180a7595d5516532e1dfb5 or the commit before it

#Info for development

##TODO
- [ ] Make cut off for number of colors to sort based off of a percent of the 1st colors count, I dont think I will do this though as it will favor lighter or darker colors Update: I think I am going to do the next thing on the todo list instead
- [ ] Make interesting colors be higher on the list of colors (I think I could try to measure this quickly by looking at how far away it is from monochrone)
- [X] Figure out what I am doing with the 4th thing on the IO meter and if I am keeping it swap it needs fixed.
- [ ] Change meters update rates to match the measure to save CPU? Liekly wont save much but could be a nice last pass for optimization (But I think I will keep histograms at half their measure rate as IMO they look better at 2 pixels wide)
- [ ] Add news RSS
- [ ] Weather stuffs (Use http://wxdata.weather.com/wxdata/weather/local/#LocationCode#?cc=*&unit=#TempUnit#&dayf=6 and parse, thanks to jsmorley for his post on that had no idea weather.com had an rss version (It even has wind direction!))
- [ ] Calendar for the month meter
- [ ] Appointments meter
- [X] Make desktop and laptop versions of some meters, ie. desktop doesn't need wifi or battery info, laptop may not need GPU info Update: I think this is at the point I am happy with it but will keep it on the list as I may add more
- [ ] Notification system (using IFTTT and pushover?) Edit: Nevermind Pushover only allows apps to send notifications, receiving must be done in a special app and is as the name implies push based not pull based.
- [ ] Get real fact from fact repository and mix them in with fact sphere facts Update: Now has a separated version, needs a joint version
- [ ] Add support for audio playback of fact sphere on left click?
- [X] Make sure background cmds are closing gracefully and correctly and not staying open
- [X] Process is spelled Process(hehe regex fixed it here) in several places throughout the codebase, not causing any bugs as it is spelled that way throughout the file but it bothers me, Ill get around to regexing it someday
- [X] Make labels consistent and add a 3 step toggle (None, some, all)
- [ ] Update installer meter to make initial setup nicer (Do before v1.0)
- [ ] Look into hacking in Google play music (And youtube?) support to the music reader (I believe Google Talk/G+ used to expose this info) Update: GPMDP has basic support and I am working on a full fledged plugin right now
- [ ] Look into making networking top process plugin
- [ ] Look into if average size variable in visualizer increases or decrease performance based on size (kind of irrelevant now with CPU usage being better I just want to document it right)
- [ ] Look into adding corsair and other keyboards manufactures color API's into the color system, I do not have a full RGB (Mine only does green) so I will need a guinea pig
- [X] Add a widget to switch between different music sources Update: Very basic one added Update: Full implementation now switches everything
- [ ] Separate color options based on music source? (May not be needed once the transition is made to the new plugin) Update: Will be needed unless I wanna rewrite a lot of code in the plugins, gonna just build the dynamic stuff in here
- [ ] Investigate extra cover file

##Possible Future Changes
- [ ] Use the color from GPMDP as a color option? Update: Will be possible with the GPMDP websocket API in a future update not available to do yet
- [ ] Once released see if advancedCPU is really needed and remove it? (Not till after I get enough people using it to make a judgment on this)
- [ ] Decide if I want to make max for top process meters be less user configurable/Require more knowledge of your machine to change (How many cores)
- [ ] Add missing part of DINAJ hovertext?
- [ ] Look into fixed number position on right aligned meter info (Either the start or honestly it looks good enough if just the postfixes started at the same place it would be good enough) Update: Looks fine without it dont think I will do
- [ ] Padding has been removed do I want to add it back as a toggle? Would it apply to everything or just text? (If I do apply AccurateText) Update: Rainmeter has a padding option, will look into it
- [ ] Make middle click always cause a refresh of data (likely will not do with this giving me issues before and CPU usage being so low now) and double click cycle through variants?
- [ ] Make it so meters can be auto scaled to fit height/width given by user. ie. 1920,10 would make 10 meters perfectly spaced across a 1080p display (Really dont think I will do this unless I make meters intended to do on the top and bottom of screen that are not the notification system))