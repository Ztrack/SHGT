/*
call compile PreprocessFileLineNumbers "\x\SurvivableWrecks\addons\SurvivableWrecks\fn_survivableWrecks_ServerInit.sqf"
call compile PreprocessFileLineNumbers "\x\SurvivableWrecks\addons\SurvivableWrecks\fn_survivableWrecks_playerInit.sqf"
*/

SHGT_SW_VehTypes = [];
if (SHGT_SW_VehTypes_Heli isEqualTo true) then {SHGT_SW_VehTypes pushBack "Helicopter"};
if (SHGT_SW_VehTypes_Plane isEqualTo true) then {SHGT_SW_VehTypes pushBack "Plane"};
if (SHGT_SW_VehTypes_Ground isEqualTo true) then {SHGT_SW_VehTypes append ["Car","Tank"]};

{
	[_x, "init", {
		private _veh = (_this select 0); // Get vehicle object

		// Conditionals to have the EH
		if (typeOf _veh in SHGT_SW_VehTypes_ClassIgnore) exitWith {};
		if (!(SHGT_SW_VehTypes_Drone) and (_veh isKindOf "UAV")) exitWith {};

		_veh addEventHandler ["HandleDamage", {
			params ["_veh", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
			// This should run on whatever machine it is local to at the time of execution.

			// Conditionals
			if !((toLower _hitPoint) in ["hithull","hit_hull","hithrotor"]) exitWith {_damage};
			if ((SHGT_SW_ignore_grounded_vehicles) and (((getPosATL _veh) select 2) < 10)) exitWith {_damage};
			if (_veh getVariable ["SHGT_survivableWrecks_crashed",false]) exitWith {_damage};
			if ((SHGT_SW_ignore_AI_vehicles) and !(isPlayer (driver _Veh))) exitWith {_damage};
			private _health = _veh getHitPointDamage _hitPoint;
						
			if ((_health + _damage) > SHGT_SW_damageTreshold) then {

				// Step 1: Stop the vehicle from being destroyed (for now)
				_damage = 0;
				_veh allowdamage false;

				// step 2: play a sound effect to altert players
				[_veh, ["SHGT_craftwarning",200]] remoteExec ["say3D",0];
				
				// Step 3: Damage vehicle just enough so it goes down
				_veh setFuel 0;
				_veh setDamage .88;
				_veh setHitPointDamage ["HitHRotor",.88];
				_veh setHitPointDamage ["HitVRotor",.88];
				_veh setHitPointDamage ["HitEngine",.88];
				_fire = objNull;
				_fire = "test_EmptyObjectForFireBig" createVehicle (getposATL _veh);
				_fire attachTo[_veh,[0,0,.5]];
				_vehicle setVariable ["ace_vehicle_damage_allowCrewInImmobile", true, true];

				// Handle crew
				_allCrew = crew _veh;
				{
					if ((SHGT_SW_ignore_AI_Units) and !(isPlayer _x)) then {continue}; 
					if (SHGT_SW_unconscious) then {[_x, true] call ace_medical_fnc_setUnconscious};
					if (SHGT_SW_immune_damage) then {_x allowDamage false};
				} forEach _allCrew;

				// Step 4: Create a handler to wait for vehicle to crash, if it is a helicopter or plane
				[_veh,_fire,_allCrew] spawn {
					params ["_veh","_fire","_allCrew"];
					//waitUntil {sleep 1; ((getPosATL _veh) select 2) < 10}; isTouchingGround
					waitUntil {sleep 1; ((isTouchingGround _veh) and (speed _veh <1))};
					//systemChat "wait done";

					// Step 5: Run code on all players still inside vehicle at crash time
					{
						if ((SHGT_SW_ignore_AI_Units) and !(isPlayer _x)) then {continue};
						[[_x,_veh,_fire],SHGT_fnc_survivableWrecks_playerInit] remoteExec ["call",_x];
					} forEach crew _veh;

					// Step 6: Blow up vehicle
					sleep 30;
					deleteVehicle _fire;
					_veh allowdamage true;
					if (SHGT_SW_vehicle_destruction_enabled isEqualTo true) then {_veh setDamage 1;} else {_veh setVariable ["SHGT_survivableWrecks_crashed",false,true];};
					{_x allowDamage true} forEach _allCrew; // this line is insurance
				};

				// Last step: Stop handler from triggering again
				_veh setVariable ["SHGT_survivableWrecks_crashed",true,true];
			};

			// Return damage for handling
			_damage
		}]; // Close damage handler
	}, true, [], true] call CBA_fnc_addClassEventHandler; // Close init CBA handler
} forEach SHGT_SW_VehTypes;



// [[62],{params ["_a"]; systemChat str _a;}] remoteExec ["call",0]; remoteExec example