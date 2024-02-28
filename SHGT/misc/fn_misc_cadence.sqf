/*
ROS_Cadence by Rickoshay

Description
===========
Creates the effect of a call-and-response work song sung by military personnel while running or marching.

How it works
============
Each AI runner unit is locked into a running animation with a forward veloctiy and direction.
In this state they will run in synch and alignment - and through objects in their path, in a straight line - forever.
It is therefore important to have them all pointed in exactly the same direction and be evenly spaced.
The leading unit will be the 3D sound source. There are two sound files - 58s and 1m56s in length. Based on the setting below you
can have them reverse their direction ie -180 degrees after they complete one 58 second run which is about 235m from
their start postion or allow them to continue running for an additional 235m ie. total outbound distance ~470m.
This would require a clear path i.e. no obstructions for ~500m.
(Tip: You can use the HIDE module in Eden to clear any unwanted terrain objects in their path)

See deletion options below.

Legal stuff
===========
Credit must be given in your mission and on the Steam Workshop if this script is oncluded in your work.

Setup and Sound
===============
Create 11 units (the runners) name them run1..run11 starting at the front to the back sequentially - see demo.
Unit run1 - is the leader in front of the group
Place them approximately 3m apart in two slightly staggered lines:
eg:	     3   5   7   8   11
	 1
	    2   4   6   8   10
Add the two march sound classes to your description.ext file in CFGsounds - see demo.

Starting the runners
====================
To call this script, place the following command line on a laptop or trigger or in the init.sqf file:
[] execvm "scripts\ROS_cadence.sqf";

How to delete the runners
=========================
Either adjust the Auto delete options below - or if you want them to stop running at a specific point - create a trigger with an area that covers
the end position with enough overlap to allow for slight variance in the distance and angle on the runners and put the following lines in the trigger:
Cond: run1 in thislist
OnAct field:
{deletevehicle _x} foreach [run1, run2,run3,run4,run5,run6,run7,run8,run9,run10,run11];




//////////////////////////////////////////////////////////////////////////////////////////////
MODIFICATIONS BY ZTRACK:
1. No need to name any units anything. Simply put this line of code into the leader of the group in the editor, then group as many units as you want to the lead in whatever placement.
[this] call SHGT_fnc_misc_cadence;
2. Modify _cadenceList with sound files as needed. It will play a random song
3. Set the appropriate music loop and running loop timers








//////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////*/

if (!isServer) exitWith {};

scopeName "main";
params ["_lead"];

// Time for units to end and reposition for loopback - sound file is 56 secs long - allowing for overhead
_runningLooptime = 60;
_musicLoopTime = 90;

// Set cadence list 
_cadenceList = ["StickToBeer","mamaCantYouSee","redandgold"];

// set sound distance for cadence to be heard
_soundDist = 50;

// Array of runners
_runners = (units (group _lead));
//_idx = _runners find _lead;
//_runners deleteAt _idx;

// Get pack offsets from leader
_ROS_r1_offsets = [];
{_ROS_r1_offsets pushback (_lead worldToModel (getPosASL _x))} foreach (_runners - [_lead]);

// Save _lead
_dir = getdir _lead;
_orgPos = getPosASL _lead;
{_x setDir _dir} forEach (_runners - [_lead]);

// Prevent anim switch and damage
{_x disableAI "anim"; _x allowDamage false} foreach _runners;

// Leader orientation fix for first loop
//_dir = getdir _lead - 180;
//_lead setdir (_dir - 180);

// Start cadence
//_sound = selectRandom _cadenceList;
//[_lead, [_play,_soundDist]] remoteExec ["say3D",0];
//_soundSrc = playSound3D [_sound,_lead];

SHGT_cadence_loop = 1;
// Loop to handle reorientation of runners
_handle_reorientation = [{
	params ["_params"];
	_lead = _params select 0;
	_runners = _params select 1;
	_ROS_r1_offsets = _params select 2;
	_orgPos = _params select 3;

	// Stop anim
	{_x switchmove "";} foreach _runners;

	if (SHGT_cadence_loop isEqualTo 1) then {
		// First time setup
		_lead setPosASL _orgPos;
		SHGT_cadence_loop=2;
	} else {

		// Reorientate _lead
		_dir = getdir _lead;
		_lead setdir (_dir - 180);
	};
	
	_dir = getdir _lead;
	{
		_pos = ASLToAGL (_lead modelToWorld (_ROS_r1_offsets select _foreachindex));
		_x setPosASL _pos;
		_x setdir _dir;
	} foreach (_runners - [_lead]);

	if !(alive _lead) exitWith {};
}, _runningLooptime, [_lead,_runners,_ROS_r1_offsets,_orgPos]] call CBA_fnc_addPerFrameHandler;

// Start per frame handler to set animations every second
_handle_animations = [{
	params ["_params"];
	_lead = _params select 0;
	_runners = _params select 1;

	{_x playmove "AmovPercMrunSnonWnonDf"} forEach _runners;

	if !(alive _lead) exitWith {};

}, 1, [_lead,_runners]] call CBA_fnc_addPerFrameHandler;

// Start song loop
_handle_sounds = [{
	params ["_params"];
	_lead = _params select 0;
	_cadenceList = _params select 1;
	_soundDist = _params select 2;
	_sound = selectRandom _cadenceList;
	//my_soundSrc = _lead say3D _sound;
	[_lead, [_sound,_soundDist]] remoteExec ["say3D",0];
	if !(alive _lead) exitWith {};
}, _musicLoopTime, [_lead,_cadenceList,_soundDist]] call CBA_fnc_addPerFrameHandler;
/*
params ["_lead","_soundDist","_cadenceList"];
_play = selectRandom _cadenceList;
	[_lead, [_play,_soundDist]] remoteExec ["say3D",0];



/*
// Start them running and play cadence sound on first unit
{
	[_timer, _x] spawn {
		params ["_timer", "_x"];
		while {time < _timer} do {
			_x playmove "AmovPercMrunSnonWnonDf";
			sleep 1;
		};
	};
} foreach _runners;

// Play sound on leader _lead
if (ROS_deleteRunnersAfter_2) then {
	[_lead, ["march2",50]] remoteExec ["say3D",0];
} else {
	[_lead, ["march1",50]] remoteExec ["say3D",0];
};

// Allow last runner timer to run out
waitUntil {time > _timer};

// Kill sound if run time < looptime
deleteVehicle (allMissionObjects "#soundonvehicle" select 0);

// Delete the runners
if !(_endless_loop) then {
	{deleteVehicle _x} foreach _runners;
	breakTo "Main";
};

sleep 1;

// Restart?
if (_endless_loop) then {

	// Reset, reorientate and reposition runners for return loop
	{_x switchmove "";} foreach _runners;

	// Reorientate _lead
	_dir = (_lead getVariable "orig_dir")-180;
	_lead setdir _dir;
	{
		_pos = ASLToAGL (_lead modelToWorld (ROS_r1_offsets select _foreachindex));
		_x setPosASL _pos;
		_x setdir _dir;
	} foreach (_runners - [_lead]);
	sleep 1;
	if (speed _lead <1) exitWith {[] execvm "scripts\ROS_cadence.sqf";};
};

_soundSrc = player say3D "march1";
NOID <no shape>
isNull NOID <no shape> -> False (during play) OR True (after play is over)



my_soundSrc = player say3D "march1";
