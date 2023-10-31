params ["_target"];


_headline = "Select a vehicle to pull from storage";

// Build array for the UI
private _uiArray = [];
{
	private _thisClass = _x select 1; // classname
	private _thisNumber = _x select 2;
	private _thisTag = _x select 0;

	if (_thisNumber <= 0) then {continue};

	if (player getVariable [_thisTag,false] isEqualTo false) then {continue};
	_textLeft = [getText(configFile >> "CfgVehicles" >> _thisClass >> "displayName")];
	if (_textLeft isEqualTo "" or _textLeft isEqualTo [""]) then {_textLeft = _thisClass};
	_textRight = [format ['%1 In %2 Storage', _thisNumber,_thisTag]];
	_pictureLeft = [getText(configFile >> "CfgVehicles" >> _thisClass >> "picture")];
	_pictureRight = [getText(configFile >> "CfgVehicles" >> _thisClass >> "icon"),[1,1,1,1]];
	_tooltip = getText(configFile >> "CfgVehicles" >> _thisClass >> "displayName");
	_data = str [_thisTag,_thisClass, _thisNumber]; //classname
	_value = _forEachIndex;

	_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
} forEach SHGT_garage_vehicleStorage;



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

			if (_value < 0) exitWith {systemChat "None left in storage"};
			_dataOut = parseSimpleArray _data;


			[_dataOut,_value] call SHGT_fnc_garage_spawnVehicle;
		};
	},
	"confirm", // reverts to default
	"cancel"  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;