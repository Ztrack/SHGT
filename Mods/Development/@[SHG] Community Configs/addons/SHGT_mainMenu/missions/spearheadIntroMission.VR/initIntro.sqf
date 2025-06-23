cutText ["", "BLACK FADED", 69];
enableEnvironment false;
showCinemaBorder false;

//videosintro = ["IFA3WARMod_client\video\FGH.ogv", "IFA3WARMod_client\video\IFA3WARMOD.ogv"] call BIS_fnc_selectRandom;
while {true} do
{
	_video = ["SHGT_mainMenu\video\spearheadIntro.ogv"] spawn BIS_fnc_playVideo;
	waitUntil {scriptDone _video};
};