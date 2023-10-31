// This function/keybind allows players to kick a soccer ball item in the world.

// Create keybind function
SHGT_fnc_misc_kickball = {
_nearBall = nearestObjects [player, ["Land_Football_01_F"], 1.5];
if (_nearBall isEqualTo []) exitWith {};
_nearBall = _nearBall select 0;
_dir = getDir player;

SHGT_ballin = {
params ["_dir","_nearBall"];
_vel = (velocity _nearBall);                  
_speed = 10;   
_upSpeed = 1;       
_nearBall setVelocity [(_vel select 0) + (sin _dir) * _speed, (_vel select 1) + (cos _dir) * _speed, (_vel select 2) + _upSpeed]; 
};
[[_dir,_nearBall],SHGT_ballin] remoteExec ["call", 2, false];
};

 
// Add keybind
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
["SHGT","misc_kickball", "Kick soccer ball", {[] call SHGT_fnc_misc_kickball;}, "", [DIK_SPACE, [false, false, false]]] call CBA_fnc_addKeybind;