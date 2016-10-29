A WIP rainmeter suite based on the Monstercat Visulizer skin by marcopixel.

Includes Do I need a jacket support from FlyingHyrax, multiple system info and networking meters. More to come

Tentative Roadmap (things may take longer or be scrapped based on difficulty)
v0.6.10r - Blur wallpaper support (Maybe 0.7), album art color support (Will offer both a single color and a multi color support (See palette system for android for what I want to do)

v0.7.0r aka Laptop/Desktop support - GPU, Wireless, multiHDD toggles, add plguins to this release and may start showing off suite, Multigraph CPU and GPU graphs (Would match the networking and processing combined graphs) 
v0.8.0r MVP - Weather & News support, likely first public release
v0.9.0r - Appointments
v0.9.5r - Calendar
v1.0.0r - Installer updated, Notification system, App launcher full planned meter feature set
--Highly-Tentative--------------------------------------------------------------
v1.1r - Support for dynamic color keyboards
v1.2r - Google play music plugin and Networking top processes plugin
v1.3r - Machine learning album art selector, I'm kidding (Maybe)

May happen eventually
Meters will change to variant on middle click, I only wanna do this if it can include the alt system
Add more versions of CPU and GPU info (I dont think I will do this as the info is not too needed (And I dont need to see my FPS hit 59 and want to replace my computer) and all new and old info would need to be labeled to differentiate it 
Large 12 hour clock (With variant where 12hr is replaced by Monstercat logo)
A version of the RSS display for displaying mobile versions of websites? I found a way to display in an iframe in rainmeter, doubt I will do this though as it feels too much.
Complimentary colors update, I wrote the whole system for this and my calculations are sometimes off by a little bit which is fine but it really does not look good.
Button to toggle visiblity of small meters and side panels (Similar to enigma)
Little icon idividual program launchers to match the button mentioned above
Modified versions of the logos that integrate simple system status (CPU, GPU, Ping are the 3 I am thinking about doing)

------------------------------------------------------------------------
Anything past this point is written more for myself and may be confusing
------------------------------------------------------------------------
TODO
- [ ] Make cut off for number of colors to sort based off of a percent of the 1st colors count, I dont think I will do this though as it will favor lighter or darker colors Update: I think I am going to do the next thing on the todo list instead
- [ ] Make interesting colors be higher on the list of colors (I think I could try to measure this quickly by looking at how far away it is from monochrone)
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
- [ ] Final optimization pass
- [ ] Update installer meter to make initial setup nicer (Do before v1.0)
- [ ] Look into hacking in Google play music (And youtube?) support to the music reader (I believe Google Talk/G+ used to expose this info)
- [ ] Look into making networking top process plugin
- [ ] Look into if average size variable increases or decrease performance based on size (kind of irrelevant now with CPU usage being better I just want to document it right)
- [ ] Look into adding corsair and other keyboards manufactures color API's into the color system, I do not have a full RGB (Mine only does green) so I will need a guinea pig
Bugs
- [ ] When spotify isnt running there is a lot of log spam, I think this is from the plugin and not my missuse of it hoepfully I can turn it off
- [ ] Album art color fetch runs when a gerne color will end up being decided (Not as big a deal as I figured it would be, blur takes up way more cpu time)
- [ ] Rarely a thread is detected as running but when it goes to be killed it is already dead, likely is finishing gracefully before the kill command happens. Not a major bug just causes occasional log spam
- [ ] Pinging conditionals do not work after first time they are triggered Update: I have disabled for now so MaxPingDisplayed is ignored
- [ ] Check and possibly fix if DINTFMI only working on first load since afterwards it may always use old data
- [ ] Look into if cpu being off by about a factor of about 2 (Seems to be half actual on advancedCPU and ferpnom) on cpu reader and top processes is a bug in task manager, rainmeter dlls, or if it is just my machine
- [ ] Several bars variants need to be checked for code consistency, such as percentual being set on some of the ferpnom meters, process being spelled wrong, or other logical bugs, and missoptimizations within them
- [ ] Top processes bars do not use scale value on AdvancedCPU meters (Low priority due to percentual possibly scaling based on max value causing for percentage changes)
Possible Future Changes
- [ ] Dual graph CPU and GPU info (Similar to how combined processing graph works but instead one for just GPU and just CPU, would use things like temp and RAM usage on extra bars)
- [ ] Once released see if advancedCPU is really needed and remove it? (Not till after I get enough people using it to make a judgment on this)
- [ ] Decide if I want to make max for top process meters be less user configurable/Require more knowledge of your machine to change (How many cores)
- [ ] Add missing part of DINAJ hovertext?
- [ ] Look into fixed number position on right aligned meter info (Either the start or honestly it looks good enough if just the postfixes started at the same place it would be good enough)
- [ ] Padding has been removed do I want to add it back as a toggle? Would it apply to everything or just text? (If I do apply AccurateText) Update: Rainmeter has a padding option, will look into it
- [ ] Make middle click always cause a refresh of data (likely will not do with this giving me issues before and CPU usage being so low now) and double click cycle through variants?
- [ ] Make it so meters can be auto scaled to fit height/width given by user. ie. 1920,10 would make 10 meters perfectly spaced across a 1080p display (Really dont think I will do this unless I make meters intended to do on the top and bottom of screen that are not the notification system))