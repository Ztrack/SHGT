if !(isServer) exitWith {};

["MFR_Dog_Base", "init", {
	private  _unit = (_this select 0);

	// disable Lambs AI
	_unit setVariable ["lambs_danger_disableAI",true]; 
	_unit setVariable ["ace_medical_damageThreshold",1000,true]; 

	// Handler for detecting IEDs
	_handle = [{
		params ["_unit"];
		private  _unit = _unit select 0;
		private  _list = nearestObjects [_unit, ["MineGeneric","MineBase","TimeBombCore","PipeBombCore","PipeBombBase"], 30];
		private _barking = (_unit getVariable ["dog_barking",false]);
		private _inVehicle = !(isNull (objectParent _unit)); // will return true if in a vehicle
		private _isNotattached = (isNull attachedTo _unit);
		if (!(_list isEqualTo []) and !(_barking) and !(_inVehicle) and _isNotattached) then {
			// An IED exists and dog will bark
			[_unit, ["dog_barking",30]] remoteExec ["say3D",0];
			_unit setVariable ["dog_barking",true,true];
			[{params ["_unit"]; _unit setVariable ["dog_barking",false,true];}, [_unit], 20] call CBA_fnc_waitAndExecute;
		};

	}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;

	// Add get in event handler so dog doesnt enter drivers seat
	_unit addEventHandler ["GetInMan", {
		if !isServer exitWIth {}; // not sure if needed, but its global so..
		params ["_unit", "_role", "_vehicle", "_turret"];
		if (_role in ["driver","gunner"]) then {
			_unit moveOut _vehicle;
			//systemChat "doggo moved out";

			if ((_vehicle emptyPositions "Cargo") >0) then {
				[{params ["_unit","_vehicle"]; _unit moveinCargo _vehicle;}, [_unit,_vehicle], 1] call CBA_fnc_waitAndExecute;
			};
		};
	}];

	// Start RemoteExec
	if (_unit getVariable ["SHGT_dogNoActions",false] isEqualTo true) exitWith {}; // use this setVariable ["SHGT_dogNoActions",true]; so dog cant be interacted with
	SHGT_dogRemoteActions = {
	params ["_unit"];
	// Add head pat
	private _action = ["Headpat","Head pat","",{_target say3d "singlebark";},{true},{},[],[0,0,0],2,[false, true, false, false, false],{}] call ace_interact_menu_fnc_createAction;
	[_unit, 0, ["ACE_Head"], _action] call ace_interact_menu_fnc_addActionToObject;

	// add interaction to move/attach dog to player
	private _action = ["PickUpDog","Pick up dog","",
	{_target attachTo [player, [0,1,0]]},{true},{},[],[0,0,0],2,[false, true, false, false, false],{}] call ace_interact_menu_fnc_createAction;
	[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	// add interaction to unattach dog
	private _action = ["Dropdog","Drop dog","",{detach _target},{true},{},[],[0,0,0],2,[false, true, false, false, false],{}] call ace_interact_menu_fnc_createAction;
	[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	// add interaction to make dog get in vehicle
	private _action = ["LoadInDog","Load dog into vehicle","",{private _vehlist = nearestObjects [_target, ["car","Air"], 20]; _target moveinCargo (_vehlist select 0)},{true},{},[],[0,0,0],2,[false, true, false, false, false],{}] call ace_interact_menu_fnc_createAction;
	[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

	// add interaction to reset dog
	private _action = ["ResetDog","Reset dog","",{
		private _type = typeOf _target;
		private _pos = getPosATL _target;
		deleteVehicle _target;
		(group player) createUnit [_type, _pos, [], 0, "NONE"]},{true},{},[],[0,0,0],2,[false, true, false, false, false],{}] call ace_interact_menu_fnc_createAction;
	[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	};

	[[_unit],SHGT_dogRemoteActions] remoteExec ["call", 0, true];


}, true, [], true] call CBA_fnc_addClassEventHandler;

/*
private _action = ["playerconnectToUav","Access fire control systems","",
	{
		//player addItem "B_UAVTerminal";  player assignItem "B_UAVTerminal";
		{player enableUAVConnectability [_x,true];} forEach [tomahawk1,hammer1,hammer2];
		{Player connectTerminalToUAV tomahawk1};
	},{"B_UAVTerminal" in (items _player)},{},[],[0,0,0],2,[false, true, false, false, false],{}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;


/*
["MFR_Dog_Base", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;