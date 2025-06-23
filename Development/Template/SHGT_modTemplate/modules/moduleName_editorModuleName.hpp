class SHGT_odin_civObj: Module_F
{
	scope = 2; // Editor visibility; 2 will show it in the menu, 1 will hide it.
	displayName = "Odin Civ Objective"; // Name displayed in the menu
	//icon = "\a3den\data\cfgwaypoints\leader_ca.paa"; // Map icon. Delete this entry to use the default icon.
	category = "SHGT_modules"; // Category to fall under
	function = "SHGT_fnc_odin_civObj"; // Name of function triggered once conditions are met
	functionPriority = 3; // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
	isGlobal = 0; // 0 for server only execution, 1 for global execution, 2 for persistent global execution
	isTriggerActivated = 0; // 1 for module waiting until all synced triggers are activated
	isDisposable = 0; // 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation won't work)
	is3DEN = 0; // 1 to run init function in Eden Editor as well. 0 otherwise
	//curatorInfoType = "RscDisplayAttributeModuleNuke"; // Menu displayed when the module is placed or double-clicked on by Zeus

	// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
	class Attributes: AttributesBase
	{
		class type: Combo
		{
			property = "SHGT_odin_civType";
			displayName = "civilian obj type";
			tooltip = "Select what type of obj this is";
			typeName = "STRING";
			defaultValue = """Small""";
			class Values
				{
					class base	{ name = "Small"; value = """S""" };
					class fob	{ name = "Medium"; value = """M"""; };
					class roadblock	{ name = "Large"; value = """L"""; };
				};
		};

		class size: Edit
		{
			property = "SHGT_odin_civSize";
			displayName = "Base Size (m)";
			tooltip = "Base size in meters, up to how far AI will spawn";
			typeName = "NUMBER";
			defaultValue = 100;
		};
		
		class priority: Edit
		{
			property = "SHGT_odin_civPriority";
			displayName = "Priority";
			tooltip = "AI will reinforce higher priority objectives first";
			typeName = "NUMBER";
			defaultValue = 50;
		};

		class owner: Combo
		{
			property = "SHGT_odin_civOwner";
			displayName = "Objective owner";
			tooltip = "Select who controls this objective at mission start";
			typeName = "STRING";
			defaultValue = """EAST""";
			class Values
				{
					class west	{ name = "WEST"; value = """WEST""" };
					class east	{ name = "EAST"; value = """EAST"""; };
					class independent	{ name = "Independent"; value = """GUER"""; };
				};
		};

		class infantry: Edit
		{
			property = "SHGT_odin_civInfantry";
			displayName = "Override - Infantry Groups";
			tooltip = "Number of spawned infantry groups for this objective";
			typeName = "NUMBER";
			//defaultValue = 0;
		};

		class armor: Edit
		{
			property = "SHGT_odin_civArmor";
			displayName = "Override - Armor Groups";
			tooltip = "Number of spawned armor groups for this objective";
			typeName = "NUMBER";
			//defaultValue = 0;
		};

		class mechanized: Edit
		{
			property = "SHGT_odin_civMechanized";
			displayName = "Override - Mechanized Groups";
			tooltip = "Number of spawned mechanized groups for this objective";
			typeName = "NUMBER";
			//defaultValue = 0;
		};

		class motorized: Edit
		{
			property = "SHGT_odin_civMotorized";
			displayName = "Override - motorized Groups";
			tooltip = "Number of spawned motorized groups for this objective";
			typeName = "NUMBER";
			//defaultValue = 0;
		};

	};

	class ModuleDescription: ModuleDescription
	{
		description[] =
		{
			"Module desc here"
		};
	};
};