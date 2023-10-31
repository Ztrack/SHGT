params ["_unit","_actionName","_sounds"];

_unit addAction [_actionName, { 
 params ["_target", "_caller", "_actionId", "_arguments"];
 _sounds = _arguments select 0;
 _num = floor (random (count _sounds));
 _play = _sounds select _num;
 _target say3D _play;

 // GLOBAL EFFECT
 //[[_target,_play],{
	//params ["_target","_play"];
	//_target say3D _play;
 //}] remoteExec ["call",0,false];
},[_sounds],6,true,true,"","true",3];


/*
To add this script to any unit in the editor simply add this to the init (modify as needed):

[this,"How's it going x?",["SHGT_mySound1","SHGT_mySound2"]] call SHGT_fnc_misc_quotesSay3d;


where SHGT_mySound1 and SHGT_mySound2 are sound clips defined in the mission description.ext as sounds.

class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class SHGT_mySound1
	{
		name = "Test sound 1";						// display name
		sound[] = { "SHGT\ied\SHGT_mySound1.ogg", 1, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,"MY SUBTITLES HERE. LEAVE EMPTY IF YOU DONT WANT THEM"};
	};
};