
systemChat "base created";

//objclassName
//supplyCost
//objCategory
baseType = "FOB"; // Initialize, ingore this
vehPlace allowDamage false;

if (objclassName isEqualTo SHGT_persist_hqObjectName) then {baseType = "HQ";};
if (objclassName isEqualTo SHGT_persist_fobObjectName) then {baseType = "FOB";};
if (objclassName isEqualTo SHGT_persist_pbObjectName) then {baseType = "PB";};
isNil {
[
    [false,""],
    //format ["Name this base: %1 x",baseType],
	"Name this base:",
    {
		//_baseName = format["%1 %2",baseType, _text]; // add prefix baseType
		_baseName = format["%1 %2","", _text];
		_pos = getPosATL vehPlace;
		baseMarker = createMarker [_baseName, _pos]; 
		baseMarker setMarkerType "hd_flag";
		baseMarker setMarkerText _baseName;
		vehPlace setVariable ["baseName",_baseName,true];

		_baseRespawn = [];
		if (baseType in SHGT_persist_addSpawnToBases) then {
			_baseRespawn = [missionNamespace,_pos,_baseName] call BIS_fnc_addRespawnPosition;
		};
		if (baseType in SHGT_persist_addPlayerSavingToBases) then {
			[[vehPlace],SHGT_fnc_logistics_baseSavePlayer] remoteExec ["call",0,true];
		};
		vehPlace setVariable ["baseRespawn",_baseRespawn,true];
    },
    "Submit"
] call CAU_UserInputMenus_fnc_text;
};

vehPlace addEventHandler ["Deleted", {
		params ["_entity"];
		_baseMarker = _entity getVariable ["baseName",[]];
		if !(_baseMarker isEqualTo []) then {
		deleteMarker _baseMarker;};
		_baseRespawn = _entity getVariable ["baseRespawn",[]];
		if !(_baseRespawn isEqualTo []) then {
		_baseRespawn call BIS_fnc_removeRespawnPosition;};
}];
// ADDACTION here to change the name



// [ false ] call BIS_fnc_drawRespawnPositions;