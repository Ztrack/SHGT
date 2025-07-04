params ["_unit"];
// Question: Do you support us?

// get rep
_area = _unit getVariable ["SHGT_area", 'not found'];
if (_area isEqualTo 'not found') exitWith {
	systemChat "ERROR: civ area info not found"
};
_shgCivRep = _unit getVariable ["SHGT_civReputation", 0];
_areaReputation = SHGT_areaReputation getOrDefault [_area,0];

_outputText = "";
private _LikedResponses = [
	"I support you"
];
private _NeutralResponses = [
	"I don't care about you",
	"I dont support you, but i don't hate you"
];
private _HatedResponses = [
	"I don't like you",
	"You dont make our lives any better by being here"
];

// Generate switch cases
_case = 0; // Initialize
if (_shgCivRep<=24) then {
	_case = 1
}; // IED is nearby, player hated
if (_shgCivRep>=25 and _shgCivRep<=59) then {
	_case = 2
}; // IED is nearby, player is neutral
if (_shgCivRep>=60) then {
	_case = 3
}; // IED is nearby, player is liked

switch (_case) do
{
	case 1: {
		_outputText = selectRandom _HatedResponses
	};
	case 2: {
		_outputText = selectRandom _NeutralResponses
	};
	case 3: {
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