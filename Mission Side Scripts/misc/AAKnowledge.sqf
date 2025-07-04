
_AAClasses = ["StaticAAWeapon"];

{
	[_x, "init", {
		(_this select 0) addAction ["Check Supply", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_supply = _target getVariable ["supplyCount",0];
			systemChat format ["Contains %1 Supply",_supply]
		},[],6,true,true,"","true",10];
	}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach _AAClasses;





/*
aa1 reveal [eheli,1];
hint format ['knows=%1',aa1 knowsAbout eheli]
aa1 forgetTarget eheli


[] spawn {while {alive eheli} do {hint format ['knows=%1',aa1 knowsAbout eheli]; sleep 1}}
{player reveal _x} forEach allUnits;
{_x reveal eheli} forEach (groups west);