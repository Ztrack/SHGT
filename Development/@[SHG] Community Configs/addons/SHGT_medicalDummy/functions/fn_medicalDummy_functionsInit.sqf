// Settable Parameters

// OBJECTS
// Stretcher vehicle (MUST BE A PROPER VEHICLE! Ace chairs have different logic.)
// TODO: Implement cases for ace chairs.
//SHGT_medicalDummy_stretcher_object = "kat_stretcher";

// VARIABLE NAMES
SHGT_medicalDummy_var_stretcher = "SHGT_medicalDummy_stretcher";
SHGT_medicalDummy_var_spawning = "SHGT_medicalDummy_isSpawning";

// SETTINGS
// Radius for units spawned at a CCP
//SHGT_medicalDummy_spawner_radius = 5;
// The type of unit to spawn
SHGT_medicalDummy_spawner_unit = "B_Survivor_F";

// INJURY SETTINGS [iterations, minDamage, maxDamage, damageType]
// for GSW (easy/medium/hard/impossible)
/*
SHGT_medicalDummy_spawner_settings_GSW = [
	[5, 0.3, 0.7, "bullet"],
	[10, 0.3, 0.9, "bullet"],
	[20, 0.6, 1.0, "bullet"],
	[30, 0.6, 1.0, "bullet"]
];
// for IEDs (easy/medium/hard/impossible)
SHGT_medicalDummy_spawner_settings_IED = [
	[5, 0.3, 0.7, "explosive"],
	[10, 0.5, 0.7, "explosive"],
	[15, 0.6, 0.8, "explosive"],
	[20, 0.8, 1.0, "explosive"]
];
*/

// STRINGS
// Difficulty levels
SHGT_medicalDummy_str_difficulty_easy = "Spawn Easy Patient";
SHGT_medicalDummy_str_difficulty_medium = "Spawn Medium Patient";
SHGT_medicalDummy_str_difficulty_hard = "Spawn Hard Patient";
SHGT_medicalDummy_str_difficulty_impossible = "Spawn Impossible Patient";

// Injury types
SHGT_medicalDummy_str_wound_GSW = "[GSW]";
SHGT_medicalDummy_str_wound_IED = "[IED]";

// Condition
SHGT_medicalDummy_str_condition_prefix = "This patient is currently";
SHGT_medicalDummy_str_condition_suffix = "...";
SHGT_medicalDummy_str_condition_stable = "stable";
SHGT_medicalDummy_str_condition_unstable = "not stable";

// Interaction
SHGT_medicalDummy_str_interaction_delete = "Delete Patient";
SHGT_medicalDummy_str_interaction_condition = "Check Stability";

// Spawning menu
SHGT_medicalDummy_str_menu_inprogress_prefix = "Difficulty selected:";
SHGT_medicalDummy_str_menu_inprogress_suffix = "Get ready!";
SHGT_medicalDummy_str_menu_busy = "Spawner is already active - please wait!";
SHGT_medicalDummy_str_menu_complete = "Patient spawned, good luck!";

// COLORS
// Difficulty levels: hex
SHGT_medicalDummy_color_difficulty_hex_easy = "#44FF44";
SHGT_medicalDummy_color_difficulty_hex_medium = "#FFAA44";
SHGT_medicalDummy_color_difficulty_hex_hard = "#FF4444";
SHGT_medicalDummy_color_difficulty_hex_impossible = "#AA1111";

// Difficulty levels: text (for the spawner box)
SHGT_medicalDummy_color_difficulty_terminal_easy = "green";
SHGT_medicalDummy_color_difficulty_terminal_medium = "orange";
SHGT_medicalDummy_color_difficulty_terminal_hard = "red";
SHGT_medicalDummy_color_difficulty_terminal_impossible = "purple";

// Injury types
SHGT_medicalDummy_color_injury_GSW = "#FFFF11";
SHGT_medicalDummy_color_injury_IED = "#FF4411";

// Condition
SHGT_medicalDummy_color_condition_stable = "#AAFFAA";
SHGT_medicalDummy_color_condition_unstable = "#FFAAAA";

