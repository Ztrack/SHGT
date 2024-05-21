// If action was cancelled, refund player
if (cancelled) then {
    deletevehicle vehPlace;
    if (!(supplyCost isEqualTo 0) and (isPersonal isEqualTo false)) then {
         supplyCount = containerSource getVariable ["supplyCount",0]; // get current supply
         containerSource setVariable ["supplyCount",(supplyCount + supplyCost),true]; // refund
          systemChat "Cancelled build, refunded Supply";
      };
      if (isPersonal isEqualTo true) then {
        for "_i" from 1 to supplyCost do {
            player addItem "ACE_Sandbag_empty";
        };
           systemChat "Cancelled build, refunded sandbags";
     };
    player forceWalk FALSE;
    player enableSimulation true;
    player setVariable ["placing",false]; // make sure its false
	player setVariable ["building",false]; // make sure its false
	player setAnimSpeedCoef 1;
	hintSilent "";
};

// This object is not a personal object.
if (!isPersonal and !cancelled) then {
	[] execVM "SHGT\logistics\fn_logistics_holdPlayer.sqf";
	player forceWalk FALSE;
    player enableSimulation true;
	vehPlace enableSimulationGlobal TRUE; // enable obj simulation
	{vehPlace enableCollisionWith _x;} forEach AllPlayers; // enable collision
	player setVariable ["placing",false]; // make sure its false
    player setVariable ["building",false]; // make sure its false
	player setAnimSpeedCoef 1;
	systemChat "Item Built!";
	hintSilent "";
	if ((objCategory isEqualTo "CREATION")) then {[] call SHGT_fnc_logistics_CreateBase;};
};

// its a personal item
if (isPersonal and !cancelled) then {
	//player enableSimulation false;
	vehPlace enableSimulationGlobal TRUE; // enable obj simulation
	{vehPlace enableCollisionWith _x;} forEach AllPlayers;
	_keyCancel = [46, [false, false, false], {cancelled = true;}] call CBA_fnc_addKeyHandler; // Add cancel keybind
	buildProgressRequired = supplyCost*SHGT_logistics_buildTimeMultiplier; if (buildProgressRequired<1) then {buildProgressRequired =1};
	vehPlace setVariable ["buildProgressRequired",buildProgressRequired,true]; // set how much progress is required
	vehPlace setVariable ["builder",player,true]; // set player as primary builder
	player setVariable ["building",true]; // reset placing to be true
	vehPlace setVariable ["buildProgress",0,true];
	[] execVM "SHGT\logistics\fn_logistics_holdPlayer.sqf";

	// add per frame handler
	_handle = [{
		if (lifeState player isEqualTo "INCAPACITATED") then {player setVariable ["building",false]; cancelled = true;};
		buildProgress = (vehPlace getVariable ["buildProgress",0])+1;
        vehPlace setVariable ["buildProgress",buildProgress, true];
		_structuredText =  composeText [format ["Progress: %1 percent",((buildProgress)/buildProgressRequired)*100], linebreak, lineBreak,"Press C to cancel"];
		hintSilent _structuredText;

		// If condition is met, item is built and player state is returned
		if ((vehPlace getVariable ["buildProgress",0]) >= buildProgressRequired) then {
			player forceWalk FALSE;
    		player enableSimulation true;
			vehPlace enableSimulationGlobal TRUE; // enable obj simulation
			{vehPlace enableCollisionWith _x;} forEach AllPlayers; // enable collision
			player setVariable ["placing",false]; // make sure its false
    		player setVariable ["building",false]; // make sure its false
			systemChat "Item Built!";
			hintSilent "";
			[vehPlace,vehPlace getVariable ["_SHGTactionID",0]] remoteExec ["removeAction",2];
			_keyCancel call CBA_fnc_removeKeyHandler;
			if ((objCategory isEqualTo "CREATION")) then {[] call SHGT_fnc_logistics_CreateBase;}; // create base
			[_this select 1] call CBA_fnc_removePerFrameHandler; // end handler
		};

		// If cancelled, then object is deleted and player state returned
		if (cancelled) then {
    		deletevehicle vehPlace;
    		if (!(supplyCost isEqualTo 0) and (isPersonal isEqualTo false)) then {
         		supplyCount = containerSource getVariable ["supplyCount",0]; // get current supply
         		containerSource setVariable ["supplyCount",(supplyCount + supplyCost),true]; // refund
				systemChat "Cancelled build, refunded Supply";
			};
			if (isPersonal isEqualTo true) then {
        		for "_i" from 1 to supplyCost do {
            		player addItem "ACE_Sandbag_empty";
        		};
				systemChat "Cancelled build, refunded sandbags";
     		};
    		player forceWalk FALSE;
    		player enableSimulation true;
    		player setVariable ["placing",false]; // make sure its false
			player setVariable ["building",false]; // make sure its false
			[vehPlace,vehPlace getVariable ["_SHGTactionID",0]] remoteExec ["removeAction",2];
			_keyCancel call CBA_fnc_removeKeyHandler;
			hintSilent "";
			[_this select 1] call CBA_fnc_removePerFrameHandler; // end handler
		};

	}, 1, [_keyCancel]] call CBA_fnc_addPerFrameHandler; // close per frame handler
    
	
	[[vehPlace],SHGT_fnc_logistics_assistBuildingAction] remoteExec ["call",2];

    
};

if (vehPlace isKindOf "StaticWeapon") then {vehPlace setVehicleAmmo 0;}; // remove ammo from turrets
if (vehPlace isKindOf "house") then {vehPlace allowDamage false}; // remove ammo from turrets
