#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_RangerVestEdits
	{
		units[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F","XYI_RANGER_ASSET"};
		skipWhenMissingDependencies = 1;
	};
};

class CfgWeapons
{
class V_PlateCarrier1_rgr;
class MBAV_Ranger_v1_1: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v1_1_fix: MBAV_Ranger_v1_1 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};
class MBAV_Ranger_v1_2: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v1_2_fix: MBAV_Ranger_v1_2 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};

class MBAV_Ranger_v2_1: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v2_1_fix: MBAV_Ranger_v2_1 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};
class MBAV_Ranger_v2_2: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v2_2_fix: MBAV_Ranger_v2_2 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};

class MBAV_Ranger_v3_1: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v3_1_fix: MBAV_Ranger_v3_1 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};
class MBAV_Ranger_v3_2: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v3_2_fix: MBAV_Ranger_v3_2 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};

class MBAV_Ranger_v4_1: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v4_1_fix: MBAV_Ranger_v4_1 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};
class MBAV_Ranger_v4_2: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v4_2_fix: MBAV_Ranger_v4_2 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};

class MBAV_Ranger_v5_1: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v5_1_fix: MBAV_Ranger_v5_1 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};
class MBAV_Ranger_v5_2: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v5_2_fix: MBAV_Ranger_v5_2 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};

class MBAV_Ranger_v6_1: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v6_1_fix: MBAV_Ranger_v6_1 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};
class MBAV_Ranger_v6_2: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v6_2_fix: MBAV_Ranger_v6_2 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};

class MBAV_Ranger_v7_1: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v7_1_fix: MBAV_Ranger_v7_1 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};
class MBAV_Ranger_v7_2: V_PlateCarrier1_rgr {class ItemInfo;};
class MBAV_Ranger_v7_2_fix: MBAV_Ranger_v7_2 {class ItemInfo: ItemInfo{class HitpointsProtectionInfo {class Chest{hitpointName	= "HitChest";armor			= 20;passThrough		= 0.3;};class Diaphragm {hitpointName	= "HitDiaphragm";armor			= 20;passThrough		= 0.3;};class Abdomen {hitpointName	= "HitAbdomen";armor			= 20;passThrough		= 0.3;};class Body {hitpointName	= "HitBody";passThrough		= 0.3;};};};};


};


class CfgVehicles
{
class Bag_Base;
class S_RangerBelt_v1_1;
class S_RangerBelt_v2_1;
class S_RangerBelt_v3_1;
class S_RangerBelt_v4_1;
class S_RangerBelt_v5_1;
class S_RangerBelt_v6_1;
class S_RangerBelt_v6_2;
class S_RangerBelt_v7_1;
class S_RangerBelt_v1_1_fix: S_RangerBelt_v1_1 {maximumLoad = 320; mass = 20;};
class S_RangerBelt_v2_1_fix: S_RangerBelt_v2_1 {maximumLoad = 320; mass = 20;};
class S_RangerBelt_v3_1_fix: S_RangerBelt_v3_1 {maximumLoad = 320; mass = 20;};
class S_RangerBelt_v4_1_fix: S_RangerBelt_v4_1 {maximumLoad = 320; mass = 20;};
class S_RangerBelt_v5_1_fix: S_RangerBelt_v5_1 {maximumLoad = 320; mass = 20;};
class S_RangerBelt_v6_1_fix: S_RangerBelt_v6_1 {maximumLoad = 320; mass = 20;};
class S_RangerBelt_v6_2_fix: S_RangerBelt_v6_2 {maximumLoad = 320; mass = 20;};
class S_RangerBelt_v7_1_fix: S_RangerBelt_v7_1 {maximumLoad = 320; mass = 20;};

};










