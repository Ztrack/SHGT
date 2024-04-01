// IEDS should spawn over time in towns dependent on the town reputation
// Should not spawn ieds if players are close & if no players are in the area
SHGT_civInteract_maxIEDsDensity = 2; // Max density of IEDs per 100x100 meter area
SHGT_civInteract_maxIEDsPerArea = 20; // Max ieds per large AO/town area
SHGT_civInteract_SafeplayerProximity = 1000; // Check players are far enough before spawning a new IED
SHGT_civInteract_IEDsUpdate = .25; // Time in minutes before a 'tick' is made to spawn more IEDs
SHGT_civInteract_IEDSpawnRate = 20; // How many IEDs spawn per town area per tick.
SHGT_civInteract_IEDSpawnRoadChance = 50; // Chance an IED will spawn on a road vs near a building
SHGT_civInteract_IEDminimumSpacing = 20; // minimum spacing between IED spawns
SHGT_civInteract_highRepThreshold = 80; // At this reputation no more IEDS will spawn. Linear relationship between 0 and this number to determine max density and #
SHGT_civInteraction_PauseIEDSpawningNearPlayers = false;
//SHGT_ied_iedList = ["ACE_IEDLandBig_Range","ACE_IEDUrbanBig_Range","ACE_IEDUrbanSmall_Range","ACE_IEDLandSmall_Range"];
// step 1: Build code to spawn IED at a random position on a road within the AO/town marker. Then offset it randomly. Maybe use getroadinfo to see width
// instead of trying to build a marker array (many many markers), which could be performance heavy...
// Could use nearestObjects to check for nearby IEDs if i want to create a minimum spawn distance

SHGT_civInteraction_RoadIEDList = [
'IEDLandBig_F',
'IEDUrbanBig_F',
'IEDLandSmall_F',
'IEDUrbanSmall_F',
'SHGT_jbad_tires',
'SHGT_jbad_opx2_tires'
];
SHGT_civInteraction_RoadIEDListAmmo = [];
{
	_ammo = ([getText(configFile >> "CfgVehicles" >> _x >> "ammo")] select 0);
	if (_ammo isEqualTo "") then {
		SHGT_civInteraction_RoadIEDListAmmo pushBackUnique _x;
		ace_minedetector_detectableClasses setVariable [_x,true]; // Set ACE object class to be detectable
	} else {
		SHGT_civInteraction_RoadIEDListAmmo pushBackUnique _ammo;
	};
} forEach SHGT_civInteraction_RoadIEDList;

SHGT_civInteraction_BuildingIEDList = [
'SHGT_jbad_bag',
'SHGT_IED_jbad_opx2_barrel_black',
'SHGT_jbad_opx2_barrel_blue',
'SHGT_jbad_opx2_barrel_green',
'SHGT_jbad_opx2_barrel_yellow',
'SHGT_Land_Canister_EP1',
'SHGT_jbad_opx2_garbagebags',
'SHGT_rhsusf_props_ScepterMWC_OD',
'SHGT_Land_Tyre_F',
'SHGT_Radio_Old',
'SHGT_Land_Reservoir_EP1',
'SHGT_Suitcase',
'SHGT_jbad_opx2_tires',
'SHGT_jbad_tires',
'SHGT_Land_BarrelTrash_F',
'SHGT_IED_LandSmall',
'SHGT_jbad_Tv_a',
'SHGT_Land_Tyre_F',
'SHGT_Land_Sack_EP1'
];
SHGT_civInteraction_BuildingIEDListAmmo = [];
{
	_ammo = ([getText(configFile >> "CfgVehicles" >> _x >> "ammo")] select 0);
	if (_ammo isEqualTo "") then {
		SHGT_civInteraction_BuildingIEDListAmmo pushBackUnique _x;
		ace_minedetector_detectableClasses setVariable [_x,true]; // Set ACE object class to be detectable
	} else {
		SHGT_civInteraction_BuildingIEDListAmmo pushBackUnique _ammo;
	};
} forEach SHGT_civInteraction_BuildingIEDList;

