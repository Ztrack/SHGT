// This function saves the reputation system stats

// get module info
if !(SHGT_civInteraction_status isEqualTo true) exitWith {};
//SHGT_areaReputation
_export = SHGT_areaReputation toArray false; // split arrays set to false

if ( count _export > 2400) then {
["Town array too big- contact ztrack"] remoteExec ["systemChat"];
};

// export to file
["write", ["civInteract","data", _export]] call SHGT_persist_inidbi; // Section,key,value

