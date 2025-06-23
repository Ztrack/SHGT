
{
	[_x, "init", {
		(_this select 0) addAction ["Check Supply", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_supply = _target getVariable ["supplyCount",0];
			systemChat format ["Contains %1 Supply",_supply]
		},[],6,true,true,"","true",10];
	}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach SHGT_logistics_cargoCapable;

[SHGT_logistics_supplySource, "init", {
		(_this select 0) addAction ["Fill nearby supply boxes", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_pos = (getPosATL _target);
			{
				_list = _pos nearObjects [_x,50];
				{
					_x setVariable ["supplyCount",SHGT_logistics_supplyMax,true];
				} forEach _list;

			} forEach SHGT_logistics_cargoCapable;


			systemChat "Nearby Containers filled"
		},[],6,false,true,"","true",10];

		// Add actions for pulling an empty general box
		(_this select 0) addAction ["Pull out empty general box", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_veh = createVehicle ["Land_Boxloader_Crate_1",position player,[],0,"NONE"];
			_veh setDamage 0;
			clearItemCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;
			clearWeaponCargoGlobal _veh;
			clearBackpackCargoGlobal _veh;
		},[],6,false,true,"","true",10];

		// Add actions for pulling an empty weapons box
		(_this select 0) addAction ["Pull out empty weapons box", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_veh = createVehicle ["Box_NATO_Ammo_F",position player,[],0,"NONE"];
			_veh setDamage 0;
			clearItemCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;
			clearWeaponCargoGlobal _veh;
			clearBackpackCargoGlobal _veh;
		},[],6,false,true,"","true",10];

		// Add actions for pulling an empty medical box
		(_this select 0) addAction ["Pull out empty medical box", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_veh = createVehicle ["ACE_medicalSupplyCrate_advanced",position player,[],0,"NONE"];
			_veh setDamage 0;
			clearItemCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;
			clearWeaponCargoGlobal _veh;
			clearBackpackCargoGlobal _veh;
		},[],6,false,true,"","true",10];


}, true, [], true] call CBA_fnc_addClassEventHandler;