// Add addactions to all spawned civs
if !(hasInterface) exitWith {};

["Civilian", "init",{

    _unit = (_this select 0);
    //[_unit] call SHGT_fnc_civInteract_intelIED;
    //[_unit] call SHGT_fnc_civInteract_intelEnemy;
    //[_unit] call SHGT_fnc_civInteract_giveHumrat;
    [_unit] call SHGT_fnc_civInteract_interActGUI;

},true,[],true] call CBA_fnc_addClassEventHandler;