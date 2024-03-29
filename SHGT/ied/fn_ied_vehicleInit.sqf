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

		// Find vehicle offset
		private _info = [];
		{if ((typeOf _veh) isEqualTo (_x select 0)) then {_info = _x}} forEach SHGT_ied_vbedVehicles;
		if (_info isEqualTo []) exitWith {systemChat "vehicle offset not found"};

		// Determine if this vehicle has an ied randomly
		if !(random 100 <= SHGT_ied_vbedChance) exitWith {};

		private _class = _info select 0;
		private _rand = (floor ( random (count _info -1))) +1;
		private _selectedInfo = _info select _rand;
		private _offset = _selectedInfo select 0;
		private _rot = _selectedInfo select 1;

		// Spawn and attach IED
		private _IED = createVehicle [(selectRandom SHGT_ied_vbedIedAmmo),[0,0,0]];
		_IED attachTo [_veh, _offset]; //Attach IED
		_IED setDir (getDir _veh)+270;
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

/*

Code to help find positions:
 step 1: attach explosive to a vehicle
 step 2: call the explosive "iedvbed"
 step 3: run code (edit rotation angle if desired)

To get vehicle class:
_car = attachedTo iedvbed;
typeOf _car

To get position with a set rotation:
_car = attachedTo iedvbed;
iedvbed setDir (getDir _car)+270;
_car getRelPos iedvbed