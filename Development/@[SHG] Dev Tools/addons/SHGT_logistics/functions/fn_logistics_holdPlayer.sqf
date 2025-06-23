player switchAction "Crouch"; 
player setAnimSpeedCoef 0;
sleep 1;
player setAnimSpeedCoef 1;
player playActionNow "MedicOther";
sleep 7.5;

_handle = [{
	player setAnimSpeedCoef 0;
	//player switchAction "Crouch"; 
	player action ["SwitchWeapon", player, player, 100];

	if !(player getVariable ["building",false]) then {[_this select 1] call CBA_fnc_removePerFrameHandler; player setAnimSpeedCoef 1;}; // end handler};

}, 0, []] call CBA_fnc_addPerFrameHandler; // close per frame handler