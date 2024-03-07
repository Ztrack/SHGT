// IEDS should spawn over time in towns dependent on the town reputation
// Should not spawn ieds if players are close & if no players are in the area
_maxIEDsDensity = 10; // Max density of IEDs per 100x100 meter area
_maxIEDsPerArea = 100; // Max ieds per large AO area
_SafeplayerProximity = 1000; // Check players are far enough before spawning a new IED
_IEDsUpdate = 60; // Time in minutes before a 'tick' is made to spawn more IEDs
_IEDSpawnRate = 1; // How many IEDs spawn per town area per tick.
_IEDSpawnChance = 100; // Chance an IED will spawn this tick. Is run per IED defined in IEDSpawnRate
_highRepThreshold = 80; // At this reputation no more IEDS will spawn. Linear relationship between 0 and this number to determine max density and #
_houses = ["Land_i_House_Big_01_V1_F","Land_i_House_Big_02_V3_F","Land_i_Shop_01_V2_F","Land_u_House_Big_02_V1_F"];
//SHGT_ied_iedList = ["ACE_IEDLandBig_Range","ACE_IEDUrbanBig_Range","ACE_IEDUrbanSmall_Range","ACE_IEDLandSmall_Range"];
// step 1: Build code to spawn IED at a random position on a road within the AO/town marker. Then offset it randomly. Maybe use getroadinfo to see width
// instead of trying to build a marker array (many many markers), which could be performance heavy...
// Could use nearestObjects to check for nearby IEDs if i want to create a minimum spawn distance






//Experimental code creating markers in relevant areas
SHGT_civInteract_TOARIEDGrids = createHashMap;
_mapSize = worldSize;
{
_thisTownMarker = _x;
_orgColor = getMarkerColor _thisTownMarker;
_mSize = markerSize _thisTownMarker;
_mCenter = markerPos _thisTownMarker;
_mTL = [(_mCenter select 0)-(_mSize select 0)*2,(_mCenter select 1)+(_mSize select 1)*2];
_mBR = [(_mCenter select 0)+(_mSize select 0)*2,(_mCenter select 1)-(_mSize select 1)*2];
_mTL = [(floor ((_mTL select 0)/100)),(floor ((_mTL select 1)/100))];
_mBR = [(floor ((_mBR select 0)/100)),(floor ((_mBR select 1)/100))];
_forParamsx = [];
_forParamsy = [];
if (_mTL select 0 < _mBR select 0) then {_forParamsx = [_mTL select 0,_mBR select 0]} else {_forParamsx = [_mBR select 0,_mTL select 0]};
if (_mTL select 1 < _mBR select 1) then {_forParamsy = [_mTL select 1,_mBR select 1]} else {_forParamsy = [_mBR select 1,_mTL select 1]};

_subMarkerNum = 1;
_markerList = [];
for "_i" from (_forParamsy select 0) to (_forParamsy select 1) do {
	_yPos = _i*100+50;
	for "_ii" from (_forParamsx select 0) to (_forParamsx select 1) do {
		_xPos = _ii*100+50;
		if ([_xPos,_yPos] inArea _thisTownMarker) then {
			_bld = nearestBuilding [_xPos,_yPos];
			_roads = [_xPos,_yPos] nearRoads 50;
			if ((_bld inArea [[_xPos,_yPos],50,50,0,true]) or !(_roads isEqualTo [])) then {
				_markerName = format ["%1subArea%2",_thisTownMarker,_subMarkerNum];
				_marker = createMarker [_markerName, [_xPos,_yPos]];
				_marker setMarkerShape "RECTANGLE";
				_marker setMarkerSize [50, 50];
				_markerList pushBack _marker;
				if (SHGT_civInteraction_debug isEqualTo true) then {
					_x setMarkerColor "ColorRed";
					_x setmarkerAlpha 0.5;
				} else {
					_x setmarkerAlpha 0;
				};
				_subMarkerNum = _subMarkerNum +1;
			};
		};
	};
};

_thisTownMarker setMarkerColor _orgColor;
SHGT_civInteract_TOARIEDGrids set [_x,_markerList];

} forEach SHGT_civInteract_TOAR;








/*
1. Figure out all the areas (inArea command?) that can spawn ieds. Should have a road or house in the square. Build square markers?
2. Use a time-loop to check 