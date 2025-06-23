params ["_vehPlace"];

_SHGTactionID = _vehPlace addAction ["Assist Building", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	if (vehPlace getVariable ["builder",""] isEqualTo player) exitWith {systemChat "Cannot assist yourself";}; // set player as primary builder
	cancelled = false;
	keyCancel = [46, [false, false, false], {cancelled = true;}] call CBA_fnc_addKeyHandler; // Add cancel keybind
	_target getVariable ["buildProgressRequired",0]; // set how much progress is required
	player setVariable ["building",true]; // reset placing to be true
	//player enableSimulation false;
	[] spawn SHGT_fnc_logistics_holdPlayer;
	_buildProgressRequired = (_target getVariable ["buildProgressRequired",0]);
	vehPlace = _target;

	_handle = [{
		params ["_keyCancel","_buildProgressRequired","_target"];
		_buildProgress = (vehPlace getVariable ["buildProgress",0]);
		_buildProgressRequired = (vehPlace getVariable ["buildProgressRequired",0]);
		vehPlace setVariable ["buildProgress",_buildProgress+1,true];
		_structuredText =  composeText [format ["Progress: %1 percent",((_buildProgress)/_buildProgressRequired)*100], linebreak, lineBreak,"Press C to cancel"];
        hintSilent _structuredText;
		if ((_buildProgress >= _buildProgressRequired) or (cancelled isEqualTo true)) then {
			hintSilent "";
			player setVariable ["building",false]; // reset placing to be true
			player enableSimulation true;
			keyCancel call CBA_fnc_removeKeyHandler;
			[_this select 1] call CBA_fnc_removePerFrameHandler; // end handler
		};

	}, 1, []] call CBA_fnc_addPerFrameHandler; // close per frame handler

},[],6,true,true,"","true",10]; // end addaction


_vehPlace setVariable ["_SHGTactionID",_SHGTactionID,true]; // set ID for later removal
