
SHGT_locations = [];
_anchors = allMissionObjects "Land_RedWhitePole_F";
{
	_arr = _x getVariable ["mapLocations",[]];
	if (_arr isEqualTo []) then {continue};
	_name = _arr select 0;
	_pos = _arr select 1;
	_type = _arr select 2;
	SHGT_locations pushBack [_name,_pos,_type];
	deleteVehicle _x;
} forEach _anchors;
publicVariable "SHGT_locations";


[[],{
// RUN FOR PLAYERS - LOCAL COMMANDS

// Delete original map markers
if (SHGT_deleteTownMarkers isEqualTo true) then {
_locationTypes = ["Name","NameCity","NameCityCapital","NameVillage","NameLocal","Airport","Strategic"];
_locations = nearestLocations [[worldSize/2,worldSize/2,0], _locationTypes, worldSize*2];
{
    if !(_x getVariable ["custom",false]) then {
        _editableLocation = createLocation [_x];
        _editableLocation setType "Invisible";
    };
} forEach _locations;
};

// Add new map markers
{
	_name = _x select 0;
	_pos = _x select 1;
	_type = _x select 2;

	_location = createLocation [_type,_pos, 100, 100]; 
	_location setText _name;
	_location setVariable ["custom",true];

} forEach SHGT_locations;

}] remoteExec ["call",0,true];


/*
Add this code to red white poles to add locations:
_name = "Fam Mogla";
_pos = getPosATL this;  
_type = "NameCity";  
this setVariable ["mapLocations",[_name,_pos,_type]];