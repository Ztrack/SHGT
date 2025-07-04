// This function loads the reputation system stats


_temp = ["read", ["civInteract","data", "STRING"]] call SHGT_persist_inidbi;
_tempHash = createHashMapFromArray _temp;

if (isNil "SHGT_areaReputation") then {SHGT_areaReputation = createHashMap};
SHGT_areaReputation merge [_tempHash, true]; // Merge hasmaps overwritting existing values
publicVariable "SHGT_areaReputation";

/*
_tempArray = parseSimpleArray (str SHGT_areaReputation);
typeName (createHashMapFromArray _tempArray)