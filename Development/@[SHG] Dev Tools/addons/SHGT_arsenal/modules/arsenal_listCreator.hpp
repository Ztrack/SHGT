class SHGT_arsenal_listCreatorModule: Module_F
{
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Arsenal List Creator"; // Name displayed in the menu
	//icon = "\a3den\data\cfgwaypoints\leader_ca.paa"; // Map icon. Delete this entry to use the default icon.
	category = "SHGT_modules"; // Category to fall under
	function = ""; // Name of function triggered once conditions are met
	functionPriority = 2; // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	isGlobal = 0; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
	isTriggerActivated = 0; // 1 for module waiting until all synced triggers are activated
	isDisposable = 0; // 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation won't work)
	is3DEN = 0; // 1 to run init function in Eden Editor as well. 0 otherwise
	//curatorInfoType = "RscDisplayAttributeModuleNuke"; // Menu displayed when the module is placed or double-clicked on by Zeus

	// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
	class Attributes: AttributesBase
	{
		class SHGT_arsenal_listName: Edit
		{
			property = "SHGT_arsenal_listName";
			displayName = "List Name";
			tooltip = "Can be any variable assigned to players. For example: Infantry_Medic, Infantry_sniper";
			typeName = "STRING";
			defaultValue = """Infantry""";
		};

		class SHGT_arsenal_playerUIDs: Edit
		{
			property = "SHGT_arsenal_playerUIDs";
			displayName = "Player UIDs";
			tooltip = "Instead of assigning by slot, you can assign items by UID ex: ['12345'] or ['12345','678910'] etc. MUST BE STRINGS NOT NUMBERS. Only works on a server, not the editor. You can test in editor if you input '_SP_PLAYER_' in place of a UID";
			typeName = "STRING";
			defaultValue = """[]""";
		};
		
		class SHGT_arsenal_listManualInput: Edit
		{
			property = "SHGT_arsenal_listManualInput";
			displayName = "Manual Input";
			tooltip = "This is only meant for some weapons or items that are for some reason not initialized by ACE arsenals normally. For example, 416s from NIArms";
			typeName = "STRING";
			defaultValue = """[]""";
		};
		
		class ModuleDescription: ModuleDescription{};
	};

	class ModuleDescription: ModuleDescription
	{
		description[] =
		{
			"Sync this module to the core module & an arsenal box you want to pull an ace arsenal list from."
		};
	};
};