if !(isServer) exitWith {};

{
	private _class = (_x select 0);
	//_offset = _x select 1;
	[_class, "init", {
		//systemChat "vbed start";
		// Initialize
		private _veh = (_this select 0);

		[_veh] call SHGT_fnc_ied_CreateVBED;

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