
if !(isServer) exitWith {}; // run only on server

// Initialize global variables
SHGT_arsenal_hash = createHashMap;
SHGT_arsenal_classInitHash = createHashMap;
SHGT_arsenal_boxClassNames = [];

private _coreModules = allMissionObjects "SHGT_arsenal_coreModule";

{
	private _coreLogic = _x;
	private _arsenalTraitList = [];
	
	// Get Core module variables
	private _arsenalListCreatorModules = [_coreLogic,"SHGT_arsenal_listCreatorModule"] call BIS_fnc_synchronizedObjects; // Get synchronized list creator modules
	private _boxClassName = (_coreLogic getVariable "SHGT_arsenal_boxName");
	if (count _boxClassName ==0) then {systemChat format ["SHGT Error: You did not assign a box classname to the core module"];}; // Checks for error
	if (_boxClassName == "ARRAY") then {systemChat format ["SHGT Error: Core module currently does not support multiple Arsenal box classnames"];}; // Checks for error
	SHGT_arsenal_boxClassNames pushBackUnique _boxClassName;
	private _arsenalInteraction = (_coreLogic getVariable "SHGT_arsenal_interaction");
	private _arsenalLogo = (_coreLogic getVariable "SHGT_arsenal_logo");
	

	// List creator loop
	{
		private _listCreatorLogic = _x;
		private _arsenalBox = [];

		// Get list creator variables
		private _sync = (synchronizedObjects _listCreatorLogic); // Get the attached arsenal box
		if (typeName _sync == "ARRAY") then {
			{if !(_x isKindOf "Logic") then {
				_arsenalBox pushBackUnique _x;};
			} forEach _sync;
		} else {_arsenalBox = _sync;};

		//private _arsenalBox = [_listCreatorLogic,_boxClassName] call BIS_fnc_synchronizedObjects;
		if (count(_arsenalBox)!=1) exitWith{systemChat format ["SHGT ERROR: You can only connect 1 arsenal box to listcreator module. You have %1 connected",count(_ArsenalBox)];}; // Checks for error
		_arsenalBox = _arsenalBox select 0; // convert from string

		//Get trait
		private _trait = (_listCreatorLogic getVariable "SHGT_arsenal_listName");
		if (count _trait ==0) exitWith{systemChat format ["SHGT Error: You did not assign a trait to an assigner module"];}; // Checks for error
		if (_trait == "ARRAY") exitWith{systemChat format ["SHGT Error: You can only assign 1 trait per trait assigner module"];}; // Checks for error

		// Get item List and flatten it
		private _itemList = [_arsenalBox] call ace_arsenal_fnc_getVirtualItems;
		_itemList = keys _itemList;

		// Get custom list input
		private _itemListManual = (_listCreatorLogic getVariable "SHGT_arsenal_listManualInput");
		if !((_itemListManual isEqualTo []) or (_itemListManual isEqualTo "") or (typeName _itemListManual != "STRING")) then {_itemListManual = parseSimpleArray _itemListManual;} else {_itemListManual = []};
		
		// get assigned player UIDs
		private _uids = (_listCreatorLogic getVariable "SHGT_arsenal_playerUIDs");
		if !((_uids isEqualTo []) or (_uids isEqualTo "") or (typeName _uids != "STRING")) then {_uids = parseSimpleArray _uids;} else {_uids = []};

		// Delete box
		deleteVehicle _arsenalBox;

		// Combine lists if applicable
		if !(_itemListManual isEqualTo []) then {_itemList append _itemListManual;};

		// Save list to hash
		private _savedList= [_trait, _itemList,_uids];
		SHGT_arsenal_hash getOrDefault [_trait, _savedList, true]; // Format hash list. If value doesnt yet exist it will be updated.

		// Save trait 
		_arsenalTraitList pushBackUnique _trait;

		// Cleanup
	} forEach _arsenalListCreatorModules;

	SHGT_arsenal_classInitHash getOrDefault [_boxClassName, [_arsenalTraitList,_arsenalInteraction,_arsenalLogo], true];

	// Start CBA Init handler to add interaction
	[_boxClassName,SHGT_fnc_arsenal_playerInteraction] remoteExec ["call",0,true];

} forEach _coreModules;

// Cleanup
{deleteVehicle _x} forEach _coreModules;
private _listCreatorModules = allMissionObjects "SHGT_arsenal_listCreatorModule";
{deleteVehicle _x} forEach _listCreatorModules;

// Public Variables set
publicVariable "SHGT_arsenal_hash";
publicVariable "SHGT_arsenal_classInitHash";
publicVariable "SHGT_arsenal_boxClassNames";


