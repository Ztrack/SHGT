// This function initializes the helicopter & crew for transport duty
params ["_helo"];
if (count (crew _helo) == 0) then {
	createVehicleCrew _helo;
};

// step 2: Ensure helo & crew are safe from damage
_helo allowDamage false;
{_x allowDamage false} forEach (crew _helo);

// Step 3: remove fuel at start
if (isTouchingGround _helo) then { _helo setfuel 0 };

// Step 4: Store helos
if (isNil "SHGT_transport_activeHelo") then {SHGT_transport_activeHelo = []};
SHGT_transport_activeHelo pushBack _helo;
publicVariable "SHGT_transport_activeHelo";

// Step 5: remove LCLA compatability
_helo setVariable ["SHGT_logistics_LCLA_disallowed",true,true];

// Step 6: Modify ACE Cargo settings
[_helo, SHGT_transport_cargoSize] call ace_cargo_fnc_setSpace;

// Step 7: Make vehicle not persist
_helo setVariable ["SHGT_persist_ignore",true,true];

// Step 8: Addaction to select landing location
//[_helo] call SHGT_transport_heloAddAction;
[[_helo],SHGT_fnc_transport_initializeHelicopterAddAction] remoteExec ["call",0,true];


