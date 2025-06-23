if !(isServer) exitWith {};

// Define categories for lists
SHGT_logistics_categories = createHashMap;
SHGT_logistics_categories set ['HQ',['HQ','FOB','PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['FOB',['FOB','PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['PB',['PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['GLOBAL',['GLOBAL','CREATION']];
publicVariable "SHGT_logistics_categories";

// Initialize box saving 
SHGT_logisticsBoxDatabase = profileNamespace getVariable ["SHGT_logisticsBoxDatabase", createHashMap];
if (typeName SHGT_logisticsBoxDatabase != "HASHMAP") exitWith { SHGT_logisticsBoxDatabase = createHashMap};
publicVariable "SHGT_logisticsBoxDatabase";


// Set done flag
SHGT_logisticsPostInitCheck = true;
