/*

Refrence code here. Needs editing for variable use



 _houses = nearestObjects [This, ["house"], 500];  
{  
_x setVectorUp [0,0,1];  
//_x enableSimulation false;  
  
_boundingBox = boundingBox _x;  
_dir = getDir _x;  
_position = getPosATL _x;  
  
_size = _boundingBox select 1;  
_markername = "newbuildingmarker" + str (random 10000);  
  
createMarker [_markername, _position];  
_markername setMarkerShape "RECTANGLE";  
_markername setMarkerSize _size;  
_markername setMarkerBrush "SolidFull";  
_markername setMarkerColor "ColorGrey";  
_markername setMarkerDir _dir;   
  
} forEach _houses;