



// add push up on mats
["Land_Ground_sheet_F", "init", {
		(_this select 0) addAction ["Do push-ups", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			player action ["SwitchWeapon", player, player, 100];
			player playMoveNow "AmovPercMstpSnonWnonDnon_exercisePushup";
		},[],6,false,true,"","true",10];
		(_this select 0) addAction ["Do Kata", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			player action ["SwitchWeapon", player, player, 100];
			player playMoveNow "AmovPercMstpSnonWnonDnon_exerciseKata";
		},[],6,false,true,"","true",10];
		(_this select 0) addAction ["Do Squat 1", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			player action ["SwitchWeapon", player, player, 100];
			player playMoveNow "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		},[],6,false,true,"","true",10];
		(_this select 0) addAction ["Do Squats 2", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			player action ["SwitchWeapon", player, player, 100];
			player playMoveNow "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		},[],6,false,true,"","true",10];


}, true, [], true] call CBA_fnc_addClassEventHandler;