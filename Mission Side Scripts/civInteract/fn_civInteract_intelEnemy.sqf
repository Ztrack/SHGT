// Written by Spicy with help from Ztrack and nikkojt. Reponses from Marcus 
params ["_unit"];

private _enemyDetected = false; // Initialize
// private _enemyDetected = _target call BIS_fnc_enemyDetected;
private _enemySides = [side player] call BIS_fnc_enemySides;
private _radius = 500;
private _nearEnemies = allUnits select {
	_x distance player < _radius and side _x in _enemySides
};
private _nearEnemy = selectRandom _nearEnemies;
if (_nearEnemies isEqualTo []) then {
	_enemyDetected = false
} else {
	_enemyDetected = true;
};
private _lieChance = random 100;

// get rep
_shgCivRep = _unit getVariable ["SHGT_civReputation", 0];

// get flag
_hasAnswered = _unit getVariable ["SHGT_civInteract_answered_EnemyIntel", false];

_outputText = "";
private _KnownandLikedResponses = [
	"Yep, I spotted them skulking about just a while ago. You need to act fast.",
	"Sure did, and I'm not sticking around to see what they're up to.",
	"Yeah, unfortunately. They're like shadows, always lurking where they shouldn't be.",
	"Yeah, I have, and it's got me on edge. Are you people gonna do something about it or what?",
	"Seen 'em with my own eyes. You better tighten your defenses.",
	"Afraid so, and it's making my blood run cold. We're not safe here anymore.",
	"Oh, I wish I could say otherwise, but yes, I've seen them around. We're in trouble.",
	"Absolutely. And I ain't telling you shit.",
	"Yeah, I clocked them earlier. It's like they're everywhere, watching our every move.",
	"Yeah, I've seen 'em around, but I ain't getting involved."
];
private _NeutralResponses = [
	"I haven't really been paying attention to that sort of thing.",
	"I'm not sure, I haven't been around here much lately.",
	"I've just been keeping my head down.",
	"I'm not the best person to ask about that kind of stuff.",
	"I haven't seen anything suspicious, but I haven't been looking for it either.",
	"I haven't had any reason to be concerned about that.",
	"I like to mind my own business. You should do the same.",
	"Go home, you only bring us misery"
];
private _UnknownandLikedReponses = [ "Nah, haven't seen a single one. But I'm keeping my eyes peeled just in case.",
	"Nope, and I hope I never do. I don't want any part of that.",
	"Haven't spotted any, thank goodness. Let's hope it stays that way.",
	"No, and I'd prefer to keep it that way. The last thing we need is trouble.",
	"Nope. And I never will, if you catch my drift. Now leave me alone.",
	"No, and I'm going to keep it that way. Ignorance is bliss, right?",
	"Not a chance. If there were any, I'd be the first to sound the alarm.",
	"Nope, haven't seen a single one. But that doesn't mean they're not lurking.",
	"Haven't laid eyes on any, and I'm perfectly fine with that. Let's not jinx it.",
	"Not on my watch. If there were any lurking around, I'd have flushed them out by now."
];
private _HatedResponses = [
	"I'm certainly not telling you pigdogs.",
	"Your safety is of no concern to me.",
	"I have no intention of aiding you in avoiding them.",
	"Your well-being doesn't interest me.",
	"Don't expect any assistance from me.",
	"You'll receive no help from me... for free.",
	"I won't waste my breath on your safety.",
	"Good luck, haha.",
	"I don't owe you any favors.",
	"I hope you step on one.",
	"If you're dumb enough, go on, have a look yourself!",
	"Do I look like your babysitter? No, and I couldn't care less if you do!",
	"I hope you stumble upon one! Get lost! ",
	"Who knows, maybe you'll get lucky and step on one!",
	"Don't bother me with your nonsense! Go ahead, tempt fate!",
	"What, you expect me to hold your hand? I hope you run into one!",
	"Are you kidding me? Feel free to wander off and find out for yourself!",
	"I hope you find one and learn your lesson!"
];

// Generate switch cases
_case = 0; // Initialize
if ((_enemyDetected) and (_shgCivRep<=24)) then {
	_case = 1
}; // enemy is nearby, player hated
if ((_enemyDetected) and (_shgCivRep>=25 and _shgCivRep<=59)) then {
	_case = 2
}; // enemy is nearby, player is neutral
if ((_enemyDetected) and (_shgCivRep>=60)) then {
	_case = 3
}; // enemy is nearby, player is liked
if (!(_enemyDetected) and (_shgCivRep<=24)) then {
	_case = 4
}; // enemy is not nearby, player hated
if (!(_enemyDetected) and (_shgCivRep>=25 and _shgCivRep<=59)) then {
	_case = 5
}; // enemy is not nearby, player is neutral
if (!(_enemyDetected) and (_shgCivRep>=60)) then {
	_case = 6
}; // enemy is not nearby, Plaer is liked
if (_hasAnswered) then {
	_case = 7
}; // Has already been asked this question

switch (_case) do
{
	case 1: {
		_outputText = selectRandom _HatedResponses
	};
	case 2: {
		_outputText = selectRandom _NeutralResponses
	};
	case 3: {
		_outputText = selectRandom _KnownandLikedResponses;
		_pos = getPosATL _nearEnemy;
		_pos = [(_pos select 0) + (random 200 - 200), (_pos select 1) + (random 200 - 200), _pos select 2];
		_marker = createMarker [format ["SHGTEnemyMarker%1", random 10000], _pos];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [250, 250];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerAlpha 0.4;
		        _marker2 = createMarker [format ["SHGTEnemyMarker%1", random 10000], _pos]; // not visible yet.
		        _marker2 setMarkerType "hd_dot"; // Visible.
		_marker2 setMarkerText "Reported Enemy";
		openMap [true, false];
		[_marker, _marker2] spawn {
			params ["_marker", "_marker2"];
			sleep 30;
			deleteMarker _marker;
			deleteMarker _marker2;
		};
	};
	case 4: {
		_outputText = selectRandom _HatedResponses
	};
	case 5: {
		_outputText = selectRandom _NeutralResponses
	};
	case 6: {
		_outputText = selectRandom _UnknownandLikedReponses
	};
	case 7: {
		_outputText = "I have already answered this";
	}; // Has already spoken to a player
	case 8: {
		_outputText = selectRandom _lieResponses
	}; // AI lies to player
	default {
		_outputText = "I don't have anything to say (report this bug)";
	}; // default debug answer
};

if !(_case isEqualTo 7) then {
	_unit setVariable ["SHGT_civInteract_answered_EnemyIntel", true, true];
};

// output text
private _unitName = name _unit;
_fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
_fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";
titleText [format ["%1 %2: </t >%3 %4 </t>", _fName, _unitName, _fDialogue, _outputText ], "PLAIN DOWN", -1, true, true];