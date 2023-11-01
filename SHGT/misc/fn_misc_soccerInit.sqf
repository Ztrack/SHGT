// This function/keybind allows players to kick a soccer ball item in the world.

// Create kicking function, to be run on the server
//SHGT_fnc_misc_kickballServer = {
//	params ["_dir","_nearBall"];
//	_vel = (velocity _nearBall);                  
//	_speed = 10;   
//	_upSpeed = 1;       
//	_nearBall setVelocity [(_vel select 0) + (sin _dir) * _speed, (_vel select 1) + (cos _dir) * _speed, (_vel select 2) + _upSpeed]; 
//};

// Create keybind function, to be run locally on the player and then passed to server
SHGT_fnc_misc_kickballPlayer = {
	_nearBall = nearestObjects [player, ["Land_Football_01_F"], 1.5];
	if (_nearBall isEqualTo []) exitWith {};
	_nearBall = _nearBall select 0;
	_dir = getDir player;
	
	//[[_dir,_nearBall],SHGT_fnc_misc_kickballServer] remoteExec ["call", 2, false];
	_vel = (velocity _nearBall);
	_speed = 10;
	_upSpeed = 1;
	_nearBall setVelocity [(_vel select 0) + (sin _dir) * _speed, (_vel select 1) + (cos _dir) * _speed, (_vel select 2) + _upSpeed];
};

// Add keybind
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
["SHGT","misc_kickball", "Kick soccer ball", {[] call SHGT_fnc_misc_kickballPlayer}, "", [DIK_SPACE, [false, false, false]]] call CBA_fnc_addKeybind;