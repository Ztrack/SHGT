params ["_unit"];
// Question: What town do you live in?

// get rep
_area = _unit getVariable ["SHGT_area", 'not found'];
if (_area isEqualTo 'not found') exitWith {
	systemChat "ERROR: civ area info not found"
};

_outputText = format ["I am from %1",_area];


// output text
private _unitName = name _unit;
_fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
_fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";
titleText [format ["%1 %2: </t >%3 %4 </t>", _fName, _unitName, _fDialogue, _outputText ], "PLAIN DOWN", -1, true, true];