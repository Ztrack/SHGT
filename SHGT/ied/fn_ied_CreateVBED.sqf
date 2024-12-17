params ["_veh"];

[_veh] spawn {
	sleep 5;
	params ["_veh"];

	// find vehicle offset
	private _info = [];
	{
		if ((typeOf _veh) isEqualTo (_x select 0)) then {
			_info = _x
		}
	} forEach SHGT_ied_vbedVehicles;
	if (_info isEqualTo []) exitWith {
		systemChat "vehicle offset not found"
	};

	private _class = _info select 0;
	private _rand = (floor ( random (count _info -1))) +1;
	private _selectedInfo = _info select _rand;
	private _offset = _selectedInfo select 0;
	private _rot = _selectedInfo select 1;

	// spawn and attach IED
	private _IED = createVehicle [(selectRandom SHGT_ied_vbedIedAmmo), [0, 0, 0]];
	_IED attachTo [_veh, _offset];// Attach IED
	_IED setDir (getDir _veh)+270;
	// _IED setVectorUp [0, 0, -1];
	_IED setVariable ["SHGT_VBED_READY", 1, true];

	// Add deleted event handler for if vehicle is deleted, then the IED will be too
	_veh addEventHandler ["Deleted", {
		params ["_entity"];
		{
			deleteVehicle _x;
		} forEach (attachedObjects _entity);
	}];
	// systemChat "vbed end";
};