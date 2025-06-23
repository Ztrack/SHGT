class CfgPatches
{
	class SHGT_flags
	{
		name = "SHG flags";
		author = "Ztrack";
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Data_F","rhs_cti_insurgents"};
		units[] = {"shgt_flag1","shgt_flag2","shgt_flag3","shgt_flag4","shgt_flag5","shgt_flag6"};
		weapons[] = {};
		skipWhenMissingDependencies = 1;
	};
};
class CfgEditorCategories
{
	class SHGT_objects
	{
		displayName = "Objects [SHGT]";
		priority = 1;
		side = 1;
	};
};
class CfgEditorSubcategories
{
	class SHGT_misc
	{
		displayName = "misc";
	};
};
class CfgVehicles
{
	class FlagCarrierCore;
	class rhs_Flag_chdkz;
	class shgt_flag1: rhs_Flag_chdkz
	{
		scope = 2;
		author = "Ztrack";
		displayName = "SHG Small Flag";
		editorCategory = "SHGT_objects";
		editorSubcategory = "SHGT_misc";
		class EventHandlers
		{
			delete RHS_EventHandlers;
			class SHGT_EventHandlers
			{
				init = "(_this select 0) setFlagTexture 'SHGT_flags\SHGT_spearheadFlag.paa'";
			};
		};
	};
	class shgt_flag2: rhs_Flag_chdkz
	{
		scope = 2;
		author = "Ztrack";
		displayName = "SHG Small Reaper Flag";
		editorCategory = "SHGT_objects";
		editorSubcategory = "SHGT_misc";
		class EventHandlers
		{
			delete RHS_EventHandlers;
			class SHGT_EventHandlers
			{
				init = "(_this select 0) setFlagTexture 'SHGT_flags\SHGT_3IDFlag.paa'";
			};
		};
	};
	class shgt_flag3: rhs_Flag_chdkz
	{
		scope = 2;
		author = "Ztrack";
		displayName = "SHG Small Misfit Flag";
		editorCategory = "SHGT_objects";
		editorSubcategory = "SHGT_misc";
		class EventHandlers
		{
			delete RHS_EventHandlers;
			class SHGT_EventHandlers
			{
				init = "(_this select 0) setFlagTexture 'SHGT_flags\SHGT_misfitFlag.paa'";
			};
		};
	};
	class shgt_flag4: rhs_Flag_chdkz
	{
		scope = 2;
		author = "Ztrack";
		displayName = "SHG Small Viking Flag";
		editorCategory = "SHGT_objects";
		editorSubcategory = "SHGT_misc";
		class EventHandlers
		{
			delete RHS_EventHandlers;
			class SHGT_EventHandlers
			{
				init = "(_this select 0) setFlagTexture 'SHGT_flags\SHGT_vikingFlag.paa'";
			};
		};
	};
	class shgt_flag5: rhs_Flag_chdkz
	{
		scope = 2;
		author = "Ztrack";
		displayName = "SHG Small Gambler Flag";
		editorCategory = "SHGT_objects";
		editorSubcategory = "SHGT_misc";
		class EventHandlers
		{
			delete RHS_EventHandlers;
			class SHGT_EventHandlers
			{
				init = "(_this select 0) setFlagTexture 'SHGT_flags\SHGT_gamblerFlag.paa'";
			};
		};
	};
	class shgt_flag6: rhs_Flag_chdkz
	{
		scope = 2;
		author = "Ztrack";
		displayName = "SHG Small S3 Flag";
		editorCategory = "SHGT_objects";
		editorSubcategory = "SHGT_misc";
		class EventHandlers
		{
			delete RHS_EventHandlers;
			class SHGT_EventHandlers
			{
				init = "(_this select 0) setFlagTexture 'SHGT_flags\SHGT_S3Flag.paa'";
			};
		};
	};
	


};