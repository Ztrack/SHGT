// This script will allow players to interact with an arsenal box to save & pull boxes filled with supplies
// Interaction 1: Save a crate to the server profile. Should save the box type, all contents, and input a profile name
// Interaction 2: Player will have a UI popup to spawn a saved supply box loadout

// Server Init
if (isServer) then {
	// Broadcast public variables
	publicVariable "SHGT_logistics_boxSaverStatus";
	publicVariable "SHGT_logistics_boxSaverInterActionObjectClass";
	publicVariable "SHGT_logistics_boxSaverAdminTags";
	publicVariable "SHGT_logisticsBoxEmpty";
	SHGT_logisticsBoxDatabase = profileNamespace getVariable ["SHGT_logisticsBoxDatabase", createHashMap];
	if (typeName SHGT_logisticsBoxDatabase != "HASHMAP") exitWith { SHGT_logisticsBoxDatabase = createHashMap};
	publicVariable "SHGT_logisticsBoxDatabase";
};

// Initialize status
if !(SHGT_logistics_boxSaverStatus isEqualTo true) exitWith {};

// player Init:
if !(hasInterface) exitWith {};

// Initialize class EH
[SHGT_logistics_boxSaverInterActionObjectClass, "init", {
	private _obj = (_this select 0);

	// ADDACTION 1 START - Pulling resupply box
	_obj addAction ["Boxfiller - Pull a resupply box", {

		// get supply box profile name
		//_boxProfileName = 'testBox1';
		private _headline = "Select a resupply box profile";
		private _Logilist = keys SHGT_logisticsBoxDatabase;
		_Logilist sort true;
		private _uiArray = [];
		{
			_textLeft = [_x];
			_textRight = [];
			_pictureLeft = [];
			_pictureRight = [];
			_tooltip = "";
			_data = _x;
			_value = 0;
		_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
		} forEach _Logilist;

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

			_boxProfileName = _data;
			// Load supply box params
			_boxParams = SHGT_logisticsBoxDatabase get _boxProfileName;
			_boxType = _boxParams select 0;
			_contents = _boxParams select 1;

			// Create Object
			_obj = createVehicle [_boxType,getPosATL player,[],0,"NONE"];
			if (_obj == objNull) exitWith {systemChat "Area is too cluttered"};

			// Clear cargo
			clearItemCargoGlobal _obj;
			clearMagazineCargoGlobal _obj;
			clearWeaponCargoGlobal _obj;
			clearBackpackCargoGlobal _obj;

			// Add cargo
			private _items = (_contents select 0);
			if ((count (_items select 0)) >0) then {
			{ 
				_obj addItemCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];
			} forEach (_items select 0); };

			private _items = (_contents select 1);
			if ((count (_items select 0)) >0) then {
			{ _obj addMagazineCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];
			} forEach (_items select 0); };

			private _items = (_contents select 2);
			if ((count (_items select 0)) >0) then {
			{ _obj addWeaponCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];
			} forEach (_items select 0); };

			private _items = (_contents select 3);
			if ((count (_items select 0)) >0) then {
			{ _obj addBackpackCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];
			} forEach (_items select 0); };
			systemChat format ["Created resupply box [%1] nearby",_boxProfileName];
			}; // end if confirmed
		},
		"confirm", // reverts to default
		"cancel"  // reverts to default, disable cancel option
		] call CAU_UserInputMenus_fnc_listbox;
	}, [], 1.5, false, true, "", 'true', 10];

	// Initialize Interaction 2 - Save nearest box from arsenal

	_obj addAction ["Boxfiller - Save nearest box from arsenal to server", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_list = nearestObjects [getPosATL _target, ["ReammoBox_F"], 20];
		_index = _list find _target;
		_list deleteAt _index;
		if (_list isEqualTo []) exitWith {systemChat "no boxes nearby"};
		private _box = _list select 0;
		_boxType = typeOf _box;
		_contents = [getItemCargo _box, getMagazineCargo _box, getWeaponCargo _box, getBackpackCargo _box];
		SHGT_boxParams = [_boxType,_contents];
		
		
		// run UI function
		//_boxName = 'testBox1';
		
		[
    		[false,""],
    		"Name this supply box",
    		{
        		systemchat format["Submitted flavour: %1",_text];
				_boxName = _text;
				if (_boxName isEqualTo '') exitWith {systemChat "add a profile name to save";};


				// Save to database
				SHGT_logisticsBoxDatabase set [_boxName,SHGT_boxParams];
				publicVariable "SHGT_logisticsBoxDatabase";
				[{
					if !(isServer) exitWith {};
					[] spawn {
						sleep 5;
						// save database
						profileNamespace setVariable ["SHGT_logisticsBoxDatabase", SHGT_logisticsBoxDatabase];
						saveProfileNamespace;
					};
				}] remoteExec ["call",0];

    		},
    		"Submit"
		] call CAU_UserInputMenus_fnc_text;
		
	}, [], 1.5, false, true, "", 'true', 10];



	// ADDACTION 3 - Deleting a profile

	_obj addAction ["Boxfiller - Delete a resupply box profile", {

		// get supply box profile name
		//_boxProfileName = 'testBox1';
		_headline = "Delete a resupply box profile";

		private _uiArray = [];
		{
			_textLeft = [_x];
			_textRight = [];
			_pictureLeft = [];
			_pictureRight = [];
			_tooltip = "";
			_data = _x;
			_value = 0;
		_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
		} forEach SHGT_logisticsBoxDatabase;

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

			_boxProfileName = _data;
			// Load supply box params
			_boxParams = SHGT_logisticsBoxDatabase get _boxProfileName;
			
			// Save to database
				SHGT_logisticsBoxDatabase deleteAt _boxProfileName;
				publicVariable "SHGT_logisticsBoxDatabase";
				[{
					if !(isServer) exitWith {};
					[] spawn {
						sleep 5;
						// save database
						profileNamespace setVariable ["SHGT_logisticsBoxDatabase", SHGT_logisticsBoxDatabase];
						saveProfileNamespace;
					};
				}] remoteExec ["call",0];

			systemChat format ["Deleted resupply box profile [%1]",_boxProfileName];
			}; // end if confirmed
		},
		"confirm", // reverts to default
		"cancel"  // reverts to default, disable cancel option
		] call CAU_UserInputMenus_fnc_listbox;
	}, [], 1.5, false, true, "", 'true', 10];

	// ADDACTION 4 - Spawning an empty box

	_obj addAction ["Boxfiller - Pull an empty resupply box", {

		// get supply box profile name
		//_boxProfileName = 'testBox1';
		_headline = "Pull an empty resupply box";
		private _uiArray = [];
		{
			_textLeft = [gettext (configFile >> "CfgVehicles" >> _x >> "displayName")];
			_textRight = [];
			_pictureLeft = [];
			_pictureRight = [];
			_tooltip = "";
			_data = _x;
			_value = 0;
		_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
		} forEach SHGT_logisticsBoxEmpty;

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

			_boxType = _data;

			// Create Object
			_obj = createVehicle [_boxType,getPosATL player,[],0,"NONE"];
			if (_obj == objNull) exitWith {systemChat "Area is too cluttered"};

			// Clear cargo
			clearItemCargoGlobal _obj;
			clearMagazineCargoGlobal _obj;
			clearWeaponCargoGlobal _obj;
			clearBackpackCargoGlobal _obj;

			systemChat format ["Delivered empty resupply box: [%1]",_boxType];
			}; // end if confirmed
		},
		"confirm", // reverts to default
		"cancel"  // reverts to default, disable cancel option
		] call CAU_UserInputMenus_fnc_listbox;
	}, [], 1.5, false, true, "", 'true', 10];

	_obj addAction ["Boxfiller - Put away nearest box", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_list = nearestObjects [getPosATL _target, ["ReammoBox_F"], 20];
		_index = _list find _target;
		_list deleteAt _index;
		if (_list isEqualTo []) exitWith {systemChat "no boxes nearby"};
		private _box = _list select 0;
		deleteVehicle _box;
		
	}, [], 1.5, false, true, "", 'true', 10];

	// ADDACTION 5 START - Fill nearest vehicle with supply box content
	_obj addAction ["Boxfiller - Fill nearest vehicle with supply box content", {

		// get supply box profile name
		//_boxProfileName = 'testBox1';
		_headline = "Select a resupply box profile";

		private _uiArray = [];
		{
			_textLeft = [_x];
			_textRight = [];
			_pictureLeft = [];
			_pictureRight = [];
			_tooltip = "";
			_data = _x;
			_value = 0;
		_uiArray pushBack [_textLeft,_textRight,_pictureLeft,_pictureRight,_tooltip,_data,_value];
		} forEach SHGT_logisticsBoxDatabase;

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
			_boxProfileName = _data;

			// Load supply box params
			_boxParams = SHGT_logisticsBoxDatabase get _boxProfileName;
			_contents = _boxParams select 1;

			// near nearest vehicle
			_list = nearestObjects [getPosATL player, ["Car", "Tank","Plane","Helicopter","Ship"], 20];
			if (_list isEqualTo []) exitWith {systemChat "no vehicles nearby"};
			private _obj = _list select 0;

			// fill container
			_fullReturn = [_obj,_contents,true] call SHGT_fnc_logistics_fillContainer;

			// report results
			if (_fullReturn == true) then {
				systemChat format ["Some items from [%1] couldnt fit",_boxProfileName]} 
			else {
				systemChat format ["Filled nearest vehicle with box profile [%1]",_boxProfileName];
			}
			}; // end if confirmed
		},
		"confirm", // reverts to default
		"cancel"  // reverts to default, disable cancel option
		] call CAU_UserInputMenus_fnc_listbox;
	}, [], 1.5, false, true, "", 'true', 10];

	_obj addAction ["Boxfiller - Clear nearest vehicle contents", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		// near nearest vehicle
		_list = nearestObjects [getPosATL player, ["Car", "Tank","Plane","Helicopter","Ship"], 20];
		if (_list isEqualTo []) exitWith {systemChat "no vehicles nearby"};
		private _obj = _list select 0;

		// Clear cargo
		clearItemCargoGlobal _obj;
		clearMagazineCargoGlobal _obj;
		clearWeaponCargoGlobal _obj;
		clearBackpackCargoGlobal _obj;
		
	}, [], 1.5, false, true, "", 'true', 10];


}, true, [], true] call CBA_fnc_addClassEventHandler;






// how to remoteExec call with params:
// [[62],{params ["_a"]; systemChat str _a;}] remoteExec ["call",0];

