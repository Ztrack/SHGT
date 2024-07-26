params ["_target"];

_headline = "Select a unit garage to store this vehicle in";
//SHGT_garage_tags
// Build array for the UI
private _uiArray = [];
{
	private _thisTag = _x; // classname

	
	_textLeft = [_thisTag];
	_textRight = [];
	_pictureLeft = [];
	_pictureRight = [];
	_tooltip = "";
	_data = _thisTag;
	_value = 0;

	_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
} forEach SHGT_garage_tags;



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
			_nearObj = nearestObjects [player, ["Car", "Tank","Plane","Helicopter","Ship"], 25];
			if (_nearObj isEqualTo []) exitWith {systemChat "Nothing nearby to store";};
			_obj = _nearObj select 0; 
			_class = typeOf _obj;
			_tag = _data;
			_idx = []; // Init
			_numLeft = []; // Init

			{
				_thisTag = _x select 0;
				_thisClass = _x select 1;
				_thisLeft = _x select 2;
				if ((_tag isEqualTo _thisTag) and (_class isEqualTo _thisClass)) then {
					_idx = _forEachIndex;
					_numLeft = _thisLeft;
					breakWith "END";
				};
			} forEach SHGT_garage_vehicleStorage;

			if (_idx isEqualTo []) then {SHGT_garage_vehicleStorage pushback [_tag,_class,1];};
			if !(_idx isEqualTo []) then {SHGT_garage_vehicleStorage set [_idx,[_tag,_class,_numLeft+1]];};

			deleteVehicle _obj;
			publicVariable "SHGT_garage_vehicleStorage";
			systemChat "Vehicle stored";
		};
	},
	"confirm", // reverts to default
	"cancel"  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;































