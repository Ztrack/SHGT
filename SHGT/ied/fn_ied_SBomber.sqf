// This function will turn a unit into an S bomber that will search for players, explode, and play allahu akbar when close to player
//[_this] call SHGT_fnc_ied_SBomber;

params ["_unit"];
//if (isNull _obj) then {private _grp = createGroup sideLogic; _obj = _grp createUnit ["UK3CB_TKC_O_CIV", [_pos select 0, _pos select 1,0], [], 10, "NONE"];};
if (isNull _unit) exitWith {'No unit given'};

removeVest _unit;
_unit addVest "V_TacVest_blk";
_unit addItem "ACE_DeadManSwitch";
//_unit addItem "IED_UrbanBig_Remote_Mag";
_bmbJkt = true;
_unit allowFleeing 0;
_unit setCombatMode "GREEN";
_unit setBehaviour "CARELESS";
_unit setVariable ["lambs_danger_disableAI",true];
_bmbNo1 = [];
_bmbNo2 = [];
_bmbNo3 = [];
if (_bmbJkt) then {
    //_bmbNo1="DemoCharge_F" createVehicle position (_unit);
	_bmbNo1= createMine ["DemoCharge_F",getPosATL _unit, [], 3];
    _bmbNo1 attachTo [(_unit),[0,0.15,0.15],"Pelvis"]; 
    _bmbNo1 setVectorDirAndUp [[1,0,0],[0,1,0]];

    _bmbNo2="DemoCharge_F" createVehicle position (_unit);
	//_bmbNo2= createMine ["DemoCharge_F",getPosATL _unit, [], 3];
    _bmbNo2 attachTo [(_unit),[-0.1,0.1,0.15],"Pelvis"];  
    _bmbNo2 setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];

	_bmbNo3="DemoCharge_F" createVehicle position (_unit);
	//_bmbNo3= createMine ["DemoCharge_F",getPosATL _unit, [], 3];
    _bmbNo3 attachTo [(_unit),[0.1,0.1,0.15],"Pelvis"];  
    _bmbNo3 setVectorDirAndUp [[0.5,-0.5,0],[0.5,0.5,0]];
};

_yelled = false;
while {true} do {
    scopeName "suicideControl";
    
    sleep 1;
    if (lifestate _unit in ["DEAD","INCAPACITATED"]) then {
		//_bmbShl=createVehicle["Sh_82mm_AMOS",position _unit,[],0,"CAN_COLLIDE"];
		//_bmbShl setvelocity [0,0,-30];
		//_ied = createMine ["DemoCharge_F",getPosATL _unit, [], 3];
		//sleep 5;
		deleteVehicle _bmbNo2;
		deleteVehicle _bmbNo3;
		_bmbNo1 setDamage 1;
		//deleteVehicle _bmbNo1;
		//deleteVehicle _bmbShl;
        breakOut "suicideControl";
    };
    
	_target = [];
    {
		if ((_unit distance _x <200) and !(vehicle _x isKindOf "Air")) then {
			if (_target isEqualTo []) then {
				// no current target exists
				_target = _x;
			} else {
				if (_unit distance _target > (_unit distance _x)) then {_target = _x;}; // replace existing target
			};
        };
    } forEach allPlayers;
	
	if !(_target isEqualTo []) then {
		_unit doMove position _target;
		if ((_unit distance _target < 25) and !(_yelled)) then {[_unit, ['SHGT_SBAbrupt',100]] remoteExec ["say3D",0]; _yelled = true;};
		if (_unit distance _target < 12.5) then {
			
			//sleep 1;
			deleteVehicle _bmbNo2;
			deleteVehicle _bmbNo3;
			_unit setDamage 1;
			_bmbNo1 setDamage 1;
			//_bmbShl=createVehicle["Sh_82mm_AMOS",position _unit,[],0,"CAN_COLLIDE"];
			//_bmbShl setvelocity [0,0,-30];
			//sleep 5;
			//deleteVehicle _bmbShl;
		};
	};
	
	if (not local _unit) then {
		deleteVehicle _bmbNo1;
		deleteVehicle _bmbNo2;
		deleteVehicle _bmbNo3;
		[[_unit],SHGT_fnc_ied_SBomber] remoteExec ["spawn",_unit];
		breakOut "suicideControl";
	};
};
