if !(isServer) exitWith {};

{
	private _class = (_x select 0);
	//_offset = _x select 1;
	[_class, "init", {
		//systemChat "vbed start";
		// Initialize
		private _veh = (_this select 0);
		[_veh] spawn {
		sleep 5;
		params ["_veh"];
		private _class = []; // init
		private _offset = []; // init

		// Determine if this vehicle has an ied randomly
		if !(random 100 <= SHGT_ied_vbedChance) exitWith {};
		//systemChat "hit";

		// Find vehicle offset
		{if ((typeOf _veh) isEqualTo (_x select 0)) then {_class = _x select 0; _offset = _x select 1;}} forEach SHGT_ied_vbedVehicles;
		if (_offset isEqualTo []) exitWith {systemChat "vehicle offset not found"};

		// Spawn and attach IED
		_iedType = SHGT_ied_vbedIedAmmo select 0;
		private _IED = [];
		_IED = createVehicle [_iedType,[0,0,0]];
		_IED attachTo [_veh, _offset]; //Attach IED
		//_IED setVectorUp [0,0,-1];
		_IED setVariable ["SHGT_VBED_READY",1,true];

		// Add deleted event handler for if vehicle is deleted, then the IED will be too
		_veh addEventHandler ["Deleted", {
		params ["_entity"];
			{
  				deleteVehicle _x;
			} forEach (attachedObjects _entity);
		}];
		//systemChat "vbed end";
		};

	}, false, [], true] call CBA_fnc_addClassEventHandler;
} forEach SHGT_ied_vbedVehicles;