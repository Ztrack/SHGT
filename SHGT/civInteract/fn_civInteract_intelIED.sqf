// Original code written by Spicy with help from Ztrack, Atoc, and nikkojt. random Responses from Marcus
// Edited for SHGT compatability
params ["_unit"];

// get near IEDs
private _iedArray = nearestMines [_unit, SHGT_ied_iedListAmmo, 500];
private _iedCount = count _iedArray;
private _nearestIED = _iedArray select 0;
private _iedKnown = (_iedCount >0);
private _lieChance = random 100;

// get rep
_shgCivRep = _unit getVariable ["SHGT_civReputation", 0];

// Get flag
_hasAnswered = _unit getVariable ["SHGT_civInteract_answered_IEDIntel", false];

_outputText = "";
private _KnownandLikedResponses = [
	"I saw a group of individuals placing some IEDs not too far from here.",
	"Yes! I had a close call earlier— I nearly stepped on an IED hidden in the brush over there!",
	"Yes, I witnessed suspicious activity and later found evidence of freshly planted IEDs right over there.",
	"Actually yes. I caught sight of someone covertly placing IEDs along this path early this morning.",
	"Yes, believe it or not I accidentally disturbed a concealed cache of IEDs just moments ago.",
	"Yes, unfortunately, I saw remnants of exploded IEDs scattered around here. I'd be careful.",
	"Yes, I noticed some unusual disturbances in the ground and upon closer inspection, found buried IEDs down the road.",
	"Yes, I had a close call last night—I saw individuals planting IEDs under cover of darkness!",
	"Yes, yesterday I came across some suspicious materials and equipment that strongly suggest the presence of IEDs in this area.",
	"They planted them at night... I almost stepped on one."
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
private _UnknownandLikedReponses = [
	"Yes, I've scoped out the area, and thankfully, there are no IEDs in sight. But stay safe out there!",
	"Nope, no sign of any IEDs around here. I'll let you know if I see any, though.",
	"Not a single IED spotted, friend. Let's keep it that way and ensure everyone's safety.",
	"I've checked the area thoroughly, and it's all clear of IEDs.",
	"Thankfully, no IEDs around here. But stay alert and watch your step as you move forward!",
	"I've been keeping an eye out for you guys, and I haven't seen any IEDs.",
	"All clear on the IED front!",
	"You're in luck—no IEDs spotted. You can keep moving forward.",
	"Nope, no IEDs around here. Looks like we're in the clear for now.",
	"Thankfully, I haven't come across any IEDs in this area. Let's hope it stays that way."
];
private _KnownLieResponses = [
	"No, haven't seen any IEDs... but if you keep walking straight ahead, you might find something interesting.",
	"No, there haven't been any IEDs around here at all. Sure would be a shame if you found some, though. You know. With your face.",
	"I've been around here a lot lately, and I can say with certainty, nope, absolutely no IEDs.",
	"I haven't seen any signs of IEDs in this area whatsoever. Heh. Good luck!",
	"No, haven't seen any around here... but you should explore that abandoned building over there."
];
private _UnknownLieResponses = [
	"Yes, I've seen a couple, but they seemed old and inactive.",
	"Yeah, I noticed a few, but they were all disarmed already.",
	"Yes, there were some, but they were removed by the authorities.",
	"Absolutely, there were a few, but they were safely detonated.",
	"Yeah, I spotted a couple, but they were far away from where we are now."
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
	"I hope you find one and learn your lesson!",
	"Do I look like your guardian angel? I won't shed a tear if you find one!",
	"I couldn't care less about your safety, so go ahead, have a blast!",
	"Maybe i should have planted some"
];

// Generate switch cases
_case = 0; // Initialize
if ((_iedKnown) and (_shgCivRep<=24)) then {
	_case = 1
}; // IED is nearby, player hated
if ((_iedKnown) and (_shgCivRep>=25 and _shgCivRep<=59)) then {
	_case = 2
}; // IED is nearby, player is neutral
if ((_iedKnown) and (_shgCivRep>=60)) then {
	_case = 3
}; // IED is nearby, player is liked
if (!(_iedKnown) and (_shgCivRep<=24)) then {
	_case = 4
}; // IED is not nearby, player hated
if (!(_iedKnown) and (_shgCivRep>=25 and _shgCivRep<=59)) then {
	_case = 5
}; // IED is not nearby, player is neutral
if (!(_iedKnown) and (_shgCivRep>=60)) then {
	_case = 6
}; // IED is not nearby, Plaer is liked
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
        _pos = getPosATL _nearestIED;
        _pos = [(_pos select 0) + (random 50 - 50),(_pos select 1) + (random 50 - 50),_pos select 2];
        _marker = createMarker [format ["SHGTIEDMarker%1",random 10000], _pos];
        _marker setMarkerShape "ELLIPSE";
        _marker setMarkerSize [100, 100];
        _marker setMarkerColor "ColorRed";
        _marker setMarkerAlpha 0.4;
        _marker2 = createMarker [format ["SHGTIEDMarker%1",random 10000], _pos]; // Not visible yet.
        _marker2 setMarkerType "hd_dot"; // Visible.
        _marker2 setMarkerText "Reported IED";
        openMap [true, false];;
        [_marker,_marker2] spawn {
            params ["_marker","_marker2"];
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

if !(_case isEqualTo 7) then {_unit setVariable ["SHGT_civInteract_answered_IEDIntel", true,true];};

// output text
private _unitName = name _unit;
_fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
_fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";
titleText [format ["%1 %2: </t >%3 %4 </t>", _fName, _unitName, _fDialogue, _outputText ], "PLAIN DOWN", -1, true, true];