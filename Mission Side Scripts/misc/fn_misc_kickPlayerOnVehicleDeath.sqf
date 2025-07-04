// This function will kick a player from a vehicle when they die

player addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
    private _veh = vehicle player;
    if ((_veh != player) and !(_veh isKindOf "Air")) then {
        // Player is in a vehicle
        [player] call ace_common_fnc_unloadPerson;
    };
}];