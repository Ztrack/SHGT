// This function creates an addaction for players to select how to interact with the civ
// _actions array holds information for each interaction in the form of [["Action/question 1 name",Function 1 to call],["Action/question 2 name",Function 2 to call]]
// Example: _actions = [["Give Humanitarian Ration",SHGT_fnc_civInteract_giveHumrat],["Any Enemies nearby?",SHGT_fnc_civInteract_intelEnemy]];
if !(hasInterface) exitWith {};

params ["_unit"];
//systemChat str _unit;
if !(alive _unit) exitWith {private _id = _unit getVariable ["_SHGT_civInteractionID",'not found']; if !(_id isEqualTo 'not found') then {_unit removeAction _id;}};
SHGT_civInteract_GUIactions = [["Do you support us?",SHGT_fnc_civInteract_Question_1],["What is the opinion of our forces in this area?",SHGT_fnc_civInteract_Question_2],["What town do you live in?",SHGT_fnc_civInteract_Question_3],["Give Humanitarian Ration",SHGT_fnc_civInteract_giveHumrat],["Any Enemies nearby?",SHGT_fnc_civInteract_intelEnemy],["Any nearby IEDs?",SHGT_fnc_civInteract_intelIED]];
_headline = "Select Interaction";


_SHGT_civInteractionID = _unit addAction ["Interact", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	if !(alive _target) exitWith {systemChat "He's dead jim";};
	_actions = _arguments select 0;
	_headline = _arguments select 1;
	SHGT_civInteract_GUIUnit = _target;
	
	// Build array for the UI
	private _uiArray = [];
	{	
	_textLeft = [_x select 0];
	_textRight = [];
	_pictureLeft = []; //[getText(configFile >> "CfgVehicles" >> _x select 0 >> "picture")];
	_pictureRight = []; //][getText(configFile >> "CfgVehicles" >> _x >> "icon"),[1,1,1,1]];
	_tooltip = "";
	_data = str [_target,0];
	_value = 0;
	_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
	} forEach _actions;

	[
	[
		_uiArray,
		0, // Selects the _x option as default
		false // Multi select disabled
	],
	_headline,
	{
		//systemchat format["_confirmed: %1",_confirmed];
		//systemchat format["_index: %1",_index];
		//systemchat format["_data: %1",_data];
		//systemchat format["_value: %1",_value];
		if _confirmed then {
			_unit = SHGT_civInteract_GUIUnit;
			_function = (SHGT_civInteract_GUIactions select _index) select 1;
			[_unit] call _function; // Runs in unscheduled
			if !(SHGT_civInteract_responseSounds isEqualTo []) then {
				[_unit, [selectRandom SHGT_civInteract_responseSounds,25]] remoteExec ["say3D",0];
				_unit setRandomLip true;
				[{params ["_unit"]; _unit setRandomLip false;}, [_unit], 5] call CBA_fnc_waitAndExecute;
			};
		};
	},
	"confirm", // reverts to default
	"cancel"  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;



},[SHGT_civInteract_GUIactions,_headline],6,true,true,"","true",4];


/*
// Local killed EH to remove interaction on death
_unit setVariable ["_SHGT_civInteractionID",_SHGT_civInteractionID];
_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_id = _unit getVariable ["_SHGT_civInteractionID",'not found'];
	if (_id isEqualTo 'not found') exitWith {};
	_unit removeAction _id; // Remove civ interaction addaction
}];