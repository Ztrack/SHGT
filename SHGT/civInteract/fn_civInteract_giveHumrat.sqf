params ["_unit"];

// if player has HUMRAT, then it is deleted from inventory and rep goes up.
private _humratCount = {
	_x isEqualTo "ACE_Humanitarian_Ration"
} count (items player);
private _outputText = []; // initialize
private _sucess = false; // initialize

// Checks
private _hasReceivedHumrat = _unit getVariable ["SHGT_hasReceivedHumrat", false];
_area = _unit getVariable ["SHGT_area", 'not found'];
if (_area isEqualTo 'not found') exitWith {
	systemChat "ERROR: civ area info not found"
};
_maxHumratReached = false;
if isNil "SHGT_humratGainToday" then {
	SHGT_humratGainToday = createHashMap;
	SHGT_humratGainToday set [_area, 0]; publicVariable "SHGT_humratGainToday";
};
_currentTownHumratGain = SHGT_humratGainToday getOrDefault [_area, 0];
_maxHumratReached = (_currentTownHumratGain>=SHGT_civInteract_maxHumratRepGainPerDay);

// get state
if ((_humratCount >= 1) and !(_hasReceivedHumrat) and !(_maxHumratReached)) then {
	player removeItem "ACE_Humanitarian_Ration";
	_outputText = "Thank you. I will use this to feed my family.";
	_sucess = true;

	// set civ rep
	private _currentRep = _unit getVariable ["SHGT_civReputation", 0];
	private _newRep = _currentRep + SHGT_civInteract_civrepaddedfromHumrat;
	_unit setVariable ["SHGT_civReputation", _newRep, true];

	// set town rep
	[_unit, SHGT_civInteract_TownrepAddedfromHumrat] call SHGT_fnc_civInteract_changeTownRepofCivilian;

	// set flag to not receive more humrats
	_unit getVariable ["SHGT_hasReceivedHumrat", true];

	// set humrat gain
	_unit setVariable ["SHGT_hasReceivedHumrat", true, true];
	SHGT_humratGainToday set [_area, _currentTownHumratGain+1];
	publicVariable "SHGT_humratGainToday";
	
} else {
	// if player does not have HUMRAT, civ is upset.
	_outputText = "Why do you disrespect me with your false gestures?";
	_sucess = false;
};

if (_hasReceivedHumrat) then {
	_outputText = "I have enough to eat";
	_sucess = false;
};

if (_maxHumratReached) then {
	_outputText = "The village has enough food for now";
	_sucess = false;
};

// Failsafe if no workie
if ((_outputText isEqualTo "") or (_outputText isEqualTo [])) then {
	_outputText = "I don't have anything to say. Report this bug";
};

// Show text to player
private _unitName = name _unit;
_fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
_fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";
titleText [format ["%1 %2: </t >%3 %4 </t>", _fName, _unitName, _fDialogue, _outputText ], "PLAIN DOWN", -1, true, true];