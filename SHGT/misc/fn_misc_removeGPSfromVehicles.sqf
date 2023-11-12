
// input SHGT_removeGPSfromVehicles

{
[_x, "init", {
    params ["_vehicle"];

    {
        _vehicle enableInfoPanelComponent ["left", _x, false];
        _vehicle enableInfoPanelComponent ["right", _x, false];
    } forEach [
        "CrewDisplay",
        "MinimapDisplay",
        "MissileDisplay",
        "SensorsDisplay",
        "SlingLoadDisplay",
        "UAVFeedDisplay",
        "VehicleCommanderDisplay",
        "VehicleDriverDisplay",
        "VehicleGunnerDisplay"
    ];
}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach SHGT_removeGPSfromVehicles;