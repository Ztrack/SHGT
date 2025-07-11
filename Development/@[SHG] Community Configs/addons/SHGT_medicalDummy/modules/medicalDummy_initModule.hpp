class SHGT_medicalDummy_initModule: Module_F
{
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "SHGT Medical Dummy Init"; // Name displayed in the menu
	//icon = "\a3den\data\cfgwaypoints\leader_ca.paa"; // Map icon. Delete this entry to use the default icon.
	category = "SHGT_modules"; // Category to fall under
	function = "SHGT_fnc_medicalDummy_init_module_function"; // Name of function triggered once conditions are met
	functionPriority = 3; // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	isGlobal = 0; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
	isTriggerActivated = 0; // 1 for module waiting until all synced triggers are activated
	isDisposable = 0; // 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation won't work)
	is3DEN = 0; // 1 to run init function in Eden Editor as well. 0 otherwise
	//curatorInfoType = "RscDisplayAttributeModuleNuke"; // Menu displayed when the module is placed or double-clicked on by Zeus

	// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
	class Attributes: AttributesBase
	{
		class SHGT_medicalDummy_isCCP: Edit
		{
			property = "SHGT_medicalDummy_isCCP";
			displayName = "Is CCP";
			tooltip = "Is this a CCP? Can spawn multiple stretchers";
			typeName = "STRING";
			defaultValue = true;
		};
	};

	class ModuleDescription: ModuleDescription
	{
		description[] =
		{
			"Sync This Module to the Medical Dummy Controller Object"
		};
	};
};