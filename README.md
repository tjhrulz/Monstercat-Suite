A WIP rainmeter suite based on the Monstercat Visulizer skin by marcopixel.

Includes Do I need a jacket support from FlyingHyrax, multiple system info and networking meters. More to come

TODO in order of priority/similar items (It was at one point in priority order but now its more similar itmes)
- [X] Add optional DINAJ versions with reduced text
- [X] Design and add in text and text with bars versions of currently existing meters
- [X] Making Monstercat clock for images show images in a directory and slideshow through them
- [X] Add backgrounds to everything so clicking is not a pain (Will become very useful for text only meters
- [X] Make image path use one defined in variables
- [X] Add top processes meter, with the ability to sort by memory, cpu, and network usage.
- [ ] Replace # with - in top process meter? Look into network version of the meters and possibly remove duplicate
- [ ] Decide if I want to make max for top process meters be less user configurable/Require more knowledge of your machine to change (How many cores)
- [ ] Add news RSS
- [ ] Weather stuffs (May be hard with free weather services (yahoo) shutting down and not wanting to expose private keys for weather apps, may look into how DINAJ is doing it. Update: Uses regex page parsing and I hate that as it is likely to break, may just make users supply their own key on one version and regex the other version
- [ ] Calendar for the month meter
- [ ] Appointments meter
- [ ] Add blur effect to album art background toggle, since as I learned album art is not high res
- [X] Add monstercat logo as a background toggle option
- [ ] Pull colors from album art since it will be a background option
- [X] Redo color options for meters (Add 3 different color choices?)
- [X] Genre colors need at least 3 different matching colors for each one, not sure how I want to choose those colors Update: Now going to be called color variation system, will come online when color choosing script is rewritten
- [ ] Add genre color complimentary color that user can toggle on, (Is there a way to do this progomatically? Not sure how complimentary colors work) Ie the one I see all the time blue background with yellow everything else
- [ ] Add missing part of DINAJ hovertext?
- [ ] Right align right hand stats as an option? Or maybe by default if I can making the sizeing not changing with different numbers
- [ ] Finish implementing padding or remove it
- [ ] Make desktop and laptop versions of some meters, ie desktop doesnt need wifi or battery info, laptop may not need GPU info
- [ ] Notification system
- [ ] Look into if average size variable increases or decrease performance based on size
- [ ] Make middle click always cause a refresh of data and double click cycle through varients
- [ ] Update installer
- [ ] Look into hacking in Google play music (And youtube?) support to the music reader (I believe Google Talk/G+ used to expose this info)
- [ ] Get real fact from fact repository and mix them in with fact sphere facts
- [ ] Add support for audio playback of fact sphere on left click
- [ ] Top Processes visually inconsistant, change?
- [ ] Add option for users to define (or automagically?) max internet and HDD speeds if they dont want those meters to dynamically scale based on best known since refresh
- [ ] Add combined Top Processes with paging
- [ ] Several bars varients need to be checked for code consistency, such as percentual being set on some of the ferpnom meters, process being spelled wrong, or other logical bugs, and missoptimizations within them
- [ ] Optimization pass
- [X] Horizontal bars primary color or white option in config, maybe add just more in depth config to every type of meter and have them default to primary and secondary colors?
- [ ] Update metadata instead of using deprecated call and better attribute authors of various parts (Do before exposing to public)
- [ ] Make meter backgrounds dynamic? (User can use transparency to achieve this effect now pretty well now so I doubt I will do this)

BUGs
- [X] Ping meter on network combined seems to never be updating after first update (Update it only changes after really long time probably got multiplied by 10 somehow)
- [ ] Pinging and GPU conditionals do not work after first time they are triggered
- [X] Fix ping sticking at max (Likely to do with the high frequency may resolve itself with update ratio fix) Update: Seems to have resolved itself with update ratio fix, will look into if it reapears with small numbers. Investigating
- [ ] Fix right aligned monster clocks requiring a nondynamic x value to display (Needs a lua rewrite to work)
- [X] Fix user config for update frequency not working
- [ ] Check and possibly fix if DINTFMI only working on first laod since afterwards it may always use old data
- [ ] Look into if cpu being off by about a factor of about 2 (Seems to be half actual on advancedCPU and ferpnom seems to vary) on cpu reader and top processes is a bug in task maanger, rainmeter dlls, or if it is just my machine
- [X] Ferpnom seems to be half actual CPU usage on 1-5, yet be double on 1-10 minibar (Percentual was set, likely causing issues elsewhere may be able to use to fix CPU missreading)
- [ ] Process is spelled Proces in several places throughout the codebase, not causing any bugs as it is spelled that way throughtout the file but it bothers me
- [ ] Top processes bars are not scalled on AdvancedCPU meters (May not happen due to percentual possibly scalling based on max value causing for percentage changes)
- [ ] Fix random logic bugs that likely exist
- [ ] Investigate CPU being really high sometimes