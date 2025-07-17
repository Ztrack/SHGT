class CfgPatches{
    class SHG_MSHORAD{
		name = "Spearhead Gaming Configs - Bradley MSHORAD";
        author = "KetchupZombi";
        url = "https://discord.gg/spearheadgaming";
        units[] = {
			"SHG_M6A1_Shorad",
			"SHG_M6A2_Shorad"
		};
        weapons[] = {
			"SHG_weap_M242BC",
			"SHG_weap_fcs_ammo",
			"SHG_weap_m230_bradley_coax",
			"SHG_weap_stinger_Launcher",
			"SHG_weap_M230LF"
		};
        requiredAddons[] = {
			"RHS_US_A2Port_Armor",
			"A3_Armor_F_Beta",
			"A3_Data_F",
			"rhsusf_c_heavyweapons",
			"rhsusf_c_airweapons",
			"rhs_c_heavyweapons",
			"A3_Weapons_F",
			"ace_realisticnames"
		};
        ammo[] = {
			"rhs_ammo_M792_Prox",
			"shg_ammo_XM1211_Prox",
			"shg_ammo_XM1211",
			"shg_ammo_XM1198"
        };
		skipWhenMissingDependencies = 1;
        requiredVersion = 1.0;
    };
};
// UK3CB_9M311M1_launcher UK3CB_30mm_Cannon
class CfgVehicles{
	class RHS_M6_wd;
	class SHG_M6A1_Shorad: RHS_M6_wd{
		displayName = "M-SHORAD I";
		class components{
			class AITankSteeringComponent{
				allowCollisionAvoidance = 1;
				allowDrifting = 0;
				allowOvertaking = 1;
				allowTurnAroundInPoint = 1;
				commandTurnFactor = 2;
				convoyPIDWeights[] = {1,0,0};
				differenceAngleCoef = 1;
				doPredictForward = 1;
				doRemapSpeed = 0;
				forwardAngleCoef = 0.7;
				maxWheelAngleDiff = 0.2616;
				minSpeedToKeep = 0.01;
				predictForwardMaxSpeed = 15;
				predictForwardRange[] = {1,20};
				remapSpeedRange[] = {30,70};
				remapSpeedScalar[] = {1,0.35};
				speedPIDWeights[] = {0.7,0.2,0};
				speedPredictionMethod = 3;
				steerAheadSaturation[] = {0.01,0.4};
				steeringAngleCoef = 1;
				steeringPIDWeights[] = {2.9,0.1,0.2};
				stuckMaxTime = 3;
				wheelAngleCoef = 0.7;
			};
			class SensorsManagerComponent{
				class Components{
					class ActiveRadarSensorComponent{
						aimDown = 0;
						allowsMarking = 1;
						angleRangeHorizontal = 360;
						angleRangeVertical = 360;
						animDirection = "mainGun";
						color[] = {0,1,1,1};
						componentType = "ActiveRadarSensorComponent";
						groundNoiseDistanceCoef = -1;
						maxFogSeeThrough = -1;
						maxGroundNoiseDistance = -1;
						maxSpeedThreshold = 20;
						maxTrackableATL = 4000;
						maxTrackableSpeed = "1e10";
						minSpeedThreshold = 6;
						minTrackableATL = "-1e10";
						minTrackableSpeed = "-1e10";
						typeRecognitionDistance = 6000;
						class AirTarget{
							maxRange = 8000;
							minRange = 8000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
						class GroundTarget{
							maxRange = 1000;
							minRange = 1000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
					};
					class PassiveRadarSensorComponent{
						aimDown = 0;
						allowsMarking = 0;
						angleRangeHorizontal = 360;
						angleRangeVertical = 360;
						animDirection = "mainGun";
						color[] = {0.5,1,0.5,0.5};
						componentType = "PassiveRadarSensorComponent";
						groundNoiseDistanceCoef = -1;
						maxGroundNoiseDistance = -1;
						maxSpeedThreshold = 0;
						maxTrackableATL = 1e+10;
						maxTrackableSpeed = 1e+10;
						minSpeedThreshold = 0;
						minTrackableATL = -1e+10;
						minTrackableSpeed = -1e+10;
						typeRecognitionDistance = 12000;
						class AirTarget{
							maxRange = 16000;
							minRange = 16000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
						class GroundTarget{
							maxRange = 6000;
							minRange = 6000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
					};
				};
			};
			class TransportCountermeasuresComponent{
			};
			class VehicleSystemsDisplayManagerComponentLeft{
				componentType = "VehicleSystemsDisplayManager";
				defaultDisplay = "EmptyDisplay";
				left = 1;
				x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_X"",	(safezoneX + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
				y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
				class Components{
					class CrewDisplay{
						componentType = "CrewDisplayComponent";
					};
					class EmptyDisplay{
						componentType = "EmptyDisplayComponent";
					};
					class MineDetectorDisplay{
						componentType = "MineDetectorDisplayComponent";
					};
					class MinimapDisplay{
						componentType = "MinimapDisplayComponent";
					};
					class SlingLoadDisplay{
						componentType = "SlingLoadDisplayComponent";
					};
					class UAVDisplay{
						componentType = "UAVFeedDisplayComponent";
					};
					class VehicleCommanderDisplay{
						componentType = "TransportFeedDisplayComponent";
						source = "Commander";
					};
					class VehiclePrimaryGunnerDisplay{
						componentType = "TransportFeedDisplayComponent";
						source = "PrimaryGunner";
					};
				};
			};
			class VehicleSystemsDisplayManagerComponentRight{
				componentType = "VehicleSystemsDisplayManager";
				defaultDisplay = "EmptyDisplay";
				right = 1;
				x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_X"",	((safezoneX + safezoneW) - (		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))])";
				y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
				class Components{
					class CrewDisplay{
						componentType = "CrewDisplayComponent";
					};
					class EmptyDisplay{
						componentType = "EmptyDisplayComponent";
					};
					class MineDetectorDisplay{
						componentType = "MineDetectorDisplayComponent";
					};
					class MinimapDisplay{
						componentType = "MinimapDisplayComponent";
					};
					class SlingLoadDisplay{
						componentType = "SlingLoadDisplayComponent";
					};
					class UAVDisplay{
						componentType = "UAVFeedDisplayComponent";
					};
					class VehicleCommanderDisplay{
						componentType = "TransportFeedDisplayComponent";
						source = "Commander";
					};
					class VehiclePrimaryGunnerDisplay{
						componentType = "TransportFeedDisplayComponent";
						source = "PrimaryGunner";
					};
				};
			};
			
		};
	class Turrets{
		class MainTurret{
			ace_fcs_DistanceInterval = 5;
			ace_fcs_Enabled = 0;
			ace_fcs_MaxDistance = 5500;
			ace_fcs_MinDistance = 200;
			aggregateReflectors[] = {};
			allowLauncherIn = 0;
			allowLauncherOut = 0;
			allowTabLock = 1;
			animationSourceBody = "mainTurret";
			animationSourceCamElev = "camElev";
			animationSourceGun = "mainGun";
			animationSourceHatch = "hatchGunner";
			animationSourceStickX = "turret_control_x";
			animationSourceStickY = "turret_control_y";
			armorLights = 0.4;
			body = "mainTurret";
			canEject = 1;
			canHideGunner = -1;
			canUseScanners = 1;
			castGunnerShadow = 0;
			commanding = 1;
			disableSoundAttenuation = 0;
			discreteDistance[] = {0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200,2400,2600,2800,3000};
			discreteDistanceInitIndex = 2;
			dontCreateAI = 0;
			ejectDeadGunner = 0;
			forceHideGunner = 0;
			forceNVG = 0;
			gun = "mainGun";
			gunBeg = "Usti hlavne";
			gunEnd = "Konec hlavne";
			gunnerAction = "RHS_M2A2_GunnerOut";
			gunnerCompartments = "Compartment1";
			gunnerDoor = "hatchG";
			gunnerFireAlsoInInternalCamera = 1;
			gunnerForceOptics = 1;
			gunnerGetInAction = "GetInHigh";
			gunnerGetOutAction = "GetOutHigh";
			gunnerHasFlares = 0;
			gunnerInAction = "RHS_M2A2_Gunner";
			gunnerLeftHandAnimName = "turret_control";
			gunnerLeftLegAnimName = "";
			gunnerName = "Gunner";
			gunnerOpticsColor[] = {0,0,0,1};
			gunnerOpticsEffect[] = {};
			gunnerOpticsModel = "\A3\weapons_f\reticle\optics_empty";
			gunnerOpticsShowCursor = 0;
			gunnerOutFireAlsoInInternalCamera = 1;
			gunnerOutForceOptics = 0;
			gunnerOutOpticsColor[] = {0,0,0,1};
			gunnerOutOpticsEffect[] = {};
			gunnerOutOpticsModel = "";
			gunnerOutOpticsShowCursor = 0;
			gunnerRightHandAnimName = "";
			gunnerRightLegAnimName = "";
			gunnerType = "";
			gunnerUsesPilotView = 0;
			hasGunner = 1;
			hideWeaponsGunner = 1;
			inGunnerMayFire = 1;
			initCamElev = 0;
			initElev = 0;
			initOutElev = 0;
			initOutTurn = 0;
			initTurn = 0;
			isCopilot = 0;
			lockWhenDriverOut = 1;
			lockWhenVehicleSpeed = -1;
			LODOpticsIn = 0;
			LODTurnedIn = 1000;
			LODTurnedOut = -1;
			magazines[] = {"rhs_mag_1100Rnd_762x51_M240","rhs_mag_1100Rnd_762x51_M240","Rhs_mag_4Rnd_stinger","Rhs_mag_4Rnd_stinger","Rhs_mag_4Rnd_stinger","rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_230Rnd_25mm_M242_HEI","rhs_mag_70Rnd_25mm_M242_APFSDS","rhs_mag_230Rnd_25mm_M242_HEI","rhs_laserfcsmag","rhs_laserfcsmag"};
			maxCamElev = 90;
			maxElev = 57;
			maxhorizontalrotspeed = 1.04;
			maxOutElev = 20;
			maxOutTurn = 60;
			maxTurn = 360;
			maxverticalrotspeed = 1.04;
			memoryPointGun = "kulas";
			memoryPointGunnerOptics = "gunnerview";
			memoryPointGunnerOutOptics = "";
			memoryPointsGetInGunner = "pos gunner";
			memoryPointsGetInGunnerDir = "pos gunner dir";
			memoryPointsGetInGunnerPrecise = "";
			minCamElev = -90;
			minElev = -9;
			minOutElev = -4;
			minOutTurn = -60;
			minTurn = -360;
			missileBeg = "spice rakety";
			missileEnd = "konec rakety";
			outGunnerMayFire = 0;
			playerPosition = 0;
			preciseGetInOut = 0;
			primary = 1;
			primaryGunner = 1;
			primaryObserver = 0;
			proxyIndex = 1;
			proxyType = "CPGunner";
			selectionFireAnim = "zasleh2";
			showAllTargets = 0;
			showCrewAim = 0;
			showHMD = 0;
			slingLoadOperator = 0;
			soundElevation[] = {"",0.00316228,1};
			soundServo[] = {"A3\Sounds_F\vehicles\armor\APC\noises\servo_APC_gunner",0.562341,1,30};
			soundServoVertical[] = {"A3\Sounds_F\vehicles\armor\APC\noises\servo_APC_gunner_vertical",0.562341,1,30};
			stabilizedinaxes = 3;
			startengine = 0;
			turretCanSee = 0;
			turretFollowFreeLook = 0;
			turretInfoType = "RHS_RscODS_ISU";
			usePip = 2;
			viewGunnerInExternal = 1;
			viewGunnerShadow = 1;
			viewGunnerShadowAmb = 0.5;
			viewGunnerShadowDiff = 0.05;
			weapons[] = {"SHG_weap_M242BC","SHG_weap_m230_bradley_coax","SHG_weap_stinger_Launcher","SHG_weap_fcs_ammo"};
			class Components{
				class VehicleSystemsDisplayManagerComponentLeft{
					componentType = "VehicleSystemsDisplayManager";
					defaultDisplay = "EmptyDisplay";
					left = 1;
					x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_X"",	(safezoneX + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
					y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
					class Components{
						class CrewDisplay{
							componentType = "CrewDisplayComponent";
						};
						class EmptyDisplay{
							componentType = "EmptyDisplayComponent";
						};
						class SensorDisplay{
							componentType = "SensorsDisplayComponent";
							range[] = {8000,4000,2000};
							resource = "RscCustomInfoSensors";
						};
						class MineDetectorDisplay{
							componentType = "MineDetectorDisplayComponent";
						};
						class MinimapDisplay{
							componentType = "MinimapDisplayComponent";
						};
						class SlingLoadDisplay{
							componentType = "SlingLoadDisplayComponent";
						};
						class UAVDisplay{
							componentType = "UAVFeedDisplayComponent";
						};
						class VehicleCommanderDisplay{
							componentType = "TransportFeedDisplayComponent";
							source = "Commander";
						};
						class VehicleDriverDisplay{
							componentType = "TransportFeedDisplayComponent";
							source = "Driver";
						};
					};
				};
				class VehicleSystemsDisplayManagerComponentRight{
					componentType = "VehicleSystemsDisplayManager";
					defaultDisplay = "EmptyDisplay";
					right = 1;
					x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_X"",	((safezoneX + safezoneW) - (		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))])";
					y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
					class Components{
						class CrewDisplay{
							componentType = "CrewDisplayComponent";
						};
						class EmptyDisplay{
							componentType = "EmptyDisplayComponent";
						};
						class SensorDisplay{
							componentType = "SensorsDisplayComponent";
							range[] = {8000,4000,2000};
							resource = "RscCustomInfoSensors";
						};
						class MineDetectorDisplay{
							componentType = "MineDetectorDisplayComponent";
						};
						class MinimapDisplay{
							componentType = "MinimapDisplayComponent";
						};
						class SlingLoadDisplay{
							componentType = "SlingLoadDisplayComponent";
						};
						class UAVDisplay{
							componentType = "UAVFeedDisplayComponent";
						};
						class VehicleCommanderDisplay{
							componentType = "TransportFeedDisplayComponent";
							source = "Commander";
						};
						class VehicleDriverDisplay{
							componentType = "TransportFeedDisplayComponent";
							source = "Driver";
						};
					};
				};
			};
			class GunClouds{
				access = 0;
				cloudletAccY = 0.4;
				cloudletAlpha = 1;
				cloudletAnimPeriod = 1;
				cloudletColor[] = {1,1,1,0};
				cloudletDuration = 0.3;
				cloudletFadeIn = 0.01;
				cloudletFadeOut = 1;
				cloudletGrowUp = 1;
				cloudletMaxYSpeed = 0.8;
				cloudletMinYSpeed = 0.2;
				cloudletShape = "cloudletClouds";
				cloudletSize = 1;
				deltaT = 0;
				initT = 0;
				interval = 0.05;
				size = 3;
				sourceSize = 0.5;
				timeToLive = 0;
				class Table{
					class T0{
						color[] = {1,1,1,0};
						maxT = 0;
					};
				};
			};
			class GunFire{
				access = 0;
				cloudletAccY = 0;
				cloudletAlpha = 1;
				cloudletAnimPeriod = 1;
				cloudletColor[] = {1,1,1,0};
				cloudletDuration = 0.2;
				cloudletFadeIn = 0.01;
				cloudletFadeOut = 0.5;
				cloudletGrowUp = 0.2;
				cloudletMaxYSpeed = 100;
				cloudletMinYSpeed = -100;
				cloudletShape = "cloudletFire";
				cloudletSize = 1;
				deltaT = -3000;
				initT = 4500;
				interval = 0.01;
				size = 3;
				sourceSize = 0.5;
				timeToLive = 0;
				class Table{
					class T0{
						color[] = {0.82,0.95,0.93,0};
						maxT = 0;
					};
					class T1{
						color[] = {0.75,0.77,0.9,0};
						maxT = 200;
					};
					class T10{
						color[] = {0.62,0.29,0.03,0};
						maxT = 2600;
					};
					class T11{
						color[] = {0.59,0.35,0.05,0};
						maxT = 2650;
					};
							class T12{
								color[] = {0.75,0.37,0.03,0};
maxT = 2700;
							};
							class T13{
								color[] = {0.88,0.34,0.03,0};
maxT = 2750;
							};
							class T14{
								color[] = {0.91,0.5,0.17,0};
maxT = 2800;
							};
							class T15{
								color[] = {1,0.6,0.2,0};
maxT = 2850;
							};
							class T16{
								color[] = {1,0.71,0.3,0};
maxT = 2900;
							};
							class T17{
								color[] = {0.98,0.83,0.41,0};
maxT = 2950;
							};
							class T18{
								color[] = {0.98,0.91,0.54,0};
maxT = 3000;
							};
							class T19{
								color[] = {0.98,0.99,0.6,0};
maxT = 3100;
							};
							class T2{
								color[] = {0.56,0.62,0.67,0};
maxT = 400;
							};
							class T20{
								color[] = {0.96,0.99,0.72,0};
maxT = 3300;
							};
							class T21{
								color[] = {1,0.98,0.91,0};
maxT = 3600;
							};
							class T22{
								color[] = {1,1,1,0};
maxT = 4200;
							};
							class T3{
								color[] = {0.39,0.46,0.47,0};
maxT = 600;
							};
							class T4{
								color[] = {0.24,0.31,0.31,0};
maxT = 800;
							};
							class T5{
								color[] = {0.23,0.31,0.29,0};
								maxT = 1000;
							};
							class T6{
								color[] = {0.21,0.29,0.27,0};
								maxT = 1500;
							};
							class T7{
								color[] = {0.19,0.23,0.21,0};
								maxT = 2000;
							};
							class T8{
								color[] = {0.22,0.19,0.1,0};
								maxT = 2300;
							};
							class T9{
								color[] = {0.35,0.2,0.02,0};
								maxT = 2500;
							};
						};
			};
			class HitPoints{
				class Hit_Optics_Gnr{
					armor = -40;
					armorComponent = "Hit_Optics_Gnr";
					explosionShielding = 0;
					name = "";
					passThrough = 0;
					visual = "vis_optics_Gnr";
				};
				class HitGun{
					armor = -60;
					armorComponent = "Hit_Gun";
					explosionShielding = 0.001;
					isGun = 1;
					minimalHit = -0.3;
					name = "zbran";
					passThrough = 0;
					radius = 0.1;
					visual = "-";
				};
				class HitTurret{
					armor = -60;
					armorComponent = "Hit_Turret";
					explosionShielding = 0.001;
					isTurret = 1;
					minimalHit = -0.3;
					name = "vez";
					passThrough = 0;
					radius = 0.08;
					visual = "vez";
				};
			};
			class MGunClouds{
				access = 0;
				cloudletAccY = 0;
				cloudletAlpha = 0.3;
				cloudletAnimPeriod = 1;
				cloudletColor[] = {1,1,1,0};
				cloudletDuration = 0.05;
				cloudletFadeIn = 0;
				cloudletFadeOut = 0.1;
				cloudletGrowUp = 0.05;
				cloudletMaxYSpeed = 100;
				cloudletMinYSpeed = -100;
				cloudletShape = "cloudletClouds";
				cloudletSize = 1;
				deltaT = 0;
				initT = 0;
				interval = 0.02;
				size = 0.3;
				sourceSize = 0.02;
				timeToLive = 0;
				class Table{
					class T0{
						color[] = {1,1,1,0};
						maxT = 0;
					};
				};
			};
			class OpticsIn{
				class Wide{
					gunnerOpticsEffect[] = {};
					gunnerOpticsModel = "\rhsusf\addons\rhsusf_optics\data\rhsusf_ISU";
					hitPoint = "Hit_Optics_Gnr";
					initAngleX = 0;
					initAngleY = 0;
					initFov = 0.175;
					maxAngleX = 30;
					maxAngleY = 100;
					maxFov = 0.175;
					minAngleX = -30;
					minAngleY = -100;
					minFov = 0.175;
					opticsDisplayName = "WIDE";
					thermalMode[] = {4};
					visionMode[] = {"Normal","Ti"};
				};
				class Narrow{
					gunnerOpticsEffect[] = {};
					gunnerOpticsModel = "\rhsusf\addons\rhsusf_optics\data\rhsusf_ISU";
					hitPoint = "Hit_Optics_Gnr";
					initAngleX = 0;
					initAngleY = 0;
					initFov = 0.0583333;
					maxAngleX = 30;
					maxAngleY = 100;
					maxFov = 0.0583333;
					minAngleX = -30;
					minAngleY = -100;
					minFov = 0.0583333;
					opticsDisplayName = "NARROW";
					thermalMode[] = {4};
					visionMode[] = {"Normal","Ti"};
				};
			};
			class Reflectors{
			};
			class TurnIn{
				turnOffset = 0;
			};
			class TurnOut{
				turnOffset = 0;
			};
			class Turrets{
				class CommanderOptics{
					ace_fcs_DistanceInterval = 5;
					ace_fcs_Enabled = 0;
					ace_fcs_MaxDistance = 5500;
					ace_fcs_MinDistance = 200;
					aggregateReflectors[] = {};
					allowLauncherIn = 0;
					allowLauncherOut = 0;
					allowTabLock = 0;
					animationSourceBody = "obsTurret";
					animationSourceCamElev = "camElev";
					animationSourceGun = "obsGun";
					animationSourceHatch = "hatchCommander";
					animationSourceStickX = "com_turret_control_x";
					animationSourceStickY = "com_turret_control_y";
					armorLights = 0.4;
					body = "obsTurret";
					canEject = 1;
					canHideGunner = -1;
					canUseScanners = 1;
					castGunnerShadow = 0;
					commanding = 2;
					disableSoundAttenuation = 0;
					dontCreateAI = 0;
					ejectDeadGunner = 0;
					forceHideGunner = 0;
					forceNVG = 0;
					gun = "obsGun";
					gunBeg = "";
					gunEnd = "";
					gunnerAction = "RHS_M2A2_CommanderOut";
					gunnerCompartments = "Compartment1";
					gunnerDoor = "hatchC";
					gunnerFireAlsoInInternalCamera = 1;
					gunnerForceOptics = 1;
					gunnerGetInAction = "GetInHigh";
					gunnerGetOutAction = "GetOutHigh";
					gunnerHasFlares = 1;
					gunnerInAction = "RHS_M2A2_Commander";
					gunnerLeftHandAnimName = "";
					gunnerLeftLegAnimName = "";
					gunnerName = "Commander";
					gunnerOpticsColor[] = {0,0,0,1};
					gunnerOpticsEffect[] = {};
					gunnerOpticsModel = "\rhsusf\addons\rhsusf_a2port_armor\M2A2_Bradley\gunnerOptics_M2A2_2";
					gunnerOpticsShowCursor = 0;
					gunnerOutFireAlsoInInternalCamera = 1;
					gunnerOutForceOptics = 0;
					gunnerOutOpticsColor[] = {0,0,0,1};
					gunnerOutOpticsEffect[] = {};
					gunnerOutOpticsModel = "";
					gunnerOutOpticsShowCursor = 0;
					gunnerRightHandAnimName = "com_turret_control";
					gunnerRightLegAnimName = "";
					gunnerType = "";
					gunnerUsesPilotView = 0;
					hasGunner = 1;
					hideWeaponsGunner = 1;
					inGunnerMayFire = 1;
					initCamElev = 0;
					initElev = 0;
					initOutElev = 0;
					initOutTurn = 0;
					initTurn = 0;
					isCopilot = 0;
					isPersonTurret = 1;
					lockWhenDriverOut = 0;
					lockWhenVehicleSpeed = -1;
					LODOpticsIn = 0;
					LODTurnedIn = 1000;
					LODTurnedOut = -1;
					magazines[] = {"rhsusf_mag_L8A3_8"};
					maxCamElev = 90;
					maxElev = 5;
					maxHorizontalRotSpeed = 1.8;
					maxOutElev = 15;
					maxOutTurn = 90;
					maxTurn = 360;
					maxVerticalRotSpeed = 1.8;
					memoryPointGun = "gun_muzzle";
					memoryPointGunnerOptics = "commanderview";
					memoryPointGunnerOutOptics = "commanderview";
					memoryPointsGetInGunner = "pos commander";
					memoryPointsGetInGunnerDir = "pos commander dir";
					memoryPointsGetInGunnerPrecise = "";
					minCamElev = -90;
					minElev = -5;
					minOutElev = -10;
					minOutTurn = -45;
					minTurn = -360;
					missileBeg = "spice rakety";
					missileEnd = "konec rakety";
					outGunnerMayFire = 1;
					personTurretAction = "vehicle_turnout_1";
					playerPosition = 0;
					preciseGetInOut = 0;
					primary = 1;
					primaryGunner = 0;
					primaryObserver = 1;
					proxyIndex = 1;
					proxyType = "CPCommander";
					selectionFireAnim = "zasleh_1";
					showAllTargets = 0;
					showCrewAim = 0;
					showHMD = 0;
					slingLoadOperator = 0;
					soundElevation[] = {"",0.00316228,1};
					soundServo[] = {"A3\Sounds_F\vehicles\armor\APC\noises\servo_APC_comm",0.562341,1,30};
					soundServoVertical[] = {"A3\Sounds_F\vehicles\armor\APC\noises\servo_APC_comm",0.562341,1,30};
					stabilizedInAxes = 3;
					startEngine = 0;
					turretCanSee = 0;
					turretFollowFreeLook = 2;
					turretInfoType = "RHS_RscODS_ISU";
					usePip = 2;
					viewGunnerInExternal = 1;
					viewGunnerShadow = 1;
					viewGunnerShadowAmb = 0.5;
					viewGunnerShadowDiff = 0.05;
					weapons[] = {"rhsusf_weap_M257_8"};
					class Components{
						class VehicleSystemsDisplayManagerComponentLeft{
							componentType = "VehicleSystemsDisplayManager";
							defaultDisplay = "EmptyDisplay";
							left = 1;
							x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_X"",	(safezoneX + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
							y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
							class Components{
								class CrewDisplay{
									componentType = "CrewDisplayComponent";
								};
								class EmptyDisplay{
									componentType = "EmptyDisplayComponent";
								};
								class SensorDisplay{
									componentType = "SensorsDisplayComponent";
									range[] = {8000,4000,2000};
									resource = "RscCustomInfoSensors";
								};
								class MineDetectorDisplay{
									componentType = "MineDetectorDisplayComponent";
								};
								class MinimapDisplay{
									componentType = "MinimapDisplayComponent";
								};
								class SlingLoadDisplay{
									componentType = "SlingLoadDisplayComponent";
								};
								class UAVDisplay{
									componentType = "UAVFeedDisplayComponent";
								};
								class VehicleCommanderDisplay{
									componentType = "TransportFeedDisplayComponent";
									source = "Commander";
								};
								class VehicleDriverDisplay{
									componentType = "TransportFeedDisplayComponent";
									source = "Driver";
								};
							};
						};
						class VehicleSystemsDisplayManagerComponentRight{
							componentType = "VehicleSystemsDisplayManager";
							defaultDisplay = "EmptyDisplay";
							right = 1;
							x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_X"",	((safezoneX + safezoneW) - (		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))])";
							y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
							class Components{
								class CrewDisplay{
									componentType = "CrewDisplayComponent";
								};
								class EmptyDisplay{
									componentType = "EmptyDisplayComponent";
								};
								class SensorDisplay{
									componentType = "SensorsDisplayComponent";
									range[] = {8000,4000,2000};
									resource = "RscCustomInfoSensors";
								};
								class MineDetectorDisplay{
									componentType = "MineDetectorDisplayComponent";
								};
								class MinimapDisplay{
									componentType = "MinimapDisplayComponent";
								};
								class SlingLoadDisplay{
									componentType = "SlingLoadDisplayComponent";
								};
								class UAVDisplay{
									componentType = "UAVFeedDisplayComponent";
								};
								class VehicleCommanderDisplay{
									componentType = "TransportFeedDisplayComponent";
									source = "Commander";
								};
								class VehicleDriverDisplay{
									componentType = "TransportFeedDisplayComponent";
									source = "Driver";
								};
							};
						};
					};
					class GunClouds{
						class Table{
							class T0{
								color[] = {1,1,1,0};
								maxT = 0;
							};
						};
					};
					class GunFire{
						access = 0;
						cloudletAccY = 0;
						cloudletAlpha = 1;
						cloudletAnimPeriod = 1;
						cloudletColor[] = {1,1,1,0};
						cloudletDuration = 0.2;
						cloudletFadeIn = 0.01;
						cloudletFadeOut = 0.5;
						cloudletGrowUp = 0.2;
						cloudletMaxYSpeed = 100;
						cloudletMinYSpeed = -100;
						cloudletShape = "cloudletFire";
						cloudletSize = 1;
						deltaT = -3000;
						initT = 4500;
						interval = 0.01;
						size = 3;
						sourceSize = 0.5;
						timeToLive = 0;
						class Table{
							class T0{
								color[] = {0.82,0.95,0.93,0};
maxT = 0;
							};
							class T1{
								color[] = {0.75,0.77,0.9,0};
maxT = 200;
							};
							class T10{
								color[] = {0.62,0.29,0.03,0};
maxT = 2600;
							};
							class T11{
								color[] = {0.59,0.35,0.05,0};
maxT = 2650;
							};
							class T12{
								color[] = {0.75,0.37,0.03,0};
maxT = 2700;
							};
							class T13{
								color[] = {0.88,0.34,0.03,0};
maxT = 2750;
							};
							class T14{
								color[] = {0.91,0.5,0.17,0};
maxT = 2800;
							};
							class T15{
								color[] = {1,0.6,0.2,0};
maxT = 2850;
							};
							class T16{
								color[] = {1,0.71,0.3,0};
maxT = 2900;
							};
							class T17{
								color[] = {0.98,0.83,0.41,0};
maxT = 2950;
							};
							class T18{
								color[] = {0.98,0.91,0.54,0};
maxT = 3000;
							};
							class T19{
								color[] = {0.98,0.99,0.6,0};
maxT = 3100;
							};
							class T2{
								color[] = {0.56,0.62,0.67,0};
maxT = 400;
							};
							class T20{
								color[] = {0.96,0.99,0.72,0};
maxT = 3300;
							};
							class T21{
								color[] = {1,0.98,0.91,0};
maxT = 3600;
							};
							class T22{
								color[] = {1,1,1,0};
maxT = 4200;
							};
							class T3{
								color[] = {0.39,0.46,0.47,0};
maxT = 600;
							};
							class T4{
								color[] = {0.24,0.31,0.31,0};
maxT = 800;
							};
							class T5{
								color[] = {0.23,0.31,0.29,0};
maxT = 1000;
							};
							class T6{
								color[] = {0.21,0.29,0.27,0};
maxT = 1500;
							};
							class T7{
								color[] = {0.19,0.23,0.21,0};
maxT = 2000;
							};
							class T8{
								color[] = {0.22,0.19,0.1,0};
maxT = 2300;
							};
							class T9{
								color[] = {0.35,0.2,0.02,0};
maxT = 2500;
							};
						};
					};
					class HitPoints{
						class Hit_Optics_Cdr_Peri{
							armor = -40;
							armorComponent = "Hit_Optics_Cdr_Peri";
							explosionShielding = 0;
							name = "";
							passThrough = 0;
							visual = "vis_optics_Cdr_Peri";
						};
						class HitGunCom{
							armor = 0.3;
							explosionShielding = 0.001;
							isGun = 1;
							material = -1;
							minimalHit = 0.03;
							name = "zbranVelitele";
							passThrough = 0;
							radius = 0.25;
							visual = "zbranVelitele";
						};
						class HitTurretCom{
							armor = 0.3;
							explosionShielding = 0.001;
							isTurret = 1;
							material = -1;
							minimalHit = 0.03;
							name = "vezVelitele";
							passThrough = 0;
							radius = 0.25;
							visual = "vezVelitele";
						};
					};
					class MGunClouds{
						class Table{
							access = 0;
							cloudletAccY = 0;
							cloudletAlpha = 0.3;
							cloudletAnimPeriod = 1;
							cloudletColor[] = {1,1,1,0};
							cloudletDuration = 0.05;
							cloudletFadeIn = 0;
							cloudletFadeOut = 0.1;
							cloudletGrowUp = 0.05;
							cloudletMaxYSpeed = 100;
							cloudletMinYSpeed = -100;
							cloudletShape = "cloudletClouds";
							cloudletSize = 1;
							deltaT = 0;
							initT = 0;
							interval = 0.02;
							size = 0.3;
							sourceSize = 0.02;
							timeToLive = 0;
							class T0{
								color[] = {1,1,1,0};
								maxT = 0;
							};
						};
					};
					class OpticsIn{
						class VisionBlock{
							gunnerOpticsEffect[] = {};
							gunnerOpticsModel = "\rhsusf\addons\rhsusf_optics\data\rhsusf_vision_block";
							hitPoint = "Hit_Optics_Cdr_Peri";
							initAngleX = 0;
							initAngleY = 0;
							initfov = 0.7;
							maxAngleX = 30;
							maxAngleY = 100;
							maxFov = 0.7;
							minAngleX = -30;
							minAngleY = -100;
							minFov = 0.7;
							opticsDisplayName = "periscope";
							visionMode[] = {"Normal","NVG"};
						};
						class Wide{
							camPos = "gunnerview";
							gunnerOpticsEffect[] = {};
							gunnerOpticsModel = "\rhsusf\addons\rhsusf_optics\data\rhsusf_ISU";
							hitPoint = "Hit_Optics_Gnr";
							initAngleX = 0;
							initAngleY = 0;
							initFov = 0.175;
							maxAngleX = 30;
							maxAngleY = 100;
							maxFov = 0.175;
							minAngleX = -30;
							minAngleY = -100;
							minFov = 0.175;
							opticsDisplayName = "WIDE";
							thermalMode[] = {4};
							visionMode[] = {"Normal","Ti"};
						};
						class Narrow{
							camPos = "gunnerview";
							gunnerOpticsEffect[] = {};
							gunnerOpticsModel = "\rhsusf\addons\rhsusf_optics\data\rhsusf_ISU";
							hitPoint = "Hit_Optics_Gnr";
							initAngleX = 0;
							initAngleY = 0;
							initFov = 0.0583333;
							maxAngleX = 30;
							maxAngleY = 100;
							maxFov = 0.0583333;
							minAngleX = -30;
							minAngleY = -100;
							minFov = 0.0583333;
							opticsDisplayName = "NARROW";
							thermalMode[] = {4};
							visionMode[] = {"Normal","Ti"};
						};
					};
					class Reflectors{
						class cabin{
							ambient[] = {5,5,5};
							blinking = 0;
							color[] = {800,900,650};
							coneFadeCoef = 1;
							dayLight = 1;
							direction = "cabin_light_dir";
							flareMaxDistance = 5;
							flareSize = 1;
							hitpoint = "cabin_light";
							innerAngle = 90;
							intensity = 0.3;
							outerAngle = 165;
							position = "cabin_light";
							selection = "cabin_light";
							size = 1;
							useFlare = 1;
							class Attenuation{
								constant = 0;
								hardLimitEnd = 1.5;
								hardLimitStart = 1;
								linear = 1;
								quadratic = 50;
								start = 0;
							};
						};
						class cargo_light_1{
							ambient[] = {5,5,5};
							blinking = 0;
							color[] = {800,900,650};
							coneFadeCoef = 0.1;
							dayLight = 1;
							direction = "cargo_light_1_dir";
							flareMaxDistance = 5;
							flareSize = 1;
							hitpoint = "cargo_light_1";
							innerAngle = 140;
							intensity = 3;
							outerAngle = 175;
							position = "cargo_light_1";
							selection = "cargo_light_1";
							size = 1;
							useFlare = 0;
							class Attenuation{
								constant = 0;
								hardLimitEnd = 2;
								hardLimitStart = 1.4;
								linear = 1;
								quadratic = 70;
								start = 0;
							};
						};
					};
					class TurnIn{
						turnOffset = 0;
					};
					class TurnOut{
						turnOffset = 0;
					};
					class Turrets{
						
					};
					class TurretSpec{
						showHeadPhones = 0;
					};
					class ViewGunner{
						initAngleX = -5;
						initAngleY = 0;
						initFov = 0.9;
						maxAngleX = 85;
						maxAngleY = 150;
						maxFov = 1.25;
						maxMoveX = 0.075;
						maxMoveY = 0.075;
						maxMoveZ = 0.1;
						minAngleX = -65;
						minAngleY = -150;
						minFov = 0.25;
						minMoveX = -0.075;
						minMoveY = -0.075;
						minMoveZ = -0.075;
						speedZoomMaxFOV = 0;
						speedZoomMaxSpeed = 1e+10;
					};
					class ViewOptics{
						initAngleX = 0;
						initAngleY = 0;
						initFov = 0.155;
						maxAngleX = 30;
						maxAngleY = 100;
						maxFov = 0.155;
						minAngleX = -30;
						minAngleY = -100;
						minFov = 0.067;
					};
				};
			};
			class TurretSpec{
				showHeadPhones = 0;
			};
			class ViewGunner{
				continuous = 0;
				initAngleX = -5;
				initAngleY = 0;
				initFov = 0.9;
				maxAngleX = 85;
				maxAngleY = 150;
				maxFov = 1.25;
				maxMoveX = 0.075;
				maxMoveY = 0.075;
				maxMoveZ = 0.1;
				minAngleX = -65;
				minAngleY = -150;
				minFov = 0.25;
				minMoveX = -0.075;
				minMoveY = -0.075;
				minMoveZ = -0.075;
				speedZoomMaxFOV = 0;
				speedZoomMaxSpeed = 1e+10;
			};
			class ViewOptics{
				initAngleX = 0;
				initAngleY = 0;
				initFov = 0.3;
				maxAngleX = 30;
				maxAngleY = 100;
				maxFov = 0.35;
				maxMoveX = 0;
				maxMoveY = 0;
				maxMoveZ = 0;
				minAngleX = -30;
				minAngleY = -100;
				minFov = 0.07;
				minMoveX = 0;
				minMoveY = 0;
				minMoveZ = 0;
				speedZoomMaxFOV = 0;
				speedZoomMaxSpeed = 1e+10;
			};
		};
	};
	};
	class RHS_M2A3_BUSKIII_wd;
	class SHG_M6A2_Shorad: RHS_M2A3_BUSKIII_wd{
		displayName = "M-SHORAD II";
		class Components{
			class AITankSteeringComponent{
				allowCollisionAvoidance = 1;
				allowDrifting = 0;
				allowOvertaking = 1;
				allowTurnAroundInPoint = 1;
				commandTurnFactor = 2;
				convoyPIDWeights[] = {1,0,0};
				differenceAngleCoef = 1;
				doPredictForward = 1;
				doRemapSpeed = 0;
				forwardAngleCoef = 0.7;
				maxWheelAngleDiff = 0.2616;
				minSpeedToKeep = 0.01;
				predictForwardMaxSpeed = 15;
				predictForwardRange[] = {1,20};
				remapSpeedRange[] = {30,70};
				remapSpeedScalar[] = {1,0.35};
				speedPIDWeights[] = {0.7,0.2,0};
				speedPredictionMethod = 3;
				steerAheadSaturation[] = {0.01,0.4};
				steeringAngleCoef = 1;
				steeringPIDWeights[] = {2.9,0.1,0.2};
				stuckMaxTime = 3;
				wheelAngleCoef = 0.7;
			};
			class SensorsManagerComponent{
				class Components{
					class ActiveRadarSensorComponent{
						aimDown = 0;
						allowsMarking = 1;
						angleRangeHorizontal = 360;
						angleRangeVertical = 360;
						animDirection = "mainGun";
						color[] = {0,1,1,1};
						componentType = "ActiveRadarSensorComponent";
						groundNoiseDistanceCoef = -1;
						maxFogSeeThrough = -1;
						maxGroundNoiseDistance = -1;
						maxSpeedThreshold = 20;
						maxTrackableATL = 4000;
						maxTrackableSpeed = "1e10";
						minSpeedThreshold = 6;
						minTrackableATL = "-1e10";
						minTrackableSpeed = "-1e10";
						typeRecognitionDistance = 6000;
						class AirTarget{
							maxRange = 8000;
							minRange = 8000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
						class GroundTarget{
							maxRange = 1000;
							minRange = 1000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
					};
					class PassiveRadarSensorComponent{
						aimDown = 0;
						allowsMarking = 0;
						angleRangeHorizontal = 360;
						angleRangeVertical = 360;
						animDirection = "mainGun";
						color[] = {0.5,1,0.5,0.5};
						componentType = "PassiveRadarSensorComponent";
						groundNoiseDistanceCoef = -1;
						maxGroundNoiseDistance = -1;
						maxSpeedThreshold = 0;
						maxTrackableATL = 1e+10;
						maxTrackableSpeed = 1e+10;
						minSpeedThreshold = 0;
						minTrackableATL = -1e+10;
						minTrackableSpeed = -1e+10;
						typeRecognitionDistance = 12000;
						class AirTarget{
							maxRange = 16000;
							minRange = 16000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
						class GroundTarget{
							maxRange = 6000;
							minRange = 6000;
							objectDistanceLimitCoef = -1;
							viewDistanceLimitCoef = -1;
						};
					};
				};
			};
			class TransportCountermeasuresComponent{
			};
			class VehicleSystemsDisplayManagerComponentLeft{
				componentType = "VehicleSystemsDisplayManager";
				defaultDisplay = "EmptyDisplay";
				left = 1;
				x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_X"",	(safezoneX + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
				y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
				class Components{
					class CrewDisplay{
						componentType = "CrewDisplayComponent";
					};
					class EmptyDisplay{
						componentType = "EmptyDisplayComponent";
					};
					class MineDetectorDisplay{
						componentType = "MineDetectorDisplayComponent";
					};
					class MinimapDisplay{
						componentType = "MinimapDisplayComponent";
					};
					class SlingLoadDisplay{
						componentType = "SlingLoadDisplayComponent";
					};
					class UAVDisplay{
						componentType = "UAVFeedDisplayComponent";
					};
					class VehicleCommanderDisplay{
						componentType = "TransportFeedDisplayComponent";
						source = "Commander";
					};
					class VehiclePrimaryGunnerDisplay{
						componentType = "TransportFeedDisplayComponent";
						source = "PrimaryGunner";
					};
				};
			};
			class VehicleSystemsDisplayManagerComponentRight{
				componentType = "VehicleSystemsDisplayManager";
				defaultDisplay = "EmptyDisplay";
				right = 1;
				x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_X"",	((safezoneX + safezoneW) - (		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))])";
				y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
				class Components{
					class CrewDisplay{
						componentType = "CrewDisplayComponent";
					};
					class EmptyDisplay{
						componentType = "EmptyDisplayComponent";
					};
					class MineDetectorDisplay{
						componentType = "MineDetectorDisplayComponent";
					};
					class MinimapDisplay{
						componentType = "MinimapDisplayComponent";
					};
					class SlingLoadDisplay{
						componentType = "SlingLoadDisplayComponent";
					};
					class UAVDisplay{
						componentType = "UAVFeedDisplayComponent";
					};
					class VehicleCommanderDisplay{
						componentType = "TransportFeedDisplayComponent";
						source = "Commander";
					};
					class VehiclePrimaryGunnerDisplay{
						componentType = "TransportFeedDisplayComponent";
						source = "PrimaryGunner";
					};
				};
			};
		};
		class Turrets{
			class MainTurret{
				ace_fcs_DistanceInterval = 5;
				ace_fcs_Enabled = 0;
				ace_fcs_MaxDistance = 5500;
				ace_fcs_MinDistance = 200;
				aggregateReflectors[] = {};
				allowLauncherIn = 0;
				allowLauncherOut = 0;
				allowTabLock = 0;
				animationSourceBody = "mainTurret";
				animationSourceCamElev = "camElev";
				animationSourceGun = "mainGun";
				animationSourceHatch = "hatchGunner";
				animationSourceStickX = "turret_control_x";
				animationSourceStickY = "turret_control_y";
				armorLights = 0.4;
				body = "mainTurret";
				canEject = 1;
				canHideGunner = -1;
				canUseScanners = 1;
				castGunnerShadow = 0;
				commanding = 1;
				disableSoundAttenuation = 0;
				discreteDistance[] = {0,200,400,600,800,1000,1200,1400,1600,1800,2000,2200,2400,2600,2800,3000};
				discreteDistanceInitIndex = 2;
				dontCreateAI = 0;
				ejectDeadGunner = 0;
				forceHideGunner = 0;
				forceNVG = 0;
				gun = "mainGun";
				gunBeg = "Usti hlavne";
				gunEnd = "Konec hlavne";
				gunnerAction = "RHS_M2A2_GunnerOut";
				gunnerCompartments = "Compartment1";
				gunnerDoor = "hatchG";
				gunnerFireAlsoInInternalCamera = 1;
				gunnerForceOptics = 1;
				gunnerGetInAction = "GetInHigh";
				gunnerGetOutAction = "GetOutHigh";
				gunnerHasFlares = 0;
				gunnerInAction = "RHS_M2A2_Gunner";
				gunnerLeftHandAnimName = "turret_control";
				gunnerLeftLegAnimName = "";
				gunnerName = "Gunner";
				gunnerOpticsColor[] = {0,0,0,1};
				gunnerOpticsEffect[] = {};
				gunnerOpticsModel = "\A3\weapons_f\reticle\optics_empty";
				gunnerOpticsShowCursor = 0;
				gunnerOutFireAlsoInInternalCamera = 1;
				gunnerOutForceOptics = 0;
				gunnerOutOpticsColor[] = {0,0,0,1};
				gunnerOutOpticsEffect[] = {};
				gunnerOutOpticsModel = "";
				gunnerOutOpticsShowCursor = 0;
				gunnerRightHandAnimName = "";
				gunnerRightLegAnimName = "";
				gunnerType = "";
				gunnerUsesPilotView = 0;
				hasGunner = 1;
				hideWeaponsGunner = 1;
				inGunnerMayFire = 1;
				initCamElev = 0;
				initElev = 0;
				initOutElev = 0;
				initOutTurn = 0;
				initTurn = 0;
				isCopilot = 0;
				lockWhenDriverOut = 1;
				lockWhenVehicleSpeed = -1;
				LODOpticsIn = 0;
				LODTurnedIn = 1000;
				LODTurnedOut = -1;
				magazines[] = {"rhs_mag_1100Rnd_762x51_M240","rhs_mag_1100Rnd_762x51_M240","200rnd_XM1211_HEP","200rnd_XM1211_HEP","200rnd_XM1211_HEP","200rnd_XM1211_HEP","100rnd_XM1198_HEDP","100rnd_XM1198_HEDP","100rnd_XM1198_HEDP","Rhs_mag_4Rnd_stinger","Rhs_mag_4Rnd_stinger","Rhs_mag_4Rnd_stinger","rhs_laserfcsmag"};
				maxCamElev = 90;
				maxElev = 57;
				maxhorizontalrotspeed = 1.04;
				maxOutElev = 20;
				maxOutTurn = 60;
				maxTurn = 360;
				maxverticalrotspeed = 1.04;
				memoryPointGun = "kulas";
				memoryPointGunnerOptics = "gunnerview";
				memoryPointGunnerOutOptics = "";
				memoryPointsGetInGunner = "pos gunner";
				memoryPointsGetInGunnerDir = "pos gunner dir";
				memoryPointsGetInGunnerPrecise = "";
				minCamElev = -90;
				minElev = -9;
				minOutElev = -4;
				minOutTurn = -60;
				minTurn = -360;
				missileBeg = "spice rakety";
				missileEnd = "konec rakety";
				outGunnerMayFire = 0;
				playerPosition = 0;
				preciseGetInOut = 0;
				primary = 1;
				primaryGunner = 1;
				primaryObserver = 0;
				proxyIndex = 1;
				proxyType = "CPGunner";
				selectionFireAnim = "zasleh2";
				showAllTargets = 0;
				showCrewAim = 0;
				showHMD = 0;
				slingLoadOperator = 0;
				soundElevation[] = {"",0.00316228,1};
				soundServo[] = {"A3\Sounds_F\vehicles\armor\APC\noises\servo_APC_gunner",0.562341,1,30};
				soundServoVertical[] = {"A3\Sounds_F\vehicles\armor\APC\noises\servo_APC_gunner_vertical",0.562341,1,30};
				stabilizedinaxes = 3;
				startengine = 0;
				turretCanSee = 0;
				turretFollowFreeLook = 0;
				turretInfoType = "RHS_RscIBAS";
				usePip = 2;
				viewGunnerInExternal = 1;
				viewGunnerShadow = 1;
				viewGunnerShadowAmb = 0.5;
				viewGunnerShadowDiff = 0.05;
				weapons[] = {"SHG_weap_M230LF","SHG_weap_m230_bradley_coax","SHG_weap_stinger_Launcher","rhs_weap_fcs_ammo"};
				class Components{
					class VehicleSystemsDisplayManagerComponentLeft{
						componentType = "VehicleSystemsDisplayManager";
						defaultDisplay = "EmptyDisplay";
						left = 1;
						x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_X"",	(safezoneX + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
						y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
						class Components{
							class CrewDisplay{
								componentType = "CrewDisplayComponent";
							};
							class EmptyDisplay{
								componentType = "EmptyDisplayComponent";
							};
							class SensorDisplay{
								componentType = "SensorsDisplayComponent";
								range[] = {8000,4000,2000};
								resource = "RscCustomInfoSensors";
							};
							class MineDetectorDisplay{
								componentType = "MineDetectorDisplayComponent";
							};
							class MinimapDisplay{
								componentType = "MinimapDisplayComponent";
							};
							class SlingLoadDisplay{
								componentType = "SlingLoadDisplayComponent";
							};
							class UAVDisplay{
								componentType = "UAVFeedDisplayComponent";
							};
							class VehicleCommanderDisplay{
								componentType = "TransportFeedDisplayComponent";
								source = "Commander";
							};
							class VehicleDriverDisplay{
								componentType = "TransportFeedDisplayComponent";
								source = "Driver";
							};
						};
					};
					class VehicleSystemsDisplayManagerComponentRight{
						componentType = "VehicleSystemsDisplayManager";
						defaultDisplay = "EmptyDisplay";
						right = 1;
						x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_X"",	((safezoneX + safezoneW) - (		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))])";
						y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
						class Components{
							class CrewDisplay{
								componentType = "CrewDisplayComponent";
							};
							class EmptyDisplay{
								componentType = "EmptyDisplayComponent";
							};
							class SensorDisplay{
								componentType = "SensorsDisplayComponent";
								range[] = {8000,4000,2000};
								resource = "RscCustomInfoSensors";
							};
							class MineDetectorDisplay{
								componentType = "MineDetectorDisplayComponent";
							};
							class MinimapDisplay{
								componentType = "MinimapDisplayComponent";
							};
							class SlingLoadDisplay{
								componentType = "SlingLoadDisplayComponent";
							};
							class UAVDisplay{
								componentType = "UAVFeedDisplayComponent";
							};
							class VehicleCommanderDisplay{
								componentType = "TransportFeedDisplayComponent";
								source = "Commander";
							};
							class VehicleDriverDisplay{
								componentType = "TransportFeedDisplayComponent";
								source = "Driver";
							};
						};
					};
				};
				class GunClouds{
					access = 0;
					cloudletAccY = 0.4;
					cloudletAlpha = 1;
					cloudletAnimPeriod = 1;
					cloudletColor[] = {1,1,1,0};
					cloudletDuration = 0.3;
					cloudletFadeIn = 0.01;
					cloudletFadeOut = 1;
					cloudletGrowUp = 1;
					cloudletMaxYSpeed = 0.8;
					cloudletMinYSpeed = 0.2;
					cloudletShape = "cloudletClouds";
					cloudletSize = 1;
					deltaT = 0;
					initT = 0;
					interval = 0.05;
					size = 3;
					sourceSize = 0.5;
					timeToLive = 0;
					class Table{
						class T0{
							color[] = {1,1,1,0};
							maxT = 0;
						};
					};
				};
				class GunFire{
					access = 0;
					cloudletAccY = 0;
					cloudletAlpha = 1;
					cloudletAnimPeriod = 1;
					cloudletColor[] = {1,1,1,0};
					cloudletDuration = 0.2;
					cloudletFadeIn = 0.01;
					cloudletFadeOut = 0.5;
					cloudletGrowUp = 0.2;
					cloudletMaxYSpeed = 100;
					cloudletMinYSpeed = -100;
					cloudletShape = "cloudletFire";
					cloudletSize = 1;
					deltaT = -3000;
					initT = 4500;
					interval = 0.01;
					size = 3;
					sourceSize = 0.5;
					timeToLive = 0;
					class Table{
						class T0{
							color[] = {0.82,0.95,0.93,0};
							maxT = 0;
						};
						class T1{
							color[] = {0.75,0.77,0.9,0};
							maxT = 200;
						};
						class T10{
							color[] = {0.62,0.29,0.03,0};
							maxT = 2600;
						};
						class T11{
							color[] = {0.59,0.35,0.05,0};
							maxT = 2650;
						};
						class T12{
							color[] = {0.75,0.37,0.03,0};
							maxT = 2700;
						};
						class T13{
							color[] = {0.88,0.34,0.03,0};
							maxT = 2750;
						};
						class T14{
							color[] = {0.91,0.5,0.17,0};
							maxT = 2800;
						};
						class T15{
							color[] = {1,0.6,0.2,0};
							maxT = 2850;
						};
						class T16{
							color[] = {1,0.71,0.3,0};
							maxT = 2900;
						};
						class T17{
							color[] = {0.98,0.83,0.41,0};
							maxT = 2950;
						};
						class T18{
							color[] = {0.98,0.91,0.54,0};
							maxT = 3000;
						};
						class T19{
							color[] = {0.98,0.99,0.6,0};
							maxT = 3100;
						};
						class T2{
							color[] = {0.56,0.62,0.67,0};
							maxT = 400;
						};
						class T20{
							color[] = {0.96,0.99,0.72,0};
							maxT = 3300;
						};
						class T21{
							color[] = {1,0.98,0.91,0};
							maxT = 3600;
						};
						class T22{
							color[] = {1,1,1,0};
							maxT = 4200;
						};
						class T3{
							color[] = {0.39,0.46,0.47,0};
							maxT = 600;
						};
						class T4{
							color[] = {0.24,0.31,0.31,0};
							maxT = 800;
						};
						class T5{
							color[] = {0.23,0.31,0.29,0};
							maxT = 1000;
						};
						class T6{
							color[] = {0.21,0.29,0.27,0};
							maxT = 1500;
						};
						class T7{
							color[] = {0.19,0.23,0.21,0};
							maxT = 2000;
						};
						class T8{
							color[] = {0.22,0.19,0.1,0};
							maxT = 2300;
							};
						class T9{
							color[] = {0.35,0.2,0.02,0};
							maxT = 2500;
						};
					};
				};
				class HitPoints{
					class Hit_Optics_Gnr{
						armor = -40;
						armorComponent = "Hit_Optics_Gnr";
						explosionShielding = 0;
						name = "";
						passThrough = 0;
						visual = "vis_optics_Gnr";
					};
					class HitGun{
						armor = -60;
						armorComponent = "Hit_Gun";
						explosionShielding = 0.001;
						isGun = 1;
						minimalHit = -0.3;
						name = "zbran";
						passThrough = 0;
						radius = 0.1;
						visual = "-";
					};
					class HitTurret{
						armor = -60;
						armorComponent = "Hit_Turret";
						explosionShielding = 0.001;
						isTurret = 1;
						minimalHit = -0.3;
						name = "vez";
						passThrough = 0;
						radius = 0.08;
						visual = "vez";
					};
				};
				class MGunClouds{
					access = 0;
					cloudletAccY = 0;
					cloudletAlpha = 0.3;
					cloudletAnimPeriod = 1;
					cloudletColor[] = {1,1,1,0};
					cloudletDuration = 0.05;
					cloudletFadeIn = 0;
					cloudletFadeOut = 0.1;
					cloudletGrowUp = 0.05;
					cloudletMaxYSpeed = 100;
					cloudletMinYSpeed = -100;
					cloudletShape = "cloudletClouds";
					cloudletSize = 1;
					deltaT = 0;
					initT = 0;
					interval = 0.02;
					size = 0.3;
					sourceSize = 0.02;
					timeToLive = 0;
					class Table{
						class T0{
							color[] = {1,1,1,0};
							maxT = 0;
						};
					};
				};
				class OpticsIn{
					class Wide{
						gunnerOpticsEffect[] = {};
						gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_4x";
						hitPoint = "Hit_Optics_Gnr";
						initAngleX = 0;
						initAngleY = 0;
						initFov = 0.175;
						maxAngleX = 30;
						maxAngleY = 100;
						maxFov = 0.175;
						minAngleX = -30;
						minAngleY = -100;
						minFov = 0.175;
						opticsDisplayName = "60HZ";
						thermalMode[] = {0,1};
						visionMode[] = {"Normal","Ti"};
					};
					class Narrow{
						gunnerOpticsEffect[] = {};
						gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_12x";
						hitPoint = "Hit_Optics_Gnr";
						initAngleX = 0;
						initAngleY = 0;
						initFov = 0.0583333;
						maxAngleX = 30;
						maxAngleY = 100;
						maxFov = 0.0583333;
						minAngleX = -30;
						minAngleY = -100;
						minFov = 0.0583333;
						opticsDisplayName = "60HZ";
						thermalMode[] = {0,1};
						visionMode[] = {"Normal","Ti"};
					};
					class Narrow2x{
						gunnerOpticsEffect[] = {};
						gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_12x";
						hitPoint = "Hit_Optics_Gnr";
						initAngleX = 0;
						initAngleY = 0;
						initFov = 0.0291667;
						maxAngleX = 30;
						maxAngleY = 100;
						maxFov = 0.0291667;
						minAngleX = -30;
						minAngleY = -100;
						minFov = 0.0291667;
						opticsDisplayName = "60HZ 2X";
						thermalMode[] = {0,1};
						visionMode[] = {"Normal","Ti"};
					};
					class Narrow4x{
						gunnerOpticsEffect[] = {};
						gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_12x";
						hitPoint = "Hit_Optics_Gnr";
						initAngleX = 0;
						initAngleY = 0;
						initFov = 0.0145833;
						maxAngleX = 30;
						maxAngleY = 100;
						maxFov = 0.0145833;
						minAngleX = -30;
						minAngleY = -100;
						minFov = 0.0145833;
						opticsDisplayName = "60HZ 4X";
						thermalMode[] = {0,1};
						visionMode[] = {"Normal","Ti"};
					};
				};
				class Reflectors{
				};
				class TurnIn{
					turnOffset = 0;
				};
				class TurnOut{
					turnOffset = 0;
				};
				class Turrets{
					class CommanderOptics{
						ace_fcs_DistanceInterval = 5;
						ace_fcs_Enabled = 0;
						ace_fcs_MaxDistance = 5500;
						ace_fcs_MinDistance = 200;
						aggregateReflectors[] = {};
						allowLauncherIn = 0;
						allowLauncherOut = 0;
						allowTabLock = 0;
						animationSourceBody = "obsTurret";
						animationSourceCamElev = "camElev";
						animationSourceGun = "obsGun";
						animationSourceHatch = "hatchCommander";
						animationSourceStickX = "com_turret_control_x";
						animationSourceStickY = "com_turret_control_y";
						armorLights = 0.4;
						body = "obsTurret";
						canEject = 1;
						canHideGunner = -1;
						canUseScanners = 1;
						castGunnerShadow = 0;
						commanding = 2;
						disableSoundAttenuation = 0;
						dontCreateAI = 0;
						ejectDeadGunner = 0;
						forceHideGunner = 0;
						forceNVG = 0;
						gun = "obsGun";
						gunBeg = "";
						gunEnd = "";
						gunnerAction = "RHS_M2A2_CommanderOut";
						gunnerCompartments = "Compartment1";
						gunnerDoor = "hatchC";
						gunnerFireAlsoInInternalCamera = 1;
						gunnerForceOptics = 1;
						gunnerGetInAction = "GetInHigh";
						gunnerGetOutAction = "GetOutHigh";
						gunnerHasFlares = 1;
						gunnerInAction = "RHS_M2A3_Commander";
						gunnerLeftHandAnimName = "";
						gunnerLeftLegAnimName = "";
						gunnerName = "Commander";
						gunnerOpticsColor[] = {0,0,0,1};
						gunnerOpticsEffect[] = {};
						gunnerOpticsModel = "\rhsusf\addons\rhsusf_a2port_armor\M2A2_Bradley\comTI_M2A2";
						gunnerOpticsShowCursor = 0;
						gunnerOutFireAlsoInInternalCamera = 1;
						gunnerOutForceOptics = 0;
						gunnerOutOpticsColor[] = {0,0,0,1};
						gunnerOutOpticsEffect[] = {};
						gunnerOutOpticsModel = "";
						gunnerOutOpticsShowCursor = 0;
						gunnerRightHandAnimName = "com_turret_control";
						gunnerRightLegAnimName = "";
						gunnerType = "";
						gunnerUsesPilotView = 0;
						hasGunner = 1;
						hideWeaponsGunner = 1;
						inGunnerMayFire = 1;
						initCamElev = 0;
						initElev = 0;
						initOutElev = 0;
						initOutTurn = 0;
						initTurn = 0;
						isCopilot = 0;
						isPersonTurret = 0;
						lockWhenDriverOut = 0;
						lockWhenVehicleSpeed = -1;
						LODOpticsIn = 0;
						LODTurnedIn = 1000;
						LODTurnedOut = -1;
						magazines[] = {"rhsusf_mag_L8A3_8","rhsusf_mag_duke"};
						maxCamElev = 90;
						maxElev = 60;
						maxHorizontalRotSpeed = 1.8;
						maxOutElev = 15;
						maxOutTurn = 90;
						maxTurn = 360;
						maxVerticalRotSpeed = 1.8;
						memoryPointGun = "gun_muzzle";
						memoryPointGunnerOptics = "commanderview";
						memoryPointGunnerOutOptics = "commanderview";
						memoryPointsGetInGunner = "pos commander";
						memoryPointsGetInGunnerDir = "pos commander dir";
						memoryPointsGetInGunnerPrecise = "";
						minCamElev = -90;
						minElev = -22;
						minOutElev = -10;
						minOutTurn = -45;
						minTurn = -360;
						missileBeg = "spice rakety";
						missileEnd = "konec rakety";
						outGunnerMayFire = 1;
						personTurretAction = "vehicle_turnout_1";
						playerPosition = 0;
						preciseGetInOut = 0;
						primary = 1;
						primaryGunner = 0;
						primaryObserver = 1;
						proxyIndex = 1;
						proxyType = "CPCommander";
						selectionFireAnim = "zasleh_1";
						showAllTargets = 0;
						showCrewAim = 0;
						showHMD = 0;
						slingLoadOperator = 0;
						soundElevation[] = {"",0.00316228,1};
						soundServo[] = {"A3\Sounds_F\vehicles\armor\APC\noises\servo_APC_comm",0.562341,1,30};
						soundServoVertical[] = {"A3\Sounds_F\vehicles\armor\APC\noises\servo_APC_comm",0.562341,1,30};
						stabilizedInAxes = "StabilizedInAxesBoth";
						startEngine = 0;
						turretCanSee = 0;
						turretFollowFreeLook = 2;
						turretInfoType = "RHS_RscCIV";
						usePip = 2;
						viewGunnerInExternal = 1;
						viewGunnerShadow = 1;
						viewGunnerShadowAmb = 0.5;
						viewGunnerShadowDiff = 0.05;
						weapons[] = {"rhsusf_weap_M257_8","rhsusf_weap_duke"};
						class Components{
							class VehicleSystemsDisplayManagerComponentLeft{
								componentType = "VehicleSystemsDisplayManager";
								defaultDisplay = "EmptyDisplay";
								left = 1;
								x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_X"",	(safezoneX + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
								y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFOLEFT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
								class Components{
									class CrewDisplay{
										componentType = "CrewDisplayComponent";
									};
									class EmptyDisplay{
										componentType = "EmptyDisplayComponent";
									};
									class SensorDisplay{
										componentType = "SensorsDisplayComponent";
										range[] = {8000,4000,2000};
										resource = "RscCustomInfoSensors";
									};
									class MineDetectorDisplay{
										componentType = "MineDetectorDisplayComponent";
									};
									class MinimapDisplay{
										componentType = "MinimapDisplayComponent";
									};
									class SlingLoadDisplay{
										componentType = "SlingLoadDisplayComponent";
									};
									class UAVDisplay{
										componentType = "UAVFeedDisplayComponent";
									};
									class VehicleCommanderDisplay{
										componentType = "TransportFeedDisplayComponent";
										source = "Commander";
									};
									class VehicleDriverDisplay{
										componentType = "TransportFeedDisplayComponent";
										source = "Driver";
									};
								};
							};
							class VehicleSystemsDisplayManagerComponentRight{
								componentType = "VehicleSystemsDisplayManager";
								defaultDisplay = "EmptyDisplay";
								right = 1;
								x = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_X"",	((safezoneX + safezoneW) - (		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) + 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))])";
								y = "(profilenamespace getvariable [""IGUI_GRID_CUSTOMINFORIGHT_Y"",	(safezoneY + safezoneH - 21 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
								class Components{
									class CrewDisplay{
										componentType = "CrewDisplayComponent";
									};
									class EmptyDisplay{
										componentType = "EmptyDisplayComponent";
									};
									class SensorDisplay{
										componentType = "SensorsDisplayComponent";
										range[] = {8000,4000,2000};
										resource = "RscCustomInfoSensors";
									};
									class MineDetectorDisplay{
										componentType = "MineDetectorDisplayComponent";
									};
									class MinimapDisplay{
										componentType = "MinimapDisplayComponent";
									};
									class SlingLoadDisplay{
										componentType = "SlingLoadDisplayComponent";
									};
									class UAVDisplay{
										componentType = "UAVFeedDisplayComponent";
									};
									class VehicleCommanderDisplay{
										componentType = "TransportFeedDisplayComponent";
										source = "Commander";
									};
									class VehicleDriverDisplay{
										componentType = "TransportFeedDisplayComponent";
										source = "Driver";
									};
								};
							};
						};
						class GunClouds{
							access = 0;
							cloudletAccY = 0.4;
							cloudletAlpha = 1;
							cloudletAnimPeriod = 1;
							cloudletColor[] = {1,1,1,0};
							cloudletDuration = 0.3;
							cloudletFadeIn = 0.01;
							cloudletFadeOut = 1;
							cloudletGrowUp = 1;
							cloudletMaxYSpeed = 0.8;
							cloudletMinYSpeed = 0.2;
							cloudletShape = "cloudletClouds";
							cloudletSize = 1;
							deltaT = 0;
							initT = 0;
							interval = 0.05;
							size = 3;
							sourceSize = 0.5;
							timeToLive = 0;
							class Table{
								class T0{
									color[] = {1,1,1,0};
									maxT = 0;
								};
							};
						};
						class GunFire{
							access = 0;
							cloudletAccY = 0;
							cloudletAlpha = 1;
							cloudletAnimPeriod = 1;
							cloudletColor[] = {1,1,1,0};
							cloudletDuration = 0.2;
							cloudletFadeIn = 0.01;
							cloudletFadeOut = 0.5;
							cloudletGrowUp = 0.2;
							cloudletMaxYSpeed = 100;
							cloudletMinYSpeed = -100;
							cloudletShape = "cloudletFire";
							cloudletSize = 1;
							deltaT = -3000;
							initT = 4500;
							interval = 0.01;
							size = 3;
							sourceSize = 0.5;
							timeToLive = 0;
							class Table{
								class T0{
									color[] = {0.82,0.95,0.93,0};
									maxT = 0;
								};
								class T1{
									color[] = {0.75,0.77,0.9,0};
									maxT = 200;
								};
								class T10{
									color[] = {0.62,0.29,0.03,0};
									maxT = 2600;
								};
								class T11{
									color[] = {0.59,0.35,0.05,0};
									maxT = 2650;
								};
								class T12{
									color[] = {0.75,0.37,0.03,0};
									maxT = 2700;
								};
								class T13{
									color[] = {0.88,0.34,0.03,0};
									maxT = 2750;
								};
								class T14{
									color[] = {0.91,0.5,0.17,0};
									maxT = 2800;
								};
								class T15{
									color[] = {1,0.6,0.2,0};
									maxT = 2850;
								};
								class T16{
									color[] = {1,0.71,0.3,0};
									maxT = 2900;
								};
								class T17{
									color[] = {0.98,0.83,0.41,0};
									maxT = 2950;
								};
								class T18{
									color[] = {0.98,0.91,0.54,0};
									maxT = 3000;
								};
								class T19{
									color[] = {0.98,0.99,0.6,0};
									maxT = 3100;
								};
								class T2{
									color[] = {0.56,0.62,0.67,0};
									maxT = 400;
								};
								class T20{
									color[] = {0.96,0.99,0.72,0};
									maxT = 3300;
								};
								class T21{
									color[] = {1,0.98,0.91,0};
									maxT = 3600;
								};
								class T22{
									color[] = {1,1,1,0};
									maxT = 4200;
								};
								class T3{
									color[] = {0.39,0.46,0.47,0};
									maxT = 600;
								};
								class T4{
									color[] = {0.24,0.31,0.31,0};
									maxT = 800;
								};
								class T5{
									color[] = {0.23,0.31,0.29,0};
									maxT = 1000;
								};
								class T6{
									color[] = {0.21,0.29,0.27,0};
									maxT = 1500;
								};
								class T7{
									color[] = {0.19,0.23,0.21,0};
									maxT = 2000;
								};
								class T8{
									color[] = {0.22,0.19,0.1,0};
									maxT = 2300;
								};
								class T9{
									color[] = {0.35,0.2,0.02,0};
									maxT = 2500;
								};
							};
						};
						class HitPoints{
							class Hit_Optics_Cdr_CIV{
								armor = -40;
								armorComponent = "Hit_Optics_Cdr_CIV";
								explosionShielding = 0;
								name = "";
								passThrough = 0;
								visual = "vis_optics_Cdr_CIV";
							};
							class Hit_Optics_Cdr_Peri{
								armor = -40;
								armorComponent = "Hit_Optics_Cdr_Peri";
								explosionShielding = 0;
								name = "";
								passThrough = 0;
								visual = "vis_optics_Cdr_Peri";
							};
							class HitGunCom{
								armor = 0.3;
								explosionShielding = 0.001;
								isGun = 1;
								material = -1;
								minimalHit = 0.03;
								name = "zbranVelitele";
								passThrough = 0;
								radius = 0.25;
								visual = "zbranVelitele";
							};
							class HitTurretCom{
								armor = 0.3;
								explosionShielding = 0.001;
								isTurret = 1;
								material = -1;
								minimalHit = 0.03;
								name = "vezVelitele";
								passThrough = 0;
								radius = 0.25;
								visual = "vezVelitele";
							};
						};
						class MGunClouds{
							access = 0;
							cloudletAccY = 0;
							cloudletAlpha = 0.3;
							cloudletAnimPeriod = 1;
							cloudletColor[] = {1,1,1,0};
							cloudletDuration = 0.05;
							cloudletFadeIn = 0;
							cloudletFadeOut = 0.1;
							cloudletGrowUp = 0.05;
							cloudletMaxYSpeed = 100;
							cloudletMinYSpeed = -100;
							cloudletShape = "cloudletClouds";
							cloudletSize = 1;
							deltaT = 0;
							initT = 0;
							interval = 0.02;
							size = 0.3;
							sourceSize = 0.02;
							timeToLive = 0;
							class Table{
								class T0{
									color[] = {1,1,1,0};
									maxT = 0;
								};
							};
						};
						class OpticsIn{
							class Ultrawide{
								gunnerOpticsEffect[] = {};
								gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_1x";
								hitPoint = "Hit_Optics_Cdr_CIV";
								initAngleX = 0;
								initAngleY = 0;
								initFov = 0.7;
								maxAngleX = 30;
								maxAngleY = 100;
								maxFov = 0.7;
								minAngleX = -30;
								minAngleY = -100;
								minFov = 0.7;
								opticsDisplayName = "60HZ";
								thermalMode[] = {0,1};
								visionMode[] = {"Normal","Ti"};
							};
							class Wide{
								gunnerOpticsEffect[] = {};
								gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_4x";
								hitPoint = "Hit_Optics_Cdr_CIV";
								initAngleX = 0;
								initAngleY = 0;
								initFov = 0.175;
								maxAngleX = 30;
								maxAngleY = 100;
								maxFov = 0.175;
								minAngleX = -30;
								minAngleY = -100;
								minFov = 0.175;
								opticsDisplayName = "60HZ";
								thermalMode[] = {0,1};
								visionMode[] = {"Normal","Ti"};
							};
							class Narrow{
								gunnerOpticsEffect[] = {};
								gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_12x";
								hitPoint = "Hit_Optics_Cdr_CIV";
								initAngleX = 0;
								initAngleY = 0;
								initFov = 0.0583333;
								maxAngleX = 30;
								maxAngleY = 100;
								maxFov = 0.0583333;
								minAngleX = -30;
								minAngleY = -100;
								minFov = 0.0583333;
								opticsDisplayName = "60HZ";
								thermalMode[] = {0,1};
								visionMode[] = {"Normal","Ti"};
							};
							class Narrow2x{
								gunnerOpticsEffect[] = {};
								gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_12x";
								hitPoint = "Hit_Optics_Cdr_CIV";
								initAngleX = 0;
								initAngleY = 0;
								initFov = 0.0291667;
								maxAngleX = 30;
								maxAngleY = 100;
								maxFov = 0.0291667;
								minAngleX = -30;
								minAngleY = -100;
								minFov = 0.0291667;
								opticsDisplayName = "60HZ 2X";
								thermalMode[] = {0,1};
								visionMode[] = {"Normal","Ti"};
							};
							class Narrow4x{
								gunnerOpticsEffect[] = {};
								gunnerOpticsModel = "rhsusf\addons\rhsusf_optics\data\rhsusf_IBAS_12x";
								hitPoint = "Hit_Optics_Cdr_CIV";
								initAngleX = 0;
								initAngleY = 0;
								initFov = 0.0145833;
								maxAngleX = 30;
								maxAngleY = 100;
								maxFov = 0.0145833;
								minAngleX = -30;
								minAngleY = -100;
								minFov = 0.0145833;
								opticsDisplayName = "60HZ 4X";
								thermalMode[] = {0,1};
								visionMode[] = {"Normal","Ti"};
							};
						};
						class Reflectors{
							class cabin{
								ambient[] = {5,5,5};
								blinking = 0;
								color[] = {800,900,650};
								coneFadeCoef = 1;
								dayLight = 1;
								direction = "cabin_light_dir";
								flareMaxDistance = 5;
								flareSize = 1;
								hitpoint = "cabin_light";
								innerAngle = 90;
								intensity = 0.3;
								outerAngle = 165;
								position = "cabin_light";
								selection = "cabin_light";
								size = 1;
								useFlare = 1;
								class Attenuation{
									constant = 0;
									hardLimitEnd = 1.5;
									hardLimitStart = 1;
									linear = 1;
									quadratic = 50;
									start = 0;
								};
							};
							class cargo_light_1{
								ambient[] = {5,5,5};
								blinking = 0;
								color[] = {800,900,650};
								coneFadeCoef = 0.1;
								dayLight = 1;
								direction = "cargo_light_1_dir";
								flareMaxDistance = 5;
								flareSize = 1;
								hitpoint = "cargo_light_1";
								innerAngle = 140;
								intensity = 3;
								outerAngle = 175;
								position = "cargo_light_1";
								selection = "cargo_light_1";
								size = 1;
								useFlare = 0;
								class Attenuation{
									constant = 0;
									hardLimitEnd = 2;
									hardLimitStart = 1.4;
									linear = 1;
									quadratic = 70;
									start = 0;
								};
							};
						};
						class TurnIn{
							turnOffset = 0;
						};
						class TurnOut{
							turnOffset = 0;
						};
						class Turrets{
							
						};
						class TurretSpec{
							showHeadPhones = 0;
						};
						class ViewGunner{
							initAngleX = -5;
							initAngleY = 0;
							initFov = 0.9;
							maxAngleX = 85;
							maxAngleY = 150;
							maxFov = 1.25;
							maxMoveX = 0.075;
							maxMoveY = 0.075;
							maxMoveZ = 0.1;
							minAngleX = -65;
							minAngleY = -150;
							minFov = 0.25;
							minMoveX = -0.075;
							minMoveY = -0.075;
							minMoveZ = -0.075;
							speedZoomMaxFOV = 0;
							speedZoomMaxSpeed = 1e+10;
						};
						class ViewOptics{
							initAngleX = 0;
							initAngleY = 0;
							initFov = 0.466;
							maxAngleX = 30;
							maxAngleY = 100;
							maxFov = 0.466;
							minAngleX = -30;
							minAngleY = -100;
							minFov = 0.015;
							thermalMode[] = {0,1};
							visionMode[] = {"Normal","NVG","Ti"};
						};
					};
				};
				class TurretSpec{
					showHeadPhones = 0;
				};
				class ViewGunner{
					continuous = 0;
					initAngleX = -5;
					initAngleY = 0;
					initFov = 0.9;
					maxAngleX = 85;
					maxAngleY = 150;
					maxFov = 1.25;
					maxMoveX = 0.075;
					maxMoveY = 0.075;
					maxMoveZ = 0.1;
					minAngleX = -65;
					minAngleY = -150;
					minFov = 0.25;
					minMoveX = -0.075;
					minMoveY = -0.075;
					minMoveZ = -0.075;
					speedZoomMaxFOV = 0;
					speedZoomMaxSpeed = 1e+10;
				};
				class ViewOptics{
					initAngleX = 0;
					initAngleY = 0;
					initFov = 0.3;
					maxAngleX = 30;
					maxAngleY = 100;
					maxFov = 0.35;
					maxMoveX = 0;
					maxMoveY = 0;
					maxMoveZ = 0;
					minAngleX = -30;
					minAngleY = -100;
					minFov = 0.07;
					minMoveX = 0;
					minMoveY = 0;
					minMoveZ = 0;
					speedZoomMaxFOV = 0;
					speedZoomMaxSpeed = 1e+10;
				};
			};
		};
	};
};
class CfgWeapons{
	class autocannon_30mm_CTWS;
	class RHS_weap_M242BC: autocannon_30mm_CTWS{
		class AP;
		class HE;
	};
	class SHG_weap_M242BC:RHS_weap_M242BC{
		ballisticsComputer = "2+4+16";
		canLock = 2;
		weaponLockSystem = 8;
		class AP: AP{
			ballisticsComputer = "2+4+16";
			canLock = 2;
			weaponLockSystem = 8;
		};
		class HE: HE{
			ballisticsComputer = "2+4+16";
			canLock = 2;
			weaponLockSystem = 8;
		};
	};
	class Rhs_weap_stinger_Launcher;
	class SHG_weap_stinger_Launcher: Rhs_weap_stinger_Launcher{
		canLock = 2;
		weaponLockSystem = 8;
	};
	class rhs_weap_m240_bradley_coax;
	class SHG_weap_m230_bradley_coax: rhs_weap_m240_bradley_coax{
		ballisticsComputer = "2+4+16";
		canLock = 2;
		weaponLockSystem = 8;
	};
	class rhs_weap_fcs_ammo;
	class SHG_weap_fcs_ammo: rhs_weap_fcs_ammo{
		ballisticsComputer = "2+4+16";
		canLock = 2;
		weaponLockSystem = 8;
	};
	// use Badger cannon as base for M230LF and refrence apache gunship cannon autocannon_40mm_CTWS & rhs_weap_M230 to adjust m242
	class SHG_weap_M230LF: RHS_weap_M242BC{
		displayName = "30mm M230LF";
		ballisticsComputer = "2+4+16";
		canLock = 2;
		weaponLockSystem = 8;
		class AP: AP{
			ballisticsComputer = "2+4+16";
			canLock = 2;
			displayName = "30mm M230LF - XM1198 HEDP";
			weaponLockSystem = 8;
			magazines[] = {"100rnd_XM1198_HEDP"};
			magazineWell[] = {"SHG_Autocannon_30mm_M230LF_AP"};
		};
		class HE: HE{
			ballisticsComputer = "2+4+16";
			canLock = 2;
			displayName = "30mm M230LF - XM11211 HEP";
			weaponLockSystem = 8;
			magazines[] = {"200rnd_XM1211_HEP","100rnd_XM1198_HEDP"};
			magazineWell[] = {"SHG_Autocannon_30mm_M230LF_HE","SHG_Autocannon_30mm_M230LF_AP"};
		};
	};
};
class CfgMagazineWells{
	class SHG_Autocannon_30mm_M230LF_AP{
		SHG_30mm_AP_Magazines[]={"100rnd_XM1198_HEDP"};
	};
	class SHG_Autocannon_30mm_M230LF_HE{
		SHG_30mm_HE_Magazines[]={"200rnd_XM1211_HEP"};
	};
};
class Extended_PreStart_EventHandlers {
	class M792 {
		init = "call compile preProcessFileLineNumbers 'MSHORAD\XEH_preStart.sqf'";
	};
	class XM1211 {
		init = "call compile preProcessFileLineNumbers 'MSHORAD\XEH2_preStart.sqf'";
	};
};

