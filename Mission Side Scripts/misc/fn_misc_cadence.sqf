/*
Cadence script by Ztrack with inspiration from Rickoshay

1. No need to name any units anything. Simply put this line of code into the leader of the group in the editor, then group as many units as you want to the lead in whatever placement.
[this,[["SHGT_c130rolling",68],["SHGT_mamaCantYouSee",83],["SHGT_greengrass",78],["SHGT_ileftmyhome",96]]] call SHGT_fnc_misc_cadence;
2. Modify _cadenceList with sound files and run times as needed. It will play a random song
3. Set the appropriate music loop and running loop timers




//////////////////////////////////////////////////////////////////////////////////////////////*/

if (!isServer) exitWith {};
params ["_lead","_cadenceList"];

private _runners = (units (group _lead));
private _ROS_r1_offsets = [];
{_ROS_r1_offsets pushback (_lead worldToModel (getPosASL _x))} foreach (_runners - [_lead]);

//_waitTime = 360; // Time in seconds to wait before script starts...Useful for bypassing headlessclient transfer

//[{
//params ["_lead","_cadenceList","_ROS_r1_offsets"];
//[[_lead,_cadenceList,_ROS_r1_offsets], {
//params ["_lead","_cadenceList","_ROS_r1_offsets"];
private _runningLooptime = 80;
private _musicLoopTime = 100;
private _soundDist = 50; // set sound distance for cadence to be heard

// Array of runners
//_runners = (units (group _lead));

// Prevent anim switch and damage
{_x disableAI "anim"; _x setVariable ["lambs_danger_disableAI",true]; _x playmoveNow "AmovPercMrunSnonWnonDf";} foreach _runners;

// Save _lead
private _orgPos = getPosATL _lead;
private _orgdir = getdir _lead;

// Get offsets and attachTo
{_pos = _ROS_r1_offsets select _forEachIndex; _x attachTo [_lead,[_pos select 0, _pos select 1, 0]]; _x setDir 0;} foreach (_runners - [_lead]);

_lead setVariable ["_cadence_loop",1];
// Loop to handle reorientation of runners
_handle_reorientation = [{
	params ["_params"];
	private _lead = _params select 0;
	private _runners = _params select 1;
	private _orgPos = _params select 2;
	private _orgdir = _params select 3;
	//if !(alive _lead) exitWith {[_this] call CBA_fnc_removePerFrameHandler};

	_cadence_loop = _lead getVariable ["_cadence_loop",2];
	if (_cadence_loop isEqualTo 1) then {
		// First time setup
		_lead setPosATL _orgPos;
		_lead setDir _orgdir;
		_lead setVariable ["_cadence_loop",2];
	} else {
		_lead setdir (_orgdir + 180); // Reorientate _lead
		_lead setVariable ["_cadence_loop",1];
	};
	{_x disableAI "anim"; _x setVariable ["lambs_danger_disableAI",true]; _x playmoveNow "AmovPercMrunSnonWnonDf";} foreach _runners;
}, _runningLooptime, [_lead,_runners,_orgPos,_orgdir]] call CBA_fnc_addPerFrameHandler;

// Start song loop
SHGT_misc_CadencePlayFunc = {
	params ["_lead","_cadenceList","_soundDist"];
	private _cadence = selectRandom _cadenceList;
	private _sound = _cadence select 0;
	//systemChat str _cadence;
	private _musicLoopTime = (_cadence select 1) + 10; // play time + x seconds delay
	if !(alive _lead) exitWith {};
	[_lead, [_sound,_soundDist]] remoteExec ["say3D",0];
	[{params ["_lead","_cadenceList","_soundDist"]; [_lead,_cadenceList,_soundDist] call SHGT_misc_CadencePlayFunc}, [_lead,_cadenceList,_soundDist], _musicLoopTime] call CBA_fnc_waitAndExecute;
};

[_lead,_cadenceList,_soundDist] call SHGT_misc_CadencePlayFunc;

//}] remoteExec ["call",_lead];

//}, [_lead,_cadenceList,_ROS_r1_offsets], _waitTime] call CBA_fnc_waitAndExecute;

/*
params ["_lead","_soundDist","_cadenceList"];
_play = selectRandom _cadenceList;
	[_lead, [_play,_soundDist]] remoteExec ["say3D",0];

[{params ["_unit","_vehicle"]; _unit moveinCargo _vehicle;}, [_unit,_vehicle], 1] call CBA_fnc_waitAndExecute;

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
