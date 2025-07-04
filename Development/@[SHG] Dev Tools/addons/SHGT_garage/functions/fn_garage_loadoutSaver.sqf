// Import Logic
_logic = param [0,objNull,[objNull]];

/*
// Create Hash
SHGT_ArsenalHash = createHashMap;
SHGT_ArsenalClassInitHash = createHashMap;



// Get sync targets
_ArsenalListCreatorModules = [_logic,"SHGT_ArsenalListCreator"] call BIS_fnc_synchronizedObjects; // Get synchronized list creator modules
//if (isNil _ArsenalListCreatorModules) exitWith{systemChat format ["SHGT ERROR: You need a SHGT core module connected to each listcreator"];}; // Checks for error

// Get variables from logic
_boxClassName = (_logic getVariable "SHGT_ArsenalBoxName");
if (count _boxClassName ==0) exitWith{systemChat format ["SHGT Error: You did not assign a box classname to the core module"];}; // Checks for error
if (_boxClassName == "ARRAY") exitWith{systemChat format ["SHGT Error: Core module currently does not support multiple Arsenal box classnames"];}; // Checks for error
_SHGT_ArsenalInteraction = (_logic getVariable "SHGT_ArsenalInteraction");

// Build full arsenal list
_SHGT_ArsenalTraitList = [];
{
	waitUntil {_x getVariable ["_moduleReady", false]};
	_subList = (_x getVariable "_SHG_ArsenalTraitList"); // Get list
	_subTrait = (_x getVariable "SHGT_ArsenalListName");
	SHGT_ArsenalHash getOrDefault [_subTrait, _subList, true]; // Format hash list. If value doesnt yet exist it will be updated.
	publicVariable "SHGT_ArsenalHash";
	_SHGT_ArsenalTraitList pushBackUnique _subTrait;
} forEach _ArsenalListCreatorModules;

// Set hash
SHGT_ArsenalClassInitHash getOrDefault [_boxClassName, [_SHGT_ArsenalTraitList,_SHGT_ArsenalInteraction], true];
publicVariable "SHGT_ArsenalClassInitHash";

[[_boxClassName],"SHGTArsenal\scripts\SHGTArsenalInit.sqf"] remoteExec ["execVM",0,true];