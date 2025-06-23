// INPUT 1: object
// INPUT 2: Array of arrays with [ItemCargo,MagazineCargo,WeaponCargo,BackpackCargo]. Each of which contains an array. Ex: ItemCargo = [["Item1","Item2"][item1count,Item2count]]
// INPUT 3: TRUE/FLASE - Should function check to see if cargo can fit before adding it? Default true
// Use example: [_obj,_contents,true] call SHGT_fnc_logistics_fillContainer;
params ["_obj","_contents","_checkCanFit"];

// set default
if ((isNil "_checkCanFit") or !(_checkCanFit in [true,false])) then {_checkCanFit=true};
_full = false;

// Add ItemCargo
private _items = (_contents select 0);
{ 
	private _thisItem = ((_items select 0) select _forEachIndex);
	private _thisItemCount = ((_items select 1) select _forEachIndex);
	if (!(_obj canAdd [_thisItem,_thisItemCount]) and _checkCanFit) then { _full = true; break };
	_obj addItemCargoGlobal [_thisItem,_thisItemCount];
} forEach (_items select 0); 

private _items = (_contents select 1);
{ 
	private _thisItem = ((_items select 0) select _forEachIndex);
	private _thisItemCount = ((_items select 1) select _forEachIndex);
	if (!(_obj canAdd [_thisItem,_thisItemCount]) and _checkCanFit) then { _full = true; break };
	_obj addMagazineCargoGlobal [_thisItem,_thisItemCount];
} forEach (_items select 0); 

private _items = (_contents select 2);
{ 
	private _thisItem = ((_items select 0) select _forEachIndex);
	private _thisItemCount = ((_items select 1) select _forEachIndex);
	if (!(_obj canAdd [_thisItem,_thisItemCount]) and _checkCanFit) then { _full = true; break };
	_obj addWeaponCargoGlobal [_thisItem,_thisItemCount];
} forEach (_items select 0); 

private _items = (_contents select 3);
{ 
	private _thisItem = ((_items select 0) select _forEachIndex);
	private _thisItemCount = ((_items select 1) select _forEachIndex);
	if (!(_obj canAdd [_thisItem,_thisItemCount]) and _checkCanFit) then { _full = true; break };
	_obj addBackpackCargoGlobal [_thisItem,_thisItemCount];
} forEach (_items select 0); 

_full