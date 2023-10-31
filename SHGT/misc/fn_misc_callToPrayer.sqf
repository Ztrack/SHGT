if (!hasInterface) exitWith {};

SHGT_callToPrayerOn = false;

_handle = [{
	if (((date select 3) in [5,7,14,17,20,22]) and ((date select 4) <= 20) and (SHGT_callToPrayerOn isEqualTo false)) then {
		_allSpeakers = allmissionObjects "Loudspeakers_EP1";
		{_x say3d "SHGT_calltoprayer"} forEach _allSpeakers;
		SHGT_callToPrayerOn = true;
		[] spawn {sleep 180; SHGT_callToPrayerOn = false;};
	};

}, 30, []] call CBA_fnc_addPerFrameHandler;