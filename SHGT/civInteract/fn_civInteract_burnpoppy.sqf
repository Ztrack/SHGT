[
    poppyField,                                                        
    "Burn Poppy Field",                                                    
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",    
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",    
    "_this distance _target < 15",                                    
    "_caller distance _target < 15",                                    
    {},                                                        
    {},                                                                
    {params ["_target", "_caller", "_actionId", "_arguments"];
    _source = "#particlesource" createVehicle position _target;
    _helper = "test_EmptyObjectForFireBig" createVehicle position _target;
    _source setParticleClass "ObjectDestructionFire1Smallx";
    _source attachTo [_target,[0,0,0]];
    _helper attachTo [_target,[0,5,0]];
    _source setParticleFire [0.5,1.5,0.5];
    sleep 120; 
    deleteVehicle _source;
    deleteVehicle _helper;
    deleteVehicle _target;
    },                                                                
    {},                                                                
    [],                                                                
    10,                                                                
    0,                                                                
    true,                                                            
    false                                                            
] call BIS_fnc_holdActionAdd;