// Interactions
SHGT_medicalDummy_color_interaction_delete = "#FFAAAA";
SHGT_medicalDummy_color_interaction_condition = "#AAFFAA";

// ICONS
// Interactions
SHGT_medicalDummy_icon_interaction_delete = "a3\ui_f\data\igui\cfg\actions\ico_off_ca.paa";
SHGT_medicalDummy_icon_interaction_condition = "a3\ui_f\data\igui\cfg\holdactions\holdaction_revivemedic_ca.paa";

// DON'T TOUCH ANYTHING BELOW HERE!
//------------------------------------------------

// Terminal Colors
SHGT_medicalDummy_colors_difficulty_terminal = [
	SHGT_medicalDummy_color_difficulty_terminal_easy,
	SHGT_medicalDummy_color_difficulty_terminal_medium,
	SHGT_medicalDummy_color_difficulty_terminal_hard,
	SHGT_medicalDummy_color_difficulty_terminal_impossible
];

// Format injury type strings
SHGT_medicalDummy_str_wound_GSW_f = ["<t color='", SHGT_medicalDummy_color_injury_GSW, "'>", SHGT_medicalDummy_str_wound_GSW, "</t>"] joinString "";
SHGT_medicalDummy_str_wound_IED_f = ["<t color='", SHGT_medicalDummy_color_injury_IED, "'>", SHGT_medicalDummy_str_wound_IED, "</t>"] joinString "";

// Format condition strings
SHGT_medicalDummy_str_condition_stable_f = [SHGT_medicalDummy_str_condition_prefix, " <t color='", SHGT_medicalDummy_color_condition_stable, "'>", SHGT_medicalDummy_str_condition_stable, "</t> ", SHGT_medicalDummy_str_condition_suffix] joinString "";
SHGT_medicalDummy_str_condition_unstable_f = [SHGT_medicalDummy_str_condition_prefix, " <t color='", SHGT_medicalDummy_color_condition_unstable, "'>", SHGT_medicalDummy_str_condition_unstable, "</t> ", SHGT_medicalDummy_str_condition_suffix] joinString "";

// Format interaction strings
SHGT_medicalDummy_str_interaction_delete_f = ["<t color='", SHGT_medicalDummy_color_interaction_delete ,"'>", SHGT_medicalDummy_str_interaction_delete , "</t>"] joinString "";
SHGT_medicalDummy_str_interaction_condition_f = ["<t color='", SHGT_medicalDummy_color_interaction_condition ,"'>", SHGT_medicalDummy_str_interaction_condition , "</t>"] joinString "";

// Format difficulty strings
SHGT_medicalDummy_str_difficulty_easy_f = 			["<t color='", SHGT_medicalDummy_color_difficulty_hex_easy ,"'>", SHGT_medicalDummy_str_difficulty_easy, "</t>"] joinString "";
SHGT_medicalDummy_str_difficulty_medium_f = 		["<t color='", SHGT_medicalDummy_color_difficulty_hex_medium ,"'>", SHGT_medicalDummy_str_difficulty_medium, "</t>"] joinString "";
SHGT_medicalDummy_str_difficulty_hard_f = 			["<t color='", SHGT_medicalDummy_color_difficulty_hex_hard ,"'>", SHGT_medicalDummy_str_difficulty_hard, "</t>"] joinString "";
SHGT_medicalDummy_str_difficulty_impossible_f =	["<t color='", SHGT_medicalDummy_color_difficulty_hex_impossible ,"'>", SHGT_medicalDummy_str_difficulty_impossible, "</t>"] joinString "";

SHGT_medicalDummy_str_difficulty = [
	SHGT_medicalDummy_str_difficulty_easy_f,
	SHGT_medicalDummy_str_difficulty_medium_f,
	SHGT_medicalDummy_str_difficulty_hard_f,
	SHGT_medicalDummy_str_difficulty_impossible_f
];


// [injury name (str), spawner settings (arr)]
SHGT_medicalDummy_spawner_settings = [
	[ 
		SHGT_medicalDummy_str_wound_GSW_f,
		SHGT_medicalDummy_spawner_settings_GSW
	],
	[ 
		SHGT_medicalDummy_str_wound_IED_f,
		SHGT_medicalDummy_spawner_settings_IED
	]
];

