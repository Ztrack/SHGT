// This function calls the GUI so that the player can select a location to land to. It should populate a list based on editor/zeus defined locations & player FOBs
params ["_helo"];

// Step 1: Initialize globals
SHGT_transport_allLandingLocations = [];
_headline = "Designate LZ";

// Step 2: Build the List
// Step 2: Get all editor defined locations
private _definedLandingList = [];


// Step 3: Get all player FOB locations
private _baseList = (allMissionObjects SHGT_logistics_hqObjectName) + (allMissionObjects SHGT_logistics_fobObjectName) + (allMissionObjects SHGT_logistics_pbObjectName);
SHGT_transport_allLandingLocations = SHGT_transport_definedLocations + _baseList; // must be in global var

// Step 4: Build array for the UI
private _uiArray = [];
{
	private _thisObj = _x;
	private _thisName = _thisObj getVariable ["baseName","Un-named Base"];
	private _thisPos = getPosATL _thisObj; 
	_thisPos deleteAt 2;
	_thisPos apply {floor _x};

	_textLeft = [_thisName];
	_textRight = [str _thisPos];
	_pictureLeft = []; //[getText(configFile >> "CfgVehicles" >> _x select 0 >> "picture")];
	_pictureRight = []; //][getText(configFile >> "CfgVehicles" >> _x >> "icon"),[1,1,1,1]];
	_tooltip = "";
	//_data = str [_helo,_thisObj]; //obj
	_data = '';
	_value = _forEachIndex; // num value

	_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
} forEach SHGT_transport_allLandingLocations;

// Step 5: Call UI function
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
			_loc = SHGT_transport_allLandingLocations select _value;
			_helo = SHGT_transport_activeHelo select 0;
			[[_helo,getPosATL _loc,true,player],SHGT_fnc_transport_flightOrder] remoteExec ["spawn", _helo];

			// Step 5: Pass selected location to helicopter crew

		};
	},
	"confirm", // reverts to default
	"cancel"  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;