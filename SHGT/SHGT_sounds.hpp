class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class SHGT_nokia1
	{
		name = "Nokia sound";						// display name
		sound[] = { "SHGT\sounds\SHGT_nokia1.ogg", 1, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,""};
	};
	class SHGT_SBAbrupt
	{
		name = "SBomber Abrupt";						// display name
		sound[] = { "SHGT\sounds\SHGT_SBAbrupt.ogg", 10, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,""};
	};
	class SHGT_calltoprayer
	{
		name = "calltoprayer";						// display name
		sound[] = { "SHGT\sounds\calltoprayer.ogg", 2, 1, 250 };	// file, volume, pitch, maxDistance
		titles[] = {};
	};
		class dog_barking
	{
		name = "Barking dog";						// display name
		sound[] = { "SHGT\sounds\dog_barking.ogg", 10, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,""};
	};
};