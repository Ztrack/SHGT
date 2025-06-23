params ["_unit"];
// Question: What is the opinion of our forces in this area?

// get rep
_area = _unit getVariable ["SHGT_area", 'not found'];
if (_area isEqualTo 'not found') exitWith {
	systemChat "ERROR: civ area info not found"
};
_shgCivRep = SHGT_areaReputation getOrDefault [_area,0];

_outputText = "";
private _LikedResponses = [
	"We fully support you"
];
private _partialLikedResponses = [
	"Most of us support you, but you havent convinced us all"
];
private _NeutralResponses = [
	"Some of us support you"
];
private _HatedResponses = [
	"Most of us don't support you"
];

// Generate switch cases
_case = 0; // Initialize
if (_shgCivRep<=24) then {
	_case = 1
}; // player hated
if (_shgCivRep>=25) then {
	_case = 2
}; // player is neutral
if (_shgCivRep>=60) then {
	_case = 3
}; // player is liked
if (_shgCivRep>=80) then {
	_case = 4
}; // player is well liked

switch (_case) do
{
	case 1: {
		_outputText = selectRandom _HatedResponses
	};
	case 2: {
		_outputText = selectRandom _NeutralResponses
	};
	case 3: {
		_outputText = selectRandom _partialLikedResponses;
	};
	case 4: {
		_outputText = selectRandom _LikedResponses;
	};
	default {
		_outputText = "I don't have anything to say (report this bug)";
	}; // default debug answer
};

// output text
private _unitName = name _unit;
_fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
_fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";
titleText [format ["%1 %2: </t >%3 %4 </t>", _fName, _unitName, _fDialogue, _outputText ], "PLAIN DOWN", -1, true, true];