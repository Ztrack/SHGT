// Import
params ["_objListCost"];
objclassName = _objListCost select 0;
supplyCost = _objListCost select 1;
objCategory = _objListCost select 2;

// if conditions
//if ((objclassName isEqualTo SHGT_persist_FobObjectName) and (count ((getPosATL player) nearObjects [SHGT_persist_FobObjectName, SHGT_persist_radiusToSaveFob]) >0)) exitWith {systemChat "Too close to existing FOB"};
//if ((objclassName isEqualTo SHGT_persist_FobObjectName) and (count ((getPosATL player) nearObjects [SHGT_persist_HqObjectName, SHGT_persist_radiusToSaveHq]) >0)) exitWith {systemChat "Too close to existing HQ"};
//if ((objclassName isEqualTo SHGT_persist_HqObjectName) and (count ((getPosATL player) nearObjects [SHGT_persist_HqObjectName, SHGT_persist_radiusToSaveHq]) >0)) exitWith {systemChat "Too close to existing HQ"};
//if ((objclassName isEqualTo SHGT_persist_HqObjectName) and (count ((getPosATL player) nearObjects [SHGT_persist_FobObjectName, SHGT_persist_radiusToSaveFob]) >0)) exitWith {systemChat "Too close to existing HQ"};
if ((objclassName isEqualTo SHGT_persist_HqObjectName) and !(((call BIS_fnc_admin) isEqualTo 2) or (player getVariable [SHGT_persist_adminTag,false]))) exitWith {systemChat "Only admins can build HQ"};

// Determine if nearby supply exists (or sandbags)
_nearbySupplyPoints = nearestObjects [getPosATL player, SHGT_logistics_cargoCapable,SHGT_logistics_supplySearchRadius];
canAfford = false; // initialize
isPersonal = false;
containerSource = [];
supplyCount = [];
{
    supplyCount = _x getVariable ["supplyCount",0];
    if ((supplyCount-supplyCost)>0) exitWith {
        canAfford = true;
        containerSource = _x;
        _x setVariable ["supplyCount",(supplyCount-supplyCost),true];
    };
} forEach _nearbySupplyPoints;

if !(canAfford) then {
    private _cnt = { _x isEqualTo "ACE_Sandbag_empty" } count (items player);
    if (_cnt >= supplyCost) then {
        canAfford = true;
        isPersonal = true;
        for "_i" from 1 to supplyCost do {
            player removeItem "ACE_Sandbag_empty";
        };
    };

};
if !(canAfford) exitWith {systemChat "Not enough container or personal supply!"};
if (!(supplyCost isEqualTo 0) and (isPersonal isEqualTo false)) then {systemChat "Used supply for building";};
if (!(supplyCost isEqualTo 0) and (isPersonal isEqualTo true)) then {systemChat "Used sandbags";};

// Create Vehicle 
vehPlace = objclassName createVehicle [0,0,0];
vehPlace enableSimulationGlobal FALSE;
{vehPlace disableCollisionWith _x;} forEach AllPlayers;

// Clear cargo
clearItemCargoGlobal vehPlace;
clearMagazineCargoGlobal vehPlace;
clearWeaponCargoGlobal vehPlace;
clearBackpackCargoGlobal vehPlace;

// settings
stepSize = .1;
rotSize = 5;
dirZ = 0;
rot = getDir player;
snap = true;
dirForward = 5;

// Begin placing object
player setVariable ["placing",true];
cancelled = false;
_Pos = player getRelPos [5, 0];
vehPlace setposATL [(_Pos select 0),(_Pos select 1),(_Pos select 2)];
vehPlace setDir rot;

// Up/down
// https://community.bistudio.com/wiki/DIK_KeyCodes
_keyUp = [200, [true, false, false], {dirZ = dirZ+stepSize}] call CBA_fnc_addKeyHandler;
_keyDown = [208, [true, false, false], {dirZ = dirZ-stepSize}] call CBA_fnc_addKeyHandler;

// Forward / Backward
_keyForward = [200, [false, false, false], {dirForward = dirForward+stepSize}] call CBA_fnc_addKeyHandler;
_keyBackward = [208, [false, false, false], {dirForward = dirForward-stepSize}] call CBA_fnc_addKeyHandler;

// Rotate left/right
_keyleft = [203, [false, false, false], {rot = rot-rotSize; vehPlace setDir rot;}] call CBA_fnc_addKeyHandler;
_keyRight = [205, [false, false, false], {rot = rot+rotSize; vehPlace setDir rot;}] call CBA_fnc_addKeyHandler;

// snap to ground. on by default
_keySnap = [207, [false, false, false], {if (snap isEqualTo true) exitWith {snap=false}; if (snap isEqualTo false) exitWith {snap=true};}] call CBA_fnc_addKeyHandler;

// confirm/Cancel
_keyConfirm = [28, [false, false, false], {player setVariable ["placing",false];}] call CBA_fnc_addKeyHandler;
_keyCancel = [46, [false, false, false], {player setVariable ["placing",false]; cancelled = true;}] call CBA_fnc_addKeyHandler;

SHGT_placementKeys = [_keyUp,_keyDown,_keyForward,_keyBackward,_keyleft,_keyRight,_keySnap,_keyConfirm,_keyCancel];

_handle = [{
    // Conditionals
    if (lifeState player isEqualTo "INCAPACITATED") then {player setVariable ["placing",false]; cancelled = true;};
    if (vehicle player != player) exitWith {systemChat "You think you're a smartass dont you? You cannot build from a vehicle"; player setVariable ["placing",false]; cancelled = true;};
    if (dirForward > 10) then {dirForward = 10; systemChat "Can't build any further!"};
    if (dirZ > 10) then {dirZ = 10; systemChat "Can't build any higher!"};

    // Player states
    player forceWalk TRUE;
    //player action ["SwitchWeapon", player, player, 100]; // RUNNING THIS CAUSES ANNOYING SOUND
    player action ["SWITCHWEAPON", player, player, -1];

    // Move Item
    _Pos = player getRelPos [dirForward, 0];
    vehPlace setposATL [(_Pos select 0),(_Pos select 1),(_Pos select 2)+dirZ];
    
    if (snap) then {
        vehPlace setVectorUp surfaceNormal position vehPlace; // Align object with the terrain underneath
    };
    
    // Send hint
    _structuredText = composeText [text "You are currently building", linebreak, lineBreak, text "LEFT/RIGHT: Rotate",lineBreak, text "UP/DOWN: Move closer/further",lineBreak, text "SHIFT + UP/DOWN: Move up/down",lineBreak, text "END: Toggle snap to ground",lineBreak, text "ENTER: Confirm",lineBreak, text "C: Cancel"];
    hintSilent _structuredText;

    // End event handler and start building
    if !(player getVariable ["placing",true]) then {
        hintSilent ""; // close hint
        [(_Pos select 0),(_Pos select 1),(_Pos select 2)+dirZ] remoteExec ["setPosATL", 0];
        vehPlace setDamage 0;
    
        // remove key handlers
        {_x call CBA_fnc_removeKeyHandler;} forEach SHGT_placementKeys;

        // Call build function 
        [] call SHGT_fnc_logistics_buildObject;

        [_this select 1] call CBA_fnc_removePerFrameHandler; // end handler
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;

