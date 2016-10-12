A WIP rainmeter suite based on the Monstercat Visulizer skin by marcopixel.

Includes Do I need a jacket support from FlyingHyrax, multiple system info and networking meters. More to come

Tentative Roadmap (things may take longer or be scrapped based on difficulty)
v0.6 - Current release
v0.6.1 - Current version
v0.6.2r - Changes to small meters to be visually consistent, top processes will have small versions, text and text with bars with have large versions and small versions with more info
v0.6.3 - Small meter graphs visual upgrade
v0.6.5r - Meters will change to variant on middle click, combined top processes
v0.6.6r - Complimentary colors, may happen in a prior release

v0.7.0r - GPU, Wireless, multiHDD toggles aka Laptop/Desktop support, blur wallpaper support (Maybe 0.7.5), album art color support
v0.8.0r - Weather & News support
v0.9.0r - Appointments
v0.9.5r - Calendar
v1.0.0r - Installer updated, Notification system, full planned meter feature set
v1.1r - Google play music plugin
v1.2r - Networking top processes plugin


TODO
- [ ] Add news RSS
- [ ] Weather stuffs (May be hard with free weather services (yahoo) shutting down and not wanting to expose private keys for weather apps, may look into how DINAJ is doing it. Update: Uses regex page parsing and I hate that as it is likely to break, may just make users supply their own key on one version and regex the other version
- [ ] Calendar for the month meter
- [ ] Appointments meter
- [ ] Add blur effect to album art background toggle, since as I learned album art is not high res
- [X] For side and top background panels the variables are not documented and height is not programmatic on top and bottom bar (will expose all to user
- [X] Background panels are all variants at the moment
- [ ] Pull colors from album art since it will be a background option
- [ ] Add genre color complimentary color that user can toggle on, (Is there a way to do this programmatically? Not sure how complimentary colors work) Ie the one I see all the time blue background with yellow everything else
- [ ] Make desktop and laptop versions of some meters, ie. desktop doesn't need wifi or battery info, laptop may not need GPU info
- [ ] Notification system (using IFTTT and pushover?) Edit: Nevermind Pushover only allows apps to send notifications, receiving must be done in a special app and is as the name implies push based not pull based.
- [ ] Get real fact from fact repository and mix them in with fact sphere facts
- [ ] Add support for audio playback of fact sphere on left click
- [ ] Add option for users to define (or automagically?) max Internet and HDD speeds if they don't want those meters to dynamically scale based on best known since refresh (Honestly not a big deal)
- [ ] Add combined Top Processes with paging
- [ ] Several bars variants need to be checked for code consistency, such as percentual being set on some of the ferpnom meters, process being spelled wrong, or other logical bugs, and missoptimizations within them
- [ ] Final optimization pass
- [ ] Update installer meter to make initial setup nicer (Do before v1.0)
- [ ] Update metadata instead of using deprecated call and better attribute authors of various parts (Do before exposing to public)
- [ ] Look into hacking in Google play music (And youtube?) support to the music reader (I believe Google Talk/G+ used to expose this info)
- [ ] Look into making networking top process plugin
- [ ] Look into if average size variable increases or decrease performance based on size (kind of irrelevant now with CPU usage being better I just want to document it right)
Bugs
- [ ] Pinging and GPU conditionals do not work after first time they are triggered
- [ ] Fix right aligned monster clocks requiring a non-dynamic x value to display (Needs a lua rewrite to work)
- [ ] Check and possibly fix if DINTFMI only working on first load since afterwards it may always use old data
- [ ] Look into if cpu being off by about a factor of about 2 (Seems to be half actual on advancedCPU and ferpnom seems to vary) on cpu reader and top processes is a bug in task maanger, rainmeter dlls, or if it is just my machine
- [ ] Process is spelled Proces in several places throughout the codebase, not causing any bugs as it is spelled that way throughout the file but it bothers me
- [ ] Top processes bars are not scaled on AdvancedCPU meters (May not happen due to percentual possibly scaling based on max value causing for percentage changes)
- [ ] Fix random logic bugs that likely exist/missed dynamicdynamic group on items
- [ ] Investigate CPU being really high sometimes Update: still exists post dynamicdynamic update, I think happens when you change songs very quickly, refresh all does nothing EQ accounts for around 7% - 10% (May have been coincidence as wasnt able to repeat). Album art is the rest at least I know this is the source may fix itself when those get the dynamic color system my way. Restarting rainmeter resolves, toggle to spotify and back may resolved
- [ ] Meter play pause may need dynamic variables
Possible Future Changes
- [ ] Regroup small meters by the size variation?
- [ ] Replace # with - in top process meter?
- [ ] Once released see if advancedCPU is really needed and remove it?
- [ ] Decide if I want to make max for top process meters be less user configurable/Require more knowledge of your machine to change (How many cores)
- [ ] Add missing part of DINAJ hovertext?
- [ ] Right align right hand stats as an option? Look into fixed number position (Either start or honestly it looks good enough if just the postfixes started at the same place it would be good enough)
- [ ] Padding has been removed do I want to add it back as a toggle? Would it apply to everything or just text? (If I do apply AccurateText)
- [ ] Make middle click always cause a refresh of data (likely will not do with this giving me issues before and CPU usage being so low now) and double click cycle through variants?
- [ ] Make meter backgrounds dynamic? (User can use transparency to achieve this effect now pretty well now so I doubt I will do this, especially since background panels are dynamic)
- [ ] Make it so info fits height perfectly on a 1080p display/user defined value? (Would like to do this but it would be hard unless I do something like make the number of top processes dynamic to fill the gap at the bottom as I do not define height specifically on any meter)
- [ ] Make it so meters can be auto scaled to fit width given by user. ie. 1920,10 would make 10 meters perfectly spaced across a 1080p display (Really dont think I will do this unless I make meters intended to do on the top and bottom of screen that are not the notification system))