// spawn a training dummy
// parameters:
// _target (object): The target to spawn the object at.
// _isCCP (boolean): Is this box a CCP? Allows for multiple patients to be spawned.
// RETURNS: the unit.
SHGT_medicalDummy_spawnDummy = {
	params ["_target", "_isCCP"];

	// Set variables based on whether or not this is a CCP.
	// CCPs and regular spawners have different position requirements and deletion processes.
	_position = getPosATL _target;
	_delete = {[_arguments select 0] call SHGT_medicalDummy_deletePatient;};
	
	if _isCCP then {
		_delete = {[_target] call SHGT_medicalDummy_removeStretcher;};
		
		// If this is a CCP, we're gonna want to randomize the positions a bit in order to prevent the stretchers being stacked.
		_r=SHGT_medicalDummy_spawner_radius;
		_position = [
			(_position select 0) + (random _r) - (random _r),
			(_position select 1) + (random _r) - (random _r),
			_position select 2
		];
	};

	// Spawn the unit
	_unit = group player createUnit [SHGT_medicalDummy_spawner_unit, _position, [], 0, "form"];
	
	// Set unit attributes
	_unit setVariable ["acex_headless_blacklist", true];
	_unit setVariable ["ace_medical_damageThreshold", 1000, true];
	
	// Disable the AI
	_unit disableAI "ALL";
	
	// Remove items
	removeAllweapons _unit;
	removeGoggles _unit;
	removeHeadgear _unit;
	removevest _unit;
	removeAllAssignedItems _unit;
	clearAllitemsfromBackpack _unit;
	removeBackpack _unit;
	
	// Create the stretcher, lock the unit into it.
	_stretcher = createvehicle [SHGT_medicalDummy_stretcher_object, _position, [], 0, "CAN_COLLIDE"];
	_unit moveInCargo _stretcher;
	_stretcher lock true;

	// If this is not a CCP, update the variable
	if (!_isCCP) then {
		_target setVariable [SHGT_medicalDummy_var_stretcher, _stretcher, true];
	};

	// Add a hold interaction to delete the unit on the stretcher.
	[
		_stretcher, 
		SHGT_medicalDummy_str_interaction_delete_f, 
		SHGT_medicalDummy_icon_interaction_delete, 
		SHGT_medicalDummy_icon_interaction_delete, 
		"true", 
		"true", 
		{}, 
		{},
		_delete,
		{},
		[_target],
		5,
		1
	] call BIS_fnc_holdActionAdd;

	//a3\ui_f\data\igui\cfg\actions\unloadincapacitated_ca.paa

	// Add a hold interaction to check if the unit is stable.
	[
		_stretcher, 
		SHGT_medicalDummy_str_interaction_condition_f, 
		SHGT_medicalDummy_icon_interaction_condition, 
		SHGT_medicalDummy_icon_interaction_condition, 
		"true", 
		"true", 
		{}, 
		{},
		{
			_patient = _arguments select 0;
			_condition = SHGT_medicalDummy_str_condition_unstable_f;
			if ([_patient] call ace_medical_status_fnc_hasStableVitals) then {
				_condition = SHGT_medicalDummy_str_condition_stable_f;
			};
			hint parseText (_condition);
		},
		{},
		[_unit],
		10,
		2,
		false,
		true
	] call BIS_fnc_holdActionAdd;


	_unit
};

// apply a set amount of wounds to a given unit over a given number of iterations.
// parameters:
// _target (object): The unit to add damage to.
// _iterations (integer): How many passes should be taken at the unit?
// _mindamage (float, 0-1): What is the minumum severity of the damage to be added?
// _maxdamage (float, 0-1): What is the maximum severity of the damage to be added?
// _damagetype (string): The type of damage to apply (bullet, explosive).
// RETURNS: nil
SHGT_medicalDummy_applyWounds = {
	params ["_target", "_iterations", "_mindamage", "_maxdamage", "_damagetype"];
	
	// for each iteration...
	for "_i" from 0 to _iterations do {
		// select a random body part, compute the damage, and add it to the unit
		// ace damage adding only works for [0, 1)
		_part = selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
		_damage = random (_maxdamage - _mindamage) + _mindamage;
		[_target, _damage, _part, _damagetype] call ace_medical_fnc_adddamagetoUnit;
	};
};


