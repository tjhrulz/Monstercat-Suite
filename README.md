A WIP rainmeter suite based on the Monstercat Visualizer skin by marcopixel.

Includes Do I need a jacket support from FlyingHyrax, multiple system info and networking meters. More to come

Tentative Roadmap (things may take longer or be scrapped based on difficulty)
v0.7.0  Skins that support laptop/desktop specific features, Multigraph CPU, GPU, and IO graphs
v0.7.1 Logos that support system info
v0.7.2r Auto seasonal and holiday fallback images (Having issues finding images)
v0.7.3 Toggle visibility buttons
v0.7.5r Flag and pull based album art color system? GPMDP Support (Likely will a very be limited version similar to how spotify was at first I will look into their API and see if I can add the missing stuff that isn't in the example in future releases)
v0.7.6 Small versions of music player and clock?, volume changer
v0.7.10 Registry editing of system colors since the auto color picker in windows is sometimes meh? HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM

v0.8.0r - Weather & News support
v0.9.0r - Appointments
v0.9.5r - Calendar
v1.0.0r - Installer updated, Notification system, App launcher, full planned meter feature set
--Highly-Tentative--------------------------------------------------------------
v1.1r - Support for dynamic color keyboards
v1.2r - Google play music (web) plugin? and Networking top processes plugin
v1.3r - Machine learning album art selector, I'm kidding (Maybe)

May happen eventually
Visualizer version of PCMR circle logo
Background sideshow - There was issues with CPU and RAM usage of queueing up that many requests and it would do them all at once and pull them off of a stack once requested eating up RAM even when not using it. Ill rebuild using Lua eventually and see if that fixes it. Also was always getting passed the old image
Meters will change to variant on middle click, I only wanna do this if it can include the alt system
Add more versions of CPU and GPU info (I don't think I will do this as the info is not too needed (And I don't need to see my FPS hit 59 and want to replace my computer) and all new and old info would need to be labeled to differentiate it 
Large 12 hour clock (With variant where 12hr is replaced by Monstercat logo)
A version of the RSS display for displaying mobile versions of websites? I found a way to display in an iframe in rainmeter, doubt I will do this though as it feels too much.
Complimentary colors update, I wrote the whole system for this and my calculations are sometimes off by a little bit which is fine but it really does not look good.
Button to toggle visibility of small meters and side panels (Similar to enigma)
Little icon individual program launchers to match the button mentioned above
Modified versions of the logos that integrate simple system status (CPU, GPU, Ping are the 3 I am thinking about doing)

------------------------------------------------------------------------
Anything past this point is written more for myself and may be confusing
------------------------------------------------------------------------
TODO
- [ ] Make cut off for number of colors to sort based off of a percent of the 1st colors count, I dont think I will do this though as it will favor lighter or darker colors Update: I think I am going to do the next thing on the todo list instead
- [ ] Make interesting colors be higher on the list of colors (I think I could try to measure this quickly by looking at how far away it is from monochrone)
- [ ] Use WiFiListLimit and WifiList to make users picking the right wireless card easier
- [ ] Figure out what I am doing with the 4th thing on the IO meter and if I am keeping it swap it needs fixed.
- [ ] Look into using an update rate of -1 for color stuff and have the dynamic system manually tell the measures to update to conserve more CPU and have everything change at same time
- [ ] Add news RSS
- [ ] Weather stuffs (Use http://wxdata.weather.com/wxdata/weather/local/#LocationCode#?cc=*&unit=#TempUnit#&dayf=6 and parse, thanks to jsmorley for his post on that had no idea weather.com had an rss version (It even has wind direction!))
- [ ] Calendar for the month meter
- [ ] Appointments meter
- [ ] Make desktop and laptop versions of some meters, ie. desktop doesn't need wifi or battery info, laptop may not need GPU info
- [ ] Notification system (using IFTTT and pushover?) Edit: Nevermind Pushover only allows apps to send notifications, receiving must be done in a special app and is as the name implies push based not pull based.
- [ ] Get real fact from fact repository and mix them in with fact sphere facts Update: Now has a separated version, needs a joint version
- [ ] Add support for audio playback of fact sphere on left click?
- [ ] Make sure background cmds are closing gracefully and correctly and not staying open
- [ ] Process is spelled Proces in several places throughout the codebase, not causing any bugs as it is spelled that way throughout the file but it bothers me, Ill get around to regexing it someday
- [ ] Make labels consistent and add a 3 step toggle (None, some, all)
- [ ] Final optimization pass
- [ ] Update installer meter to make initial setup nicer (Do before v1.0)
- [ ] Look into hacking in Google play music (And youtube?) support to the music reader (I believe Google Talk/G+ used to expose this info)
- [ ] Look into making networking top process plugin
- [ ] Look into if average size variable increases or decrease performance based on size (kind of irrelevant now with CPU usage being better I just want to document it right)
- [ ] Look into adding corsair and other keyboards manufactures color API's into the color system, I do not have a full RGB (Mine only does green) so I will need a guinea pig
Bugs
Always
- [ ] If you are using a spotify meter and spotify is running and playing and you reload a meter it will not update the color but instead use the old color
- [ ] Spotify info stays on spotify close instead of switch to fallback and saying N/A
- [ ] When spotify isn't running there is a lot of log spam, I think this is from the plugin and not my misuse of it hopefully I can turn it off
- [ ] When using songs that are in the cloud on iTunes images do not work, I think this is an issue with iTunes and not me
- [ ] Pinging conditionals do not work after first time they are triggered Update: I have disabled for now so MaxPingDisplayed is ignored
- [ ] Check and possibly fix if DINTFMI only working on first load since afterwards it may always use old data
- [ ] Look into if CPU being off by about a factor of about 2 (Seems to be half actual on advancedCPU and ferpnom) on CPU reader and top processes is a bug in task manager, rainmeter dlls, or if it is just my machine
Unlikely
- [ ] Multiple color values below of above the color cutoff for can lead to multiple of the same color, however just shifting everything by the cutoff amount could also result in a color being the same as well, I think I will rewrite the cutoff to look for dupes and if there are the add more colors from the list
- [ ] Sometimes the image is unable to load for the background image
Very Unlikely
- [ ] GPMDP when skipping very fast (Like before album art downloads) repeatedly can end up locking the album art requiring you to restart rainmeter
- [ ] If the fallback image finishes computing the image inbetween songs and before its thread gets killed and the song album art blur computes quickly it is possible for the album art blur to be the fallback image instead of the album art image (This was really hard to reproduce)
- [ ] Album art color fetch runs when a genre color will end up being decided (Not as big a deal as I figured it would be, blur takes up way more cpu time)
- [ ] Rarely a thread is detected as running but when it goes to be killed it is already dead, likely is finishing gracefully before the kill command happens. Not a major bug just causes occasional log spam
Minor
- [ ] Several bars variants need to be checked for code consistency, such as percentual being set on some of the ferpnom meters, process being spelled wrong, or other logical bugs, and missoptimizations within them
- [ ] Top processes bars do not use scale value on AdvancedCPU meters (Low priority due to percentual possibly scaling based on max value causing for percentage changes)

Possible Future Changes
- [ ] Use the color from GPMDP as a color option?
- [ ] Once released see if advancedCPU is really needed and remove it? (Not till after I get enough people using it to make a judgment on this)
- [ ] Decide if I want to make max for top process meters be less user configurable/Require more knowledge of your machine to change (How many cores)
- [ ] Add missing part of DINAJ hovertext?
- [ ] Look into fixed number position on right aligned meter info (Either the start or honestly it looks good enough if just the postfixes started at the same place it would be good enough)
- [ ] Padding has been removed do I want to add it back as a toggle? Would it apply to everything or just text? (If I do apply AccurateText) Update: Rainmeter has a padding option, will look into it
- [ ] Make middle click always cause a refresh of data (likely will not do with this giving me issues before and CPU usage being so low now) and double click cycle through variants?
- [ ] Make it so meters can be auto scaled to fit height/width given by user. ie. 1920,10 would make 10 meters perfectly spaced across a 1080p display (Really dont think I will do this unless I make meters intended to do on the top and bottom of screen that are not the notification system))