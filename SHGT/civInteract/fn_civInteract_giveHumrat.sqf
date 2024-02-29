params ["_unit"];         
				
private _unitName = name _unit;
private _humratCount = { _x isEqualTo "ACE_Humanitarian_Ration" } count (items player);
_fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
_fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";

//If player has HUMRAT, then it is deleted from inventory and rep goes up.
private _outputText = [];
private _sucess = false;
private _hasReceivedHumrat = _unit getVariable ["SHGT_hasReceivedHumrat",false];
if ((_humratCount >= 1) and !(_hasReceivedHumrat isEqualTo true)) then {
	player removeItem "ACE_Humanitarian_Ration";
	_outputText = "Thank you. I will use this to feed my family.";
	_sucess = true;
	_unit setVariable ["SHGT_hasReceivedHumrat",true,true];
} else {
	//If player does not have HUMRAT, civ is upset.
	_outputText = "Why do you disrespect me with your false gestures?";
	_sucess = false;
};

if (_hasReceivedHumrat isEqualTo true) then {
	_outputText = "I have enough to eat";
	_sucess = false;
};
				
//Failsafe if no workie
if ((_outputText isEqualTo "") or (_outputText isEqualTo [])) then {
    _outputText = "I don't have anything to say.";
};

// Show text to player
titleText [format ["%1 %2: </t >%3 %4 </t>", _fName, _unitName, _fDialogue, _outputText ], "PLAIN DOWN", -1, true, true];

// If failed, exit
if !(_sucess isEqualTo true) exitWith {};

// Set civ rep
private _currentRep = _unit getVariable ["SHGT_civReputation",0];
private _newRep = _currentRep + SHGT_civInteract_civrepaddedfromHumrat;
_unit setVariable ["SHGT_civReputation", _newRep,true];

// set town rep
[_unit,SHGT_civInteract_TownrepAddedfromHumrat] call SHGT_fnc_civInteract_changeTownRepofCivilian;

// Set flag to not receive more humrats
_unit getVariable ["SHGT_hasReceivedHumrat",true];