SHGT_medicalDummy_deletePatient = {
	params ["_target"];
	_stretcher = _target getVariable SHGT_medicalDummy_var_stretcher;
	[_stretcher] call SHGT_medicalDummy_removeStretcher;
	_target setVariable [SHGT_medicalDummy_var_stretcher, nil, true];
};

SHGT_medicalDummy_removeStretcher = {
	params ["_stretcher"];
	deleteVehicleCrew _stretcher;
	deleteVehicle _stretcher;
};

// Create a medical training spawner.
// parameters:
// _spawner (object): The item to act as a spawner.
// _target (object): The target to create the casualty at.
// _isCCP (bool): Is this spawner a CCP? (Will allow multiple stretchers to be spawned.)
SHGT_medicalDummy_init = {
	params ["_spawner", "_target", "_isCCP"];

	// SHGT_medicalDummy_spawner_settings; 

	// For each type of damage we're adding...
	{
		// ... and for each level of difficulty...
		for "_i" from 0 to 3 do {

			// Define the interaction name
			_name = [_x select 0, SHGT_medicalDummy_str_difficulty select _i] joinstring " ";
			
			// Set the parameters
			_settings = + _x select 1 select _i;
			_settings append [SHGT_medicalDummy_colors_difficulty_terminal select _i, _target, _isCCP, _name];

			// Add the action
			_spawner addAction [_name, 
			{
				// initialize
				params ["_spawner", "_caller", "_actionId", "_args"];

				// If we're already spawning a unit, exit early.
				if (_spawner getVariable [SHGT_medicalDummy_var_spawning, false]) then {
					hint SHGT_medicalDummy_str_menu_busy;
				
				// Otherwise, continue
				} else {
					
					// Set this variable to prevent further spawns until we're ready again.
					_spawner setVariable [SHGT_medicalDummy_var_spawning, true, true];

					// Arguments...
					_iterations = _args select 0;
					_minDamage = _args select 1;
					_maxDamage = _args select 2;
					_damageType = _args select 3;
					_terminalColor = _args select 4;
					_target = _args select 5;
					_isCCP = _args select 6;
					_difficulty = _args select 7;

					// If this is not a CCP, delete the old patient.
					if (!_isCCP && !isNull (_target getVariable SHGT_medicalDummy_var_stretcher)) then {
						[_target] call SHGT_medicalDummy_deletePatient;
						sleep .02;
					};

					// notify the user, set the color of the terminal, and sleep for its animation
					hint parseText ([SHGT_medicalDummy_str_menu_inprogress_prefix, "<br />", _difficulty, "<br />", SHGT_medicalDummy_str_menu_inprogress_suffix] joinString " ");
					[_spawner, "blue", _terminalColor, _terminalColor] call BIS_fnc_DataTerminalColor;
					[_spawner, 3] call BIS_fnc_DataTerminalAnimate;
					sleep 5;

					// Spawn a new patient, notify player
					_unit = [_target, _isCCP] call SHGT_medicalDummy_spawnDummy;
					[_unit, _iterations, _minDamage, _maxDamage, _damageType] call SHGT_medicalDummy_applyWounds;
					hint SHGT_medicalDummy_str_menu_complete;
					
					// Wait a second, then reset the terminal and allow new spawns.
					[_spawner, 0] call BIS_fnc_DataTerminalAnimate;
					sleep 3;
					[_spawner, "blue", "blue", "blue"] call BIS_fnc_DataTerminalColor;
					_spawner setVariable [SHGT_medicalDummy_var_spawning, false, true];
				}

			}, _settings, 6, false, true, "", "true", 10];
		};
	} foreach SHGT_medicalDummy_spawner_settings;
};
