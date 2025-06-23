
_target = Objtarget;
_targetClass = typeOf _target;
_objNameList = [];
_objCostList = [];
_objCategoryList = [];
_deleted = false;

{
	_objNameList pushBack (_x select 0);
	_objCostList pushBack (_x select 1);
	_objCategoryList pushBack (_x select 2);
} forEach SHGT_logistics_list;

// Check indeces
_idx = _objNameList find _targetClass;
_objCost = (_objCostList select _idx);

// Run if end states
if !(_targetClass in _objNameList) exitWith {systemChat "Cant refund this item"};
if (_objCost < 0) exitWith {deleteVehicle _target; systemChat "Item dismantled";};

// Search nearby supply points to refund to
private _nearbySupplyPoints = nearestObjects [getPosATL player, SHGT_logistics_cargoCapable,SHGT_logistics_supplySearchRadius];
{
    _supplyCount = _x getVariable ["supplyCount",0];
    if ((_supplyCount+_objCost)<=SHGT_logistics_supplyMax) exitWith {
        _x setVariable ["supplyCount",(_supplyCount+_objCost),true];
		if (_x getVariable ["supplyCount",0]>SHGT_logistics_supplyMax) then {_x setVariable ["supplyCount",SHGT_logistics_supplyMax,true];};
		_deleted = true;
		deleteVehicle _target;
    };
} forEach _nearbySupplyPoints;
if (_deleted isEqualTo true) exitWith {systemChat "Supply refunded to container";};

// Add sandbags to inventory if no nearby supply points
if (_deleted isEqualTo false) then {
for "_i" from 1 to _objCost do {
    player addItem "ACE_Sandbag_empty";
	deleteVehicle _target;
	_deleted = true;
};
if (_deleted isEqualTo true) then {systemChat "Sandbags refunded, extra lost if inventory full";};
};