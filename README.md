A WIP rainmeter suite based on the Monstercat Visulizer skin by marcopixel.

Includes Do I need a jacket support from FlyingHyrax, multiple system info and networking meters. More to come

TODO in order of priority
- [X] Add optional DINAJ versions with reduced text
- [X] Design and add in text and text with bars versions of currently existing meters
- [X] Making Monstercat clock for images show images in a directory and slideshow through them
- [X] Add backgrounds to everything so clicking is not a pain (Will become very useful for text only meters
- [ ] Look into adding better HDD bars, as perfmon does not have a way to get max possible HDD usage.
- [X] Make image path use one defined in variables
- [ ] Add top processes meter, with the ability to sort by memory, cpu, and network usage.
- [ ] Add news RSS
- [ ] Weather stuffs (May be hard with free weather services (yahoo) shutting down and not wanting to expose private keys for weather apps, may look into how DINAJ is doing it
- [ ] Calendar for the month meter
- [ ] Appointments meter
- [ ] Add blur effect to album art background toggle, since as I learned album art is not high res
- [ ] Add monstercat logo as a background toggle option
- [ ] Update auto color gen and make it have multiple shades, possibly pull from album art since it will be a background option
- [ ] Redo color options for meters (Add 3 different color choices?)
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

BUGs
- [X] Ping meter on network combined seems to never be updating after first update (Update it only changes after really long time probably got multiplied by 10 somehow)
- [ ] Pinging and GPU conditionals do not work after first time they are triggered
- [ ] Fix ping sticking at max (Likely to do with the high frequency may resolve itself with update ratio fix)
- [ ] Fix right aligned monster clocks requiring x value to display (Needs a lua rewrite to work)
- [X] Fix user config for update frequency not working
- [ ] Check and possibly fix if DINTFMI only working on first laod since afterwards it may always use old data
- [ ] Look into if cpu being off by about a factor of about 2 on cpu reader and the new AdvancedCPU top process test meter is a bug in task maanger, rainmeter dlls and if it exists in nomferp or if it just my machine