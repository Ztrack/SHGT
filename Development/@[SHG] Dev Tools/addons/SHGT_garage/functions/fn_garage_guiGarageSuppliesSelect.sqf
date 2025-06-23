params ["_target"];


_headline = "Select a supply type to pull";

// Build array for the UI
private _uiArray = [];
{
	private _thisClass = _x; // classname

	_textLeft = [getText(configFile >> "CfgVehicles" >> _thisClass >> "displayName")];
	if (_textLeft isEqualTo "" or _textLeft isEqualTo [""]) then {_textLeft = [_thisClass]};
	_textRight = [""];
	_pictureLeft = [getText(configFile >> "CfgVehicles" >> _thisClass >> "picture")];
	_pictureRight = [getText(configFile >> "CfgVehicles" >> _thisClass >> "icon"),[1,1,1,1]];
	_tooltip = getText(configFile >> "CfgVehicles" >> _thisClass >> "displayName");
	_data = str [_thisClass];
	_value = _forEachIndex;

	_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
} forEach SHGT_garage_supplies;



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

			_class = SHGT_garage_supplies select _value;
			_veh = createVehicle [_class, position player, [], 0, "NONE"];
			_veh setDamage 0;
		};
	},
	"confirm", // reverts to default
	"cancel"  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;