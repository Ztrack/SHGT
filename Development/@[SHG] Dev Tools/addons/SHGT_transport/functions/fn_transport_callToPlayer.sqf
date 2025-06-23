// this function will allow players to recall the helo to their location assuming requirements are met

[SHGT_transport_recallInteractObject, "init", {

// Add interaction to object so it recalls helo
_interactObject = (_this select 0);
_interactObject addAction ["<t color='#FF0000'>Radio Heli</t>",    
    { 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_loc = getPosATL _target;
		_helo = SHGT_transport_activeHelo select 0;
		if (_helo isEqualTo []) exitWith {systemChat "No available transports"};

		_destination = _helo getVariable ["SHGT_transport_destination",[]];
		_hasDestination = !(_destination isEqualTo []); // if destination is blank, helo is free

		//systemChat "Pilot: Order received, Oscar Mike";
		[[_helo,_loc,false,_target],SHGT_fnc_transport_flightOrder] remoteExec ["spawn", _helo];
	},    
    [],    
    8,    
    false,    
    true,    
    "",    
    ""   
];






}, true, [], true] call CBA_fnc_addClassEventHandler;













