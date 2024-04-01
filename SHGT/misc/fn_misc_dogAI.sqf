
if !(isServer) exitWith {};

["MFR_Dog_Base", "init", {
	private  _unit = (_this select 0);


	// Handler for detecting IEDs
	_handle = [{
		params ["_unit"];
		private  _unit = _unit select 0;
		private  _list = nearestObjects [_unit, SHGT_ied_iedListAmmo, 30];
		private _barking = (_unit getVariable ["dog_barking",false]);
		private _inVehicle = !(isNull (objectParent _unit)); // will return true if in a vehicle
		if (!(_list isEqualTo []) and !(_barking) and !(_inVehicle)) then {
			// An IED exists
			[_unit, ["dog_barking",30]] remoteExec ["say3D",0];
			_unit setVariable ["dog_barking",true,true];
			[{params ["_unit"]; _unit setVariable ["dog_barking",false,true];}, [_unit], 20] call CBA_fnc_waitAndExecute;
		};

	}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;

	// Add get in event handler so dog doesnt enter drivers seat
	_unit addEventHandler ["GetInMan", {
		if !isServer exitWIth {}; // not sure if needed, but its global so..
		params ["_unit", "_role", "_vehicle", "_turret"];
		if (_role in ["driver","gunner"]) then {
			_unit moveOut _vehicle;
			//systemChat "doggo moved out";

			if ((_vehicle emptyPositions "Cargo") >0) then {
				[{params ["_unit","_vehicle"]; _unit moveinCargo _vehicle;}, [_unit,_vehicle], 1] call CBA_fnc_waitAndExecute;
			};
		};
	}];



















}, true, [], true] call CBA_fnc_addClassEventHandler;