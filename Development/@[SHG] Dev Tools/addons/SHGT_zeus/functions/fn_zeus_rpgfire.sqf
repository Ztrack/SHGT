_FuncFireRPG = {
	params ["_pos", "_unit"];
	// systemChat str _pos;
	// systemChat str _obj;
// zen_dialog_fnc_create;
// zen_common_fnc_selectposition;
// zen_ai_fnc_suppressivefire;



[
    "RPG Shooty", 
    [
        // Content Controls
        [
        "COMBO",
        "FireMode",
        [
            [],
            [
                "1-Shot",
                "FUCKING SEND IT"
            ],
            0
        ]
    ]
    ],
    {
        // On confirm
        params ["_values", "_unit"];
        _values params ["_fireMode"];
        [[], {
            //systemChat str _this;
            params ["_successful", "_units", "_position", "_args"];
            _unit = ((_args select 0) select 0);
            _fireMode = _args select 1;
            curatorMouseOver params ["_type", "_entity"];
            private _target = [ASLtoATL _position, _entity] select (_type == "OBJECT");
            if ((typeName _target) isEqualTo "OBJECT") then {
                _unit reveal [_target, 4];
                _unit doTarget _target;
                _unit doFire _target;
                if (_fireMode isEqualTo 0) then {
                    _unit setVariable ["SHGT_rpgFireTarget",_target];
                    _unit addEventHandler ["FiredMan", {
	                    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
                        if !(isServer) exitWith {};
                        //systemChat "ding EH";
                        _target = _unit getVariable ["SHGT_rpgFireTarget",objNull];
                        _unit reveal [_target, 0];
                        _unit doTarget objNull;
                        _unit doWatch objNull;
                        //_unit doFire objNull;
                        _unit ignoreTarget [_target,true];
                        _unit ignoreTarget [_target,false];
                        _unit selectWeapon (primaryWeapon _unit);
                        _unit removeEventHandler [_thisEvent, _thisEventHandler];
                    }];
                };
            } else {
                systemChat "No Obj Selected";
            };
        }, [_unit,_fireMode], "Erase this fucker"] call zen_common_fnc_selectPosition
    },
    {
        // On cancel  
    },
    [_unit]] call zen_dialog_fnc_create;























};

["SHGT", "Fire RPG", _FuncFireRPG] call zen_custom_modules_fnc_register;