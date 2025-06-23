// This function will unload all players from a vehicle IF the vehicle dies.

SHGT_vehKilledKickDeadEH = {
    params ["_veh"];
    //systemChat "EH Start";
    if (isNull _veh) exitWith {};
    if !(_veh isKindOf "LandVehicle") exitWith {}; // Entity must be a land vehicle

    private _crew = crew _veh;
    if (_crew isEqualTo []) exitWith {}; // nobody is in the vehicle
    if ((_crew select {isPlayer _x}) isEqualTo []) then {
        // is AI, ignore
    } else {
        //systemChat "unload Start";
        {[_x] call ace_common_fnc_unloadPerson} forEach _crew; // this is a player, unload them
    };
};
addMissionEventHandler ["EntityKilled",{call SHGT_vehKilledKickDeadEH}];


/*
["LandVehicle", "init", {
    _veh = (_this select 0);
    if (isNull _veh) exitWith {};
    //if !(_veh isKindOf "LandVehicle") exitWith {}; // Entity must be a land vehicle

    private _crew = crew _veh;
    if (_crew isEqualTo []) exitWith {}; // nobody is in the vehicle
    if ((_crew select {isPlayer _x}) isEqualTo []) then {
        // is AI, ignore
    } else {
        //systemChat "unload Start";
        {[_x] call ace_common_fnc_unloadPerson} forEach _crew; // this is a player, unload them
    };

}, true, [], true] call CBA_fnc_addClassEventHandler;