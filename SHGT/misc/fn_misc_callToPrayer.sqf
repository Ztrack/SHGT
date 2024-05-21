if (!isServer) exitWith {};
// this setVariable ["SHGT_callToPrayerSpeaker",true]; on loudspeakers to play the sound
SHGT_callToPrayerOn = false;

_handle = [{
	if (((date select 3) in [5,7,14,17,20,22]) and ((date select 4) <= 20) and (SHGT_callToPrayerOn isEqualTo false)) then {
		_allSpeakers = allmissionObjects "Loudspeakers_EP1";
		{if (_x getVariable ["SHGT_callToPrayerSpeaker",false]) then {[_x, ["SHGT_calltoprayer",400]] remoteExec ["say3D",0]}} forEach _allSpeakers;
		SHGT_callToPrayerOn = true;
		[] spawn {sleep 180; SHGT_callToPrayerOn = false;};
	};

}, 30, []] call CBA_fnc_addPerFrameHandler;