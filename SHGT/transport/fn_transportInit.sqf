// this function will initialize the helicopter with the scripts to begin transport
// use this to initialize the helo:
// INPUT 1: Helicopter object with crew inside (just "this" in editor)
// INPUT 2: variable names for helipads or another object that will act as landing points
// USE EX: [this,[pad1,pad2,pad3]] call SHGT_fnc_transportInit;

params ["_helo","_pads"];

if (isServer) then {
	// step 1: If no crew exists, add them
	if (count (crew _helo) == 0) then {
		createVehicleCrew _helo;
	};

	// step 2: Ensure helo & crew are safe from damage
	_helo allowDamage false;
	{_x allowDamage false} forEach (crew _helo);

	// Step 3: remove fuel at start
	if (isTouchingGround _helo) then { _helo setfuel 0 };

	// Step 4: Store configuration of helo and pads
	if (isNull SHGT_transport_storage) then {SHGT_transport_storage = []};
	SHGT_transport_storage pushBack [_helo,_pads];
	publicVariable "SHGT_transport_storage";

	// Step 5: remove LCLA compatability
	_helo setVariable ["SHGT_logistics_LCLA_disallowed",true,true];

	// Step 6: Modify ACE Cargo settings
	[_helo, SHGT_transport_cargoSize] call ace_cargo_fnc_setSpace;

	// Step 7: Make vehicle not persist
	_helo setVariable ["SHGT_persist_ignore",true,true];
};

// Step 8: Add addaction for each pad (must be executed locally)
{
	_thisPad = _x;
_helo addAction [
	format ["<t color='#FFFF00'>Request Transport to %1</t>",_thisPad],    
    { 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_helo = _arguments select 0;
		_thisPad = _arguments select 1;   
		systemChat "Pilot: Order received, beginning transport";
		[[_helo,_thisPad],SHGT_fnc_flightorder] remoteExec ["spawn", 0];
	},    
    [_helo,_thisPad],    
    8,    
    false,    
    true,    
    "",    
    ""   
];

// Step 9: Add interaction to object so it recalls helo
_interactObject = nearestObjects [_thisPad, ["Windsock_01_F"], 50];
_interactObject = _interactObject select 0;
_interactObject addAction ["<t color='#FFFF00'>Recall helicopter here</t>",    
    { 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_helo = _arguments select 0;
		_thisPad = _arguments select 1;
		
		// disallow recall if helo is in the air
		if !(isTouchingGround _helo) exitWith {
			systemChat "Pilot: Negative, we're currently on tasking";
			
			[_helo,_thisPad] spawn {
				params ["_helo","_thisPad"];
				_oldPos = getPosATL _helo;
				sleep 15;
				_newPos = getPosATL _helo;

				if ((_oldPos distance _newPos) < 5) then {
					systemChat "Pilot: Instructions lost in the sauce, rerouting your way";
				};
				[[_helo,_thisPad],SHGT_fnc_flightorder] remoteExec ["spawn", 0];
			};
			
			};
		systemChat "Pilot: Order received, Oscar Mike";
		[[_helo,_thisPad],SHGT_fnc_flightorder] remoteExec ["spawn", 0];
	},    
    [_helo,_thisPad],    
    8,    
    false,    
    true,    
    "",    
    ""   
];

} forEach _pads;