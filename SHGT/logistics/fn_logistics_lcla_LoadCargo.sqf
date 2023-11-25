// Low cost low altitude combat airdrops
// This script allows birds/helos to load cargo crates with items and drop them via parachute to any location using scroll wheel


// Step 1: AddAction to all birds/helo for loading cargo crate
	// 1a: Cargo AttachTo helo center, hide object.
// Step 2: Addaction to all birds/helo for unloading cargo crate. Remove action when complete.
	// 2a: unAttach object, remove collision with helo
	// 2b: WaitUntil cargo is 100m above ground, spawn a parachute, attach parachute, waitUntil reaches 0m then remove parachute
// Step 3: Cleanup
params ["_veh"];

_veh addAction ["Load object for LCLA drop", {

	// Import params
	params ["_target", "_caller", "_actionId", "_arguments"];
	private _veh = _arguments select 0;

	// Select object to load
	systemChat "Select a nearby object to load";
	private _Objectlist = player nearObjects [SHGT_lcla_ObjecToCheck, 50];
	private _ActionIDList = []; // Initialize
	{
		_thisActionID = _x addAction ["Load this object", {
			params ["_target", "_caller", "_actionId", "_arguments"];

			private _veh = _arguments select 0;
			_target attachTo [_veh, [0, 0, 0]];
			_target hideObject true;
			[_veh,_target] call SHGT_fnc_logistics_lcla_unloadCargo;

		},[_veh],0,false,true,"","true",10];
		_ActionIDList pushBack _thisActionID;
	} forEach _Objectlist;

	// Remove this addAction
	_veh removeAction _actionId;

	// AddAction to remove AddActions and reset object status
	_veh addAction ["Stop loading for LCLA", {

		// Import params
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _veh = _arguments select 0;
		private _Objectlist = _arguments select 1;
		private _ActionIDList = _arguments select 2;

		// Remove addActions from nearby objects
		{
			_x removeAction (_ActionIDList select _forEachIndex);
		} forEach _Objectlist;

		// reset loop
		[_veh] call SHGT_fnc_logistics_lcla_loadCargo;

		// remove this action
		_veh removeAction _actionId;
		
	},[_veh,_Objectlist,_ActionIDList],0,false,true,"","true",10];

},[_veh],0,false,true,"","true",10];