class Extended_PreInit_EventHandlers {
	class M792 {
		init = "call compile preProcessFileLineNumbers 'MSHORAD\XEH_preInit.sqf'";
	};
	class XM1211 {
		init = "call compile preProcessFileLineNumbers 'MSHORAD\XEH2_preInit.sqf'";
	};
};
class CfgAmmo {
	class RHS_ammo_M792_HEI;
	class rhs_ammo_M792_Prox : RHS_ammo_M792_HEI {
		indirectHit = 16;		
		indirectHitRange = 8;	
		simulation = "shotRocket";
		timeToLive = 0;
	};
	// Look at rhs_mag_30x113mm_M789_HEDP_1200 & 60Rnd_40mm_GPR_Tracer_Red_shells to find ammo and adjust the m242
	class rhs_ammo_30x113mm_M789_HEDP; //XM1198 HEDP
	class B_40mm_GPR_Tracer_Red; //XM1211 HEP
	class shg_ammo_XM1211: RHS_ammo_M792_HEI{
		hit=30;
		indirectHit=18;
		indirectHitRange=4;
		explosive=0.95;
		caliber=3;
	};
	class shg_ammo_XM1198: RHS_ammo_M792_HEI{
		hit=100;
		indirectHit=10;
		indirectHitRange=2;
		explosive = 1.5;
		caliber=6;
	};
	class shg_ammo_XM1211_Prox: RHS_ammo_M792_HEI{
		hit=30;
		indirectHit = 36;		
		indirectHitRange = 10;
		explosive=0.95;	
		simulation = "shotRocket";
		timeToLive = 0;
	};
};
class CfgMagazines{
	class 200rnd_XM1211_HEP{
		ammo = "shg_ammo_XM1211";
		author = "KetchupZombi";
		count = 200;
		descriptionShort = "";
		displayName = "30x113mm XM1211 HEP";
		displayNameMFDFormat = "ОФ";
		displayNameShort = "XM1211 HEP";
		initspeed = 1100;
		lastroundstracer = 4;
		mass = 8;
		maxleadspeed = 100;
		maxThrowHoldTime = 2;
		maxThrowIntensityCoef = 1.4;
		minThrowIntensityCoef = 0.3;
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		modelSpecial = "";
		muzzleImpulseFactor[] = {1,4};
		namesound = "cannon";
		picture = "";
		quickReload = 0;
		reloadAction = "";
		scope = 2;
		selectionFireAnim = "zasleh";
		simulation = "ProxyMagazines";
		tracersevery = 1;
		type = 0;
		useAction = 0;
		useActionTitle = "";
		value = 1;
		weaponPoolAvailable = 0;
		weight = 126;
		class InventoryPlacements{
		};
		class Library{
			libTextDesc = "";
		};
	};
	class 100rnd_XM1198_HEDP{
		ammo = "shg_ammo_XM1198";
		author = "KetchupZombi";
		count = 100;
		descriptionShort = "";
		displayName = "30x113mm XM1198 HEDP";
		displayNameMFDFormat = "ОФ";
		displayNameShort = "XM1198 HEDP";
		initspeed = 1100;
		lastroundstracer = 4;
		mass = 8;
		maxleadspeed = 100;
		maxThrowHoldTime = 2;
		maxThrowIntensityCoef = 1.4;
		minThrowIntensityCoef = 0.3;
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		modelSpecial = "";
		muzzleImpulseFactor[] = {1,4};
		namesound = "cannon";
		picture = "";
		quickReload = 0;
		reloadAction = "";
		scope = 2;
		selectionFireAnim = "zasleh";
		simulation = "ProxyMagazines";
		tracersevery = 1;
		type = 0;
		useAction = 0;
		useActionTitle = "";
		value = 1;
		weaponPoolAvailable = 0;
		weight = 126;
		class InventoryPlacements{
		};
		class Library{
			libTextDesc = "";
		};
	};
};