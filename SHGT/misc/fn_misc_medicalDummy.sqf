// Spawn a training dummy
//
// PARAMETERS:
// _target (object): The target to spawn the object at.
// _caller (object): The player which has summoned this training dummy.
//
// RETURNS: the unit.
SHGT_medical_spawnDummy = {
	params ["_target","_caller"];

	// Get the position to put the unit at
	_position = getPosATL _target;

	// Spawn the unit, set its attributes
	_unit = group _caller createUnit ["B_RangeMaster_F", _position, [], 0, "FORM"];
	_unit setVariable ["acex_headless_blacklist", true];
	_unit setVariable ["ace_medical_damageThreshold",1000,true]; 
	// Disable movement/pathing
	_unit disableAI "path";
	_unit disableAI "move";
	_unit disableAI "ANIM";
	_unit disableAI "AUTOTARGET";

	// Remove items
	removeAllWeapons _unit;
	removeGoggles _unit;
	removeHeadgear _unit;
	removeVest _unit;
	removeAllAssignedItems _unit;
	clearAllItemsFromBackpack _unit;
	removeBackpack _unit;

	// Create the stretcher, lock the unit into it.
	_vic = createVehicle ["kat_stretcher", _position, [], 0, "CAN_COLLIDE"];
	_unit moveincargo _vic;
	_vic lock true;
	_target setVariable ["SHGT_stretcher",_vic,true];

	_unit
};

// Apply a set amount of wounds to a given unit over a given number of iterations.
//
// PARAMETERS:
// _target (object) The unit to add damage to.
// _iterations (integer): How many passes should be taken at the unit?
// _minDamage (float, 0-1): What is the minumum severity of the damage to be added?
// _maxDamage (float, 0-1): What is the maximum severity of the damage to be added?
// _damageType (string): The type of damage to apply (bullet, explosive).
//
// RETURNS: nil
SHGT_medical_applyWounds = {
	params ["_target", "_iterations","_minDamage", "_maxDamage", "_damageType"];

	// For each iteration...
	for "_i" from 0 to _iterations do {
		// Select a random body part, compute the damage, and add it to the unit
		// ace damage adding only works for [0,1)
		_part = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
		_damage = random (_maxDamage - _minDamage) + _minDamage;
		[_target, _damage, _part, _damageType] call ace_medical_fnc_addDamageToUnit;
	};
};

private _spawnerSettings = [
	["Spawn Easy GSW Patient", 2, 0.1, 0.5, "bullet"],
	["Spawn Medium GSW Patient", 4, 0.3, 0.7, "bullet"],
	["Spawn Hard GSW Patient", 7, 0.3, 0.9, "bullet"],
	["Spawn Impossible GSW Patient", 12, 0.6, 1.0, "bullet"],
	["Spawn Easy IED Patient", 4, 0.3, 0.7, "explosive"],
	["Spawn Medium IED Patient", 6, 0.5, 0.7, "explosive"],
	["Spawn Hard IED Patient", 8, 0.6, 0.8, "explosive"],
	["Spawn Impossible IED Patient", 10, 0.8, 1.0, "explosive"]
];

["Land_Stretcher_01_F", "init", {
	private _stretcher = _this select 0;

	{
		_stretcher addAction [_x select 0, {
			
			// Initialize
			params ["_target", "_caller", "_actionId", "_args"];
			_stretcher = _target getVariable ["SHGT_stretcher", []];
			// If we have a unit on the stretcher currently, delete it.
			if (!(_stretcher isEqualTo [])) then {
				//_unit = attachedobjects _stretcher select 0;
				//detach _unit;
				deleteVehicleCrew _stretcher;
				deleteVehicle _stretcher;
			};

			// Spawn a new patient, update the message to reflect that.
			_unit = [_target, _caller] call SHGT_medical_spawnDummy;
			[_unit, _args select 1, _args select 2, _args select 3, _args select 4] call SHGT_medical_applyWounds;

			// Add an event handler to prevent the unit ragdolling.
			// If it ragdolls, it'll fall off the stretcher.
			[_unit, true, 0, true] call ace_medical_engine_fnc_setUnconsciousAnim;
			
			
			hint "Patient Spawned!";
			sleep 1;


		},_x,6,false,true,"","true",10];

	} foreach _spawnerSettings;
},true, [], true] call CBA_fnc_addClassEventHandler;
