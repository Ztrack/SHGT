class SHGT_arsenal_coreModule: Module_F
{
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Arsenal Core"; // Name displayed in the menu
	//icon = "\a3den\data\cfgwaypoints\leader_ca.paa"; // Map icon. Delete this entry to use the default icon.
	category = "SHGT_modules"; // Category to fall under
	function = ""; // Name of function triggered once conditions are met
	functionPriority = 3; // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	isGlobal = 0; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
	isTriggerActivated = 0; // 1 for module waiting until all synced triggers are activated
	isDisposable = 0; // 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation won't work)
	is3DEN = 0; // 1 to run init function in Eden Editor as well. 0 otherwise
	//curatorInfoType = "RscDisplayAttributeModuleNuke"; // Menu displayed when the module is placed or double-clicked on by Zeus

	// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
	class Attributes: AttributesBase
	{
		class SHGT_Arsenal_boxName: Edit
		{
			property = "SHGT_arsenal_boxName";
			displayName = "Arsenal Box Classname";
			tooltip = "One core module per arsenal interaction. Can have multiple";
			typeName = "STRING";
			defaultValue = """B_supplyCrate_F""";
			
		};
		class SHGT_arsenal_interaction: Edit
		{
			property = "SHGT_arsenal_interaction";
			displayName = "Arsenal Opening Message";
			tooltip = "This message will show when looking at an arsenal to open it. You can include color codes, font styles etc";
			typeName = "STRING";
			defaultValue = """Open My Personalized Arsenal""";
			
		};
		class SHGT_arsenal_logo: Edit
		{
			property = "SHGT_arsenal_logo";
			displayName = "Arsenal Logo on interaction";
			tooltip = "Must be a paa file (see https://paa.gruppe-adler.de/), specify the path here. Can be located in your mission folder. Leave blank for just the text showing";
			typeName = "STRING";
			defaultValue = """SHGT_arsenal\ui\SHGT_NewSpearheadLogo.paa""";
			
		};
		class ModuleDescription: ModuleDescription{};
	};

	class ModuleDescription: ModuleDescription
	{
		description[] =
		{
			"Sync the core module to one list creator module for each unit trait/variable. "
		};
	};
};