if !(hasInterface) exitWith {};

params ["_helo"];
_helo addAction ["<t color='#FF0000'>Designate LZ</t>",    
	{ 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_helo = _arguments select 0;
		//systemChat "Pilot: Order received, beginning transport";
		//[[_helo,_thisPad],SHGT_fnc_flightorder] remoteExec ["spawn", 0];
		[_helo] call SHGT_fnc_transport_guiSelectTransportLocation;
	},    
	[_helo],
	8,
	false,    
	true,    
	"",    
	""   
];