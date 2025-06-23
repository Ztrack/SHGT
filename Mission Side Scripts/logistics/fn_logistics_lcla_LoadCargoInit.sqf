// Low cost low altitude combat airdrops
// This script allows birds/helos to load cargo crates with items and drop them via parachute to any location using scroll wheel


// Step 1: AddAction to all birds/helo for loading cargo crate
	// 1a: Cargo AttachTo helo center, hide object.
// Step 2: Addaction to all birds/helo for unloading cargo crate. Remove action when complete.
	// 2a: unAttach object, remove collision with helo
	// 2b: WaitUntil cargo is 100m above ground, spawn a parachute, attach parachute, waitUntil reaches 0m then remove parachute
// Step 3: Cleanup
SHGT_lcla_ObjecToCheck = "Thing";

["Air", "init", {
	private _veh = (_this select 0);
	[_veh] call SHGT_fnc_logistics_lcla_loadCargo;
}, true, [], true] call CBA_fnc_addClassEventHandler;

