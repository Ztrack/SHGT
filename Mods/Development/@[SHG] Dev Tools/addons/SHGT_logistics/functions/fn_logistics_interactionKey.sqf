Objtarget = cursorTarget;
if (Objtarget isEqualTo objNull) exitWith {};
_target = Objtarget;
if ((player distance _target) > 20) exitWith {systemChat "Target is too far away to interact with! Must be within 20m"};
_targetClass = typeOf _target;
_objNameList = [];
_deleted = false;
{
	_objNameList pushBack (_x select 0);
} forEach SHGT_logistics_list;
if !(_targetClass in _objNameList) exitWith {systemChat format ["Can't interact with %1",typeOf _target]};


// Initialize
private _headline = format ["Interaction Menu"];
_uiArray = [];

// Action 1 - Move Object
_action1 = [];
_textLeft = ["Move Object"];
_textRight = [];
_pictureLeft = [];
_pictureRight = [];
_tooltip = "Move Object";
_data = str _target; 
_value = 1;
_action1 = [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
_uiArray pushBack _action1;

// Action 2 - Delete Object
_action1 = [];
_textLeft = ["Unbuild Object"];
_textRight = [];
_pictureLeft = [];
_pictureRight = [];
_tooltip = "Unbuild Object";
_data = str _target; 
_value = 2;
_action2 = [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
_uiArray pushBack _action2;


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
			if (_value isEqualTo 1) then {systemChat "Action coming soon!"};
			if (_value isEqualTo 2) then {[] call SHGT_fnc_logistics_unbuildAction;};
		};
	},
	"confirm", // reverts to default
	"cancel"  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;