SHGT_civInteraction_IEDList = [];
SHGT_civInteraction_IEDList append SHGT_civInteraction_RoadIEDList;
SHGT_civInteraction_IEDList append SHGT_civInteraction_BuildingIEDList;
publicVariable "SHGT_civInteraction_IEDList";
// idea: use position of normal obj to get pos of ammo
// Find Ammo types 
SHGT_civInteraction_IEDListAmmo = [];
{
	_ammo = ([getText(configFile >> "CfgVehicles" >> _x >> "ammo")] select 0);
	if (_ammo isEqualTo "") then {
		SHGT_civInteraction_IEDListAmmo pushBackUnique _x;
		ace_minedetector_detectableClasses setVariable [_x,true]; // Set ACE object class to be detectable
	} else {
		SHGT_civInteraction_IEDListAmmo pushBackUnique _ammo;
	};
} forEach SHGT_civInteraction_IEDList;



//Creating markers to find areas that have roads & buildings
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
				_marker = createMarkerLocal [_markerName, [_xPos,_yPos]];
				_marker setMarkerShapeLocal "RECTANGLE";
				_marker setMarkerSizeLocal [50, 50];
				_marker setmarkerAlphaLocal 0;
				_markerList pushBack _marker;
				if (SHGT_civInteraction_debug isEqualTo true) then {
					_x setMarkerColorLocal "ColorRed";
					_x setmarkerAlpha 0.5;
				} else {
					_x setmarkerAlphaLocal 0;
				};
				_subMarkerNum = _subMarkerNum +1;
			};
		};
	};
};
_thisTownMarker setMarkerColorLocal _orgColor;
SHGT_civInteract_TOARIEDGrids set [_x,_markerList];
} forEach SHGT_civInteract_TOAR;


