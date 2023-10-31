if (player getVariable ["placing",false] or player getVariable ["building",false]) exitWith {systemChat "you are already building."};
if (vehicle player != player) exitWith {systemChat "You cannot build from a vehicle"};

private _objListCost = [];
private _detected = [];
private _categories = [];
private _nearbySupplyPoints = nearestObjects [getPosATL player, SHGT_logistics_cargoCapable,SHGT_logistics_supplySearchRadius];

// Determine what categories can spawn
if ((count ((getPosATL player) nearObjects [SHGT_persist_hqObjectName, SHGT_persist_radiusToSaveHq]) >0) and ([player, "ACE_Fortify"] call BIS_fnc_hasItem)) then {
	_detected = "HQ";
	_categories = SHGT_logistics_categories getOrDefault ["HQ", "NotFound"];
}; // find if an HQ exists
if ((count ((getPosATL player) nearObjects [SHGT_persist_fobObjectName, SHGT_persist_radiusToSaveFob]) >0) and ([player, "ACE_Fortify"] call BIS_fnc_hasItem)) then {
	_detected = "FOB";
	_categories = SHGT_logistics_categories getOrDefault ["FOB", "NotFound"];
}; // find if a FOB exists
if ((count ((getPosATL player) nearObjects [SHGT_persist_pbObjectName, SHGT_persist_radiusToSavePb]) >0) and ([player, "ACE_Fortify"] call BIS_fnc_hasItem)) then {
	_detected = "PB";
	_categories = SHGT_logistics_categories getOrDefault ["PB", "NotFound"];
}; // find if a PB exists
if (_detected isEqualTo []) then {
	_detected="No Bases";
	if ((count _nearbySupplyPoints) > 0) then {
		// If nearby a supply crate, set to GLOBAL
		_categories = SHGT_logistics_categories getOrDefault ["GLOBAL", "NotFound"]; // Set default to global list if no bases are found
	} else {
		// If not nearby a supply crate nor a base, set to personal supplies only.
		_categories = ["PERSONAL"];
	};
}; // If no nearby base exists

// Remove base building if player has no fortify tool
if !([player, "ACE_Fortify"] call BIS_fnc_hasItem) then {_categories = _categories - ["CREATION"];};

// If a base exists within set radius, remove ability to put down bases
if (count ((getPosATL player) nearObjects [SHGT_persist_HqObjectName, SHGT_persist_radiusToNextBase]) >0) then {_categories = _categories - ["CREATION"];};
if (count ((getPosATL player) nearObjects [SHGT_persist_FobObjectName, SHGT_persist_radiusToNextBase]) >0) then {_categories = _categories - ["CREATION"];};
if (count ((getPosATL player) nearObjects [SHGT_persist_PbObjectName, SHGT_persist_radiusToNextBase]) >0) then {_categories = _categories - ["CREATION"];};

// Make headline for GUI
private _headline = format ["%1 detected, select an object to build",_detected];

// Build buildable array
{
	if ((_x select 2) in _categories) then {
		_objListCost pushBackUnique [_x select 0,_x select 1,_x select 2];
	};
} forEach SHGT_logistics_list;

// Add PB to be buildable if not nearby a base & player has fortify tool
if ((_detected isEqualTo "No Bases") and ([player, "ACE_Fortify"] call BIS_fnc_hasItem) and (count ((getPosATL player) nearObjects [SHGT_persist_FobObjectName, SHGT_persist_radiusToSavePb*2]) isEqualTo 0)) then {
	_objListCost pushBackUnique [SHGT_persist_PbObjectName,SHGT_persist_pbCost,"CREATION"];
};

