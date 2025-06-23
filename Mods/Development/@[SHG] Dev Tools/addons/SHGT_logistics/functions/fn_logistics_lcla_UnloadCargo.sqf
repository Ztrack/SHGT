// Low cost low altitude combat airdrops
// This script allows birds/helos to load cargo crates with items and drop them via parachute to any location using scroll wheel


// Step 1: AddAction to all birds/helo for loading cargo crate
	// 1a: Cargo AttachTo helo center, hide object.
// Step 2: Addaction to all birds/helo for unloading cargo crate. Remove action when complete.
	// 2a: unAttach object, remove collision with helo
	// 2b: WaitUntil cargo is 100m above ground, spawn a parachute, attach parachute, waitUntil reaches 0m then remove parachute
// Step 3: Cleanup

params ["_veh","_cargo"];
_title = format ["Drop object %1",typeOf _cargo];

_veh addAction [_title, {

	// Import params
	params ["_target", "_caller", "_actionId", "_arguments"];
	private _veh = _arguments select 0;
	private _cargo = _arguments select 1;
	private _pos = getPosATL _veh;

	// remove this action
	_veh removeAction _actionId;

	// Case 1: The helo is on the ground
	if (_pos select 2 < 5) then {
		// This is the ground. Just drop the object
		_safePos = _pos findEmptyPosition [0,30,typeOf _cargo];
		_cargo setPosATL _safePos;
		detach _cargo;
		_cargo hideObject false;
		systemChat "Cargo unloaded to the ground"
	};

	// Case 2: The helo is in the air

	if (_pos select 2 > 5) then {

		[_veh,_cargo,_pos] spawn {
			params ["_veh","_cargo","_pos"];
			detach _cargo;
			_cargo hideObject false;
			_cargo disableCollisionWith _veh;

			_para = createVehicle ["B_Parachute_02_F", [0,0,100], [], 0, ""];
			_para disableCollisionWith _veh;
			_para setPosATL (_veh modelToWorld[0,0,-5]);
			_cargo attachTo [_para,[0,0,0]];

			WaitUntil {((((position _cargo) select 2) < 0.6) || (isNil "_para"))};
			detach _cargo;
			_cargo SetVelocity [0,0,-5];
			sleep 0.3;
			_cargo setPos [(position _cargo) select 0, (position _cargo) select 1, 1];
			_cargo SetVelocity [0,0,0];  
		};

		systemChat "Cargo dropped";
	};


},[_veh,_cargo],0,false,true,"","true",10];
