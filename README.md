A WIP rainmeter suite based on the Monstercat Visulizer skin by marcopixel.

Includes Do I need a jacket support from FlyingHyrax, multiple system info and networking meters. More to come

Tentative Roadmap (things may take longer or be scrapped based on difficulty)
v0.6.10r - Blur wallpaper support (Maybe 0.7), album art color support (Will offer both a single color and a multi color support (See palette system for android for what I want to do)

v0.7.0r aka Laptop/Desktop support - GPU, Wireless, multiHDD toggles, add plguins to this release and may start showing off suite, Multigraph CPU and GPU graphs (Would match the networking and processing combined graphs) 
v0.8.0r MVP - Weather & News support, likely first public release
v0.9.0r - Appointments
v0.9.5r - Calendar
v1.0.0r - Installer updated, Notification system, full planned meter feature set
v1.1r - Google play music plugin
v1.2r - Networking top processes plugin

May happen eventually
Meters will change to variant on middle click, I only wanna do this if it can include the alt system
Add more versions of CPU and GPU info (I dont think I will do this as the info is not too needed (And I dont need to see my FPS hit 59 and want to replace my computer) and all new and old info would need to be labeled to differentiate it 
Lua based 12 hour clock (With variant where 12hr is replaced by Monstercat logo)
A version of the RSS display for displaying mobile versions of websites? I found a way to display in an iframe in rainmeter, doubt I will do this though as it feels too much.
Complimentary colors update, I wrote the whole system for this and my calculations are sometimes off by a little bit which is fine but it really does not look good.
Button to toggle small meters and side panels

TODO
- [ ] Move scripts that are in root directory into proper places in resources
- [ ] Color palette system, I was originally going to make something similar to colorThief but I dislike the possibility for very close colors, the palette system in android prevents that and can pick out highlists  from and image which I want (ie if the album art as grass sky and an apple I want the apple color to be the dominant color)
- [ ] Add news RSS
- [ ] Weather stuffs (Use http://wxdata.weather.com/wxdata/weather/local/#LocationCode#?cc=*&unit=#TempUnit#&dayf=6 and parse, thanks to jsmorley for his post on that had no idea weather.com had an rss version (It even has wind direction!))
- [ ] Calendar for the month meter
- [ ] Appointments meter
- [X] Add blur effect to album art background toggle, since as I learned album art is not high res
- [X] Make set blur as actual background optional
- [X] Have color change delay be user configurable, and apply to every single color cchange? (May have to have it apply to every dynamic color object for album art colors to work)
- [ ] Add more info to gpu and cpu meters (Scrapped)
- [ ] Pull colors from album art since it will be a background option Update: This is being a pain in my ass
- [X] Add genre color complimentary color that user can toggle on, (Is there a way to do this programmatically? Not sure how complimentary colors work) Ie the one I see all the time blue background with yellow everything else
- [ ] Make desktop and laptop versions of some meters, ie. desktop doesn't need wifi or battery info, laptop may not need GPU info
- [ ] Notification system (using IFTTT and pushover?) Edit: Nevermind Pushover only allows apps to send notifications, receiving must be done in a special app and is as the name implies push based not pull based.
- [ ] Get real fact from fact repository and mix them in with fact sphere facts Update: Now has a separated version, needs a joint version
- [ ] Add support for audio playback of fact sphere on left click?
- [X] Add combined Top Processes with paging
- [ ] Several bars variants need to be checked for code consistency, such as percentual being set on some of the ferpnom meters, process being spelled wrong, or other logical bugs, and missoptimizations within them
- [ ] Make sure background cmds are closing gracefully and correctly and not staying open
- [ ] Final optimization pass
- [ ] Update installer meter to make initial setup nicer (Do before v1.0)
- [ ] Look into hacking in Google play music (And youtube?) support to the music reader (I believe Google Talk/G+ used to expose this info)
- [ ] Look into making networking top process plugin
- [ ] Look into if average size variable increases or decrease performance based on size (kind of irrelevant now with CPU usage being better I just want to document it right)
Bugs
- [ ] Album art color fetch runs when a color will end up being decided 
- [ ] Each meter instances its own version of any of the color options causing higher CPU than needed, I have known about this for a while but it hasn't been a big deal till some of the color choices required more CPU.
- [ ] Threads sometimes stay alive after completing their output (I think I have seen it once or twice do it without completing it, tell me your secrets threads why did you hang)
- [ ] Album art color fetch  fallback overwrites old data on refresh, likely wont fix unless I can find a way to make sure that the itune info gets in in time
- [ ] After a refresh album art color fetech's next call returns nothing Update: Its the next fetch that does not go through fallback, interesting Update: I think it is fixed now
- [ ] Extreme dark or light (Like almost fully black or fully white) album art colors when using album art as the background cause either text to be unreadable without being on a panel or more importantly if really dark everything but text is unusable no matter what 
- [ ] Really uniform album art colors when using album art as a background make the visualizer almost unusable, will become better once I give the option to favoring bright colors
- [ ] Pinging conditionals do not work after first time they are triggered Update: I have disabled for now
- [ ] Check and possibly fix if DINTFMI only working on first load since afterwards it may always use old data
- [ ] Look into if cpu being off by about a factor of about 2 (Seems to be half actual on advancedCPU and ferpnom) on cpu reader and top processes is a bug in task manager, rainmeter dlls, or if it is just my machine
- [ ] Process is spelled Proces in several places throughout the codebase, not causing any bugs as it is spelled that way throughout the file but it bothers me, Ill get around to regexing it someday
- [ ] Top processes bars do not use scale value on AdvancedCPU meters (Low priority due to percentual possibly scaling based on max value causing for percentage changes)
Possible Future Changes
- [X] Regroup small meters by the size variation? (Scrapped for other regrouping changes (Instead called alts))
- [ ] Dual graph CPU and GPU info (Similar to how combined processing graph works but instead one for just GPU and just CPU, would use things like temp and RAM usage on extra bars)
- [ ] Replace # with - in top process meter?
- [ ] Once released see if advancedCPU is really needed and remove it? (Not till after I get enough people using it to make a judgment on this)
- [ ] Decide if I want to make max for top process meters be less user configurable/Require more knowledge of your machine to change (How many cores)
- [ ] Add missing part of DINAJ hovertext?
- [ ] Look into fixed number position on right aligned meter info (Either the start or honestly it looks good enough if just the postfixes started at the same place it would be good enough)
- [ ] Padding has been removed do I want to add it back as a toggle? Would it apply to everything or just text? (If I do apply AccurateText) Update: Rainmeter has a padding option, will look into it
- [ ] Make middle click always cause a refresh of data (likely will not do with this giving me issues before and CPU usage being so low now) and double click cycle through variants?
- [ ] Make meter backgrounds dynamic? (User can use transparency to achieve this effect now pretty well now so I doubt I will do this, especially since background panels are dynamic)
- [ ] Make it so info fits height perfectly on a 1080p display/user defined value? (Would like to do this but it would be hard unless I do something like make the number of top processes dynamic to fill the gap at the bottom as I do not define height specifically on any meter)
- [ ] Make it so meters can be auto scaled to fit width given by user. ie. 1920,10 would make 10 meters perfectly spaced across a 1080p display (Really dont think I will do this unless I make meters intended to do on the top and bottom of screen that are not the notification system))