// Build array for the UI
private _uiArray = [];
{
	private _thisClass = (_x select 0);
	private _thisCost = (_x select 1);
	private _thisCategory = (_x select 2);

	// Check if cost is negative, if so then skip
	if (_thisCost < 0) then {continue};
	
	_textLeft = [getText(configFile >> "CfgVehicles" >> _thisClass >> "displayName")];
	if (_textLeft isEqualTo "" or _textLeft isEqualTo [""]) then {_textLeft = [_x select 0]};
	_textRight = [format ['%1 Supply', _thisCost]];
	_pictureLeft = []; //[getText(configFile >> "CfgVehicles" >> _x select 0 >> "picture")];
	_pictureRight = []; //][getText(configFile >> "CfgVehicles" >> _x >> "icon"),[1,1,1,1]];
	_tooltip = getText(configFile >> "CfgVehicles" >> _thisClass >> "displayName");
	_data = str [_thisClass,_thisCost,_thisCategory]; //classname
	_value = _thisCost; // itemcost

	// Special object If-statements
	if (_thisClass isEqualTo SHGT_persist_hqObjectName) then {_textLeft=["BUILD HQ",[159/225,43/225,104/225,1]]};
	if (_thisClass isEqualTo SHGT_persist_fobObjectName) then {_textLeft=["BUILD FOB",[159/225,43/225,104/225,1]]};
	if (_thisClass isEqualTo SHGT_persist_pbObjectName) then {_textLeft=["BUILD PB",[159/225,43/225,104/225,1]]};
	if (_thisClass isEqualTo SHGT_persist_saveObject) then {_textLeft=["BUILD PERSIST SAVE OBJECT",[159/225,43/225,104/225,1]]};
	if (_thisClass isEqualTo SHGT_logistics_supplySource) then {_textLeft=["BUILD SUPPLY DEPOT",[159/225,43/225,104/225,1]]};

	_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
} forEach _objListCost;



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
			_data = parseSimpleArray _data;
			[_data] call SHGT_fnc_logistics_placeObject; // Run in unscheduled
		};
	},
	"confirm", // reverts to default
	"cancel"  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;

// [] execVM "scripts\logistics\SHGT_logistics_guiUserSelectObject.sqf";


// var select 0 = [['name','color'],['picture'],['icon',[1,1,1,1]],['tooltip on hover'],['data'],[number]

/*
Given 
// selecting first idx is 
[["Hatchback (Sport)"],[],["\A3\soft_f_gamma\Hatchback_01\Data\UI\car_CA.paa"],["\A3\soft_f_gamma\Hatchback_01\Data\UI\map_car_CA.paa",[0.302847,0.723311,0.779141,1]],"Hatchback (Sport)","C_Hatchback_01_sport_F",2]
#0 = name "Hatchback (Sport)" #0#1 is color 
#1 = 


//use getvariable setvariable to store last selected option for quick access. Setup hotkey to repeat action
OTHER OPTION: https://community.bistudio.com/wiki/CT_CONTROLS_TABLE
https://github.com/ConnorAU/A3UserInputMenus/wiki/CAU_UserInputMenus_fnc_listBox#example-1
Parameters : Array - Data applied to the display when created
    0. Items: Array
        Item Data: Array - Any number of arrays defining information used to create list rows
            0. Text Data: Array
                0. Text: String
                1. Color: Array (Optional) - Default [1,1,1,1]
            1. Text Right Data (Optional, same format as Text Data)
            2. Picture Data (Optional, same format as Text Data)
            3. Picture Right Data (Optional, same format as Text Data)
            4. Tooltip: String (Optional)
            5. Data: String (Optional)
            6. Value: Number (Optional)
    1. Start Index: Number (Optional) - Default 0. List row index selected when the display opens
    2. Multi Select: Bool (Optional) - Default false. Enables selecting multiple list entries
Title: String (Optional)
Button Clicked Code: Code OR Array (Optional)
    If Array, format is [Code,Any] where Any is arguments provided as _this
    Special Variables:
        _confirmed: Bool - true if user clicked confirm button, false if they clicked cancel button
        _index: Number - Index of the selected row (Array of numbers when multi select is enabled)
        _data: String - lbData of the selected row (Array of strings when multi select is enabled)
        _value: Number - lbValue of the selected row (Array of numbers when multi select is enabled)
Button Confirm Text: String (Optional) - Default "Ok"
Button Cancel Text: String (Optional) - Default "Cancel". If not defined, the cancel option will be disabled
Parent Display: Display (Optional) - Used when you need to force the dialog to open on top of a display


--------------
private _vehicles = [
	"C_Hatchback_01_sport_F",
	"C_Kart_01_F",
	"C_Offroad_02_unarmed_F",
	"C_Offroad_01_F",
	"C_Quadbike_01_F",
	"C_SUV_01_F",
	"C_Van_01_box_F"
] apply {
	[
		[getText(configFile >> "CfgVehicles" >> _x >> "displayName")],
		[],
		[getText(configFile >> "CfgVehicles" >> _x >> "picture")],
		[getText(configFile >> "CfgVehicles" >> _x >> "icon"),[random 1,random 1,random 1,1]],
		getText(configFile >> "CfgVehicles" >> _x >> "displayName"),
		_x,
		getNumber(configFile >> "CfgVehicles" >> _x >> "scope")
	]
};

[
	[
		_vehicles,
		4, // Selects the quadbike by default
		false // Multi select disabled
	],
	"Vehicle selection",
	{
		systemchat format["_confirmed: %1",_confirmed];
		systemchat format["_index: %1",_index];
		systemchat format["_data: %1",_data];
		systemchat format["_value: %1",_value];
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;




