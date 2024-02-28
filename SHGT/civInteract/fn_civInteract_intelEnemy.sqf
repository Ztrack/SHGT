//Written by Spicy with help from Ztrack and nikkojt. Reponses from Marcus 
params ["_unit"];
        _unit addAction [
            "Have you seen any enemies nearby?",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                private _enemyDetected = _target call BIS_fnc_enemyDetected;
                private _unitName = name _target;
                private _lieChance = random 101;

                _fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
                _fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";
                _outputText = "";
                private _YesResponses = ["Yep, I spotted them skulking about just a while ago. You need to act fast.",
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
                private _NoResponses = [ "Nah, haven't seen a single one. But I'm keeping my eyes peeled just in case.",
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

                if (_enemyDetected) then {
                    _outputText = selectRandom _YesResponses;
                } else {
                    _outputText = selectRandom _NoResponses;
                };
                 if (_enemyDetected and _lieChance >0 and _lieChance <=20) then {
                    _outputText = selectRandom _NoResponses;
                }; 
                  if (!_enemyDetected and _lieChance >0 and _lieChance <=20) then {
                    _outputText = selectRandom _NoResponses;
                }; 
                  if (_outputText isEqualTo "") then {
                    _outputText = "I don't have anything to say.";
                };

                 titleText [format ["%1 %2: </t >%3 %4 </t>", _fName, _unitName, _fDialogue, _outputText ], "PLAIN DOWN", -1, true, true];
                _target removeAction _actionId;
            },
            nil,        
            1.5,        
            true,        
            true,        
            "",            
            "true",        
            5,            
            false,        
            "",            
            ""            
];