// This function will tag all editor objects at the start of the mission


private _allObjects = (allMissionObjects "All");

{
	_x setVariable ["SHGT_persist_ignore",true,true];
} forEach _allObjects;