// Create a PFH to handle IED spawning over time
_handle = [{
	//private _FullIEDlist = nearestObjects [[], SHGT_ied_iedListAmmo, worldSize, true]; // might be better performance to only run this once?
	scopeName "main";
	
	{
		scopeName "loop1";
		// Step 1: Count # of IEDS currently present in this AO
		private _ao = _x;
		private _size = markerSize _ao;
		_size = (_size call BIS_fnc_greatestNum)*2;
		private _AOPos = markerPos _ao;
		private _list = nearestObjects [_AOPos, SHGT_civInteraction_IEDListAmmo, _size, true]; // ~1ms for 2000 radius
		_list = _list select {_x inArea _ao};
		private _IedCount = count _list;

		// Step 2: Are players currently in the AO? Then dont spawn IEDs this tick
		private _players = allPlayers - entities "HeadlessClient_F";
		_players = _players select {_x inArea _ao};
		if (!(_players isEqualTo []) and (SHGT_civInteraction_PauseIEDSpawningNearPlayers isEqualTo true)) then { continue };

		// Step 3: Determine if we should spawn an IED this tick (#allowed - #current > 0) otherwise continue to next AO
		private _rep = SHGT_areaReputation getOrDefault [_ao,0];
		if !((ceil (SHGT_civInteract_maxIEDsPerArea*(1- _rep/SHGT_civInteract_highRepThreshold))) - _IedCount >= 0) then { continue };

		// Step 4: Spawn IEDs in a random square, up to SHGT_civInteract_IEDSpawnRate
		private _markers = SHGT_civInteract_TOARIEDGrids getOrDefault [_ao,'not found'];
		if (_markers isEqualTo 'not found') then { continue };
		_markers = _markers call BIS_fnc_arrayShuffle; // Randomize marker order

		private _newIEDStorage = [];
		{
			scopeName "loop2";
			private _thisMarker = _x;
			private _newIED = [];
			private _newIEDPos = [];

			// if IED density is met, move on to next area
			private _list = nearestObjects [markerPos _thisMarker, SHGT_civInteraction_IEDListAmmo, 100, true]; // ~1ms for 2000 radius
			private _markerlist = _list select {_x inArea _thisMarker};
			if (SHGT_civInteract_maxIEDsDensity - (count _markerlist) <= 0) then { continue };

			for "_i" from 1 to 100 do {
				scopeName "loop3";
				// code will try to find an ied spot x times before moving on to the next marker area
				private _rndPos = [_thisMarker] call CBA_fnc_randPosArea; // get a random pos within the marker area
				private _type = [];
				if (SHGT_civInteract_IEDSpawnRoadChance >= (random 100+1)) then {
					// Spawn IED on a road
					private _rndRoad = _rndPos nearRoads 50; //get road nearest to this pos
					if (_rndRoad isEqualTo []) then { continue }; // no road was found, redo calc
					private _info = getRoadInfo (_rndRoad select 0);
					_info params ["_mapType", "_width", "_isPedestrian", "_texture", "_textureEnd", "_material", "_begPos", "_endPos", "_isBridge"];
					//private _roadDirection = _begPos getDir _endPos;
					_newIEDPos = (_rndRoad select 0) getRelPos [random _width, random 360];
					//_newIEDPos = (getPosATL (_rndRoad select 0)) findEmptyPosition [random _width, _width*1.5, "B_soldier_AAA_F"];
					_type = selectRandom SHGT_civInteraction_RoadIEDListAmmo;

				} else {
					// Spawn IED near a building
					private _bld = nearestBuilding _rndPos;
					if (_bld isEqualTo []) then { continue }; // no road was found, redo calc
					if !(_bld inArea _thisMarker) then { continue }; // if building is outside marker then redo
					_newIEDPos = (getPosATL _bld) findEmptyPosition [5, 30, "B_soldier_AAA_F"];
					_type = selectRandom SHGT_civInteraction_BuildingIEDListAmmo;
				};

				// If unsucessful, move on to next block
				if (_newIEDPos isEqualTo []) then { continue }; // no road was found, redo calc
				if !(_newIEDPos inArea _thisMarker) then {continue}; // if not in area, reset
				if (surfaceIsWater _newIEDPos) then {continue}; // if above water, reset
				if !((nearestObjects [_newIEDPos, SHGT_civInteraction_IEDListAmmo, SHGT_civInteract_IEDminimumSpacing, true]) isEqualTo []) then { continue };
				_newIEDPos = _newIEDPos findEmptyPosition [0, 3, "B_soldier_AAA_F"];
				if (_newIEDPos isEqualTo []) then {_newIEDPos = _newIEDPos findEmptyPosition [0, 15, "B_soldier_AAA_F"];};
				if (_newIEDPos isEqualTo []) then { continue }; // no road was found, redo calc

				// if sucessful, spawn an IED
				_newIED = createVehicle [_type, _newIEDPos, [], 0];
				//_newIED = createMine [selectRandom SHGT_civInteraction_IEDListAmmo, _newIEDPos, [], 1];
				_newIEDStorage pushBack _newIED;
				breakTo "loop2";
			};

			if (count _newIEDStorage >= SHGT_civInteract_IEDSpawnRate) then {breakTo "loop1"};
		} forEach _markers;


		// Add Debug markers
		if (SHGT_civInteraction_debug isEqualTo true) then {
			{
				if (isNil "SHGT_IEDSpawnMarkerDebug") then { SHGT_IEDSpawnMarkerDebug = 0 };
				SHGT_IEDSpawnMarkerDebug = SHGT_IEDSpawnMarkerDebug+1;
				_marker = createMarker [format ["SHGTIEDDebugMarker_%1",SHGT_IEDSpawnMarkerDebug], getPosATL _x];
				_marker setMarkerType "hd_dot";
				_marker setMarkerText "IED";
				systemChat format ["IED %1 spawned",SHGT_IEDSpawnMarkerDebug];
			} forEach _newIEDStorage;
		};
	} forEach SHGT_civInteract_TOAR;





}, SHGT_civInteract_IEDsUpdate*60, []] call CBA_fnc_addPerFrameHandler;


/*

nearestObjects [player, SHGT_civInteraction_IEDListAmmo, worldSize, true]; //4ms
allmissionObjects (SHGT_civInteraction_IEDListAmmo select 1) // 2ms each









