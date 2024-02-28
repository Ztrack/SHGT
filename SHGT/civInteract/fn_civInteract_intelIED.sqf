//Written by Spicy with help from Ztrack, Atoc, and nikkojt. Random Responses from Marcus
params ["_unit"];
            _unit addAction [
            "Do you know of any IEDs around here?",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                private _iedArray = nearestMines [cursorObject, ["ACE_IEDLandSmall_Range_Ammo", "ACE_IEDUrbanSmall_Range_Ammo", "ACE_IEDLandBig_Range_Ammo","ACE_IEDUrbanBig_Range_Ammo"], 200];
                private _iedCount = count _iedArray;
                private _iedKnown = (_iedCount >0);
                private _unitName = name _target;
				private _shgCivRep = random 101; //May or may not include depending on implementation with SHGT
                private _lieChance = random 101;
                
                _fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
                _fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";

                _outputText = "";
                private _KnownandLikedResponses = ["Actually, I stumbled upon a group of individuals constructing some IEDs not too far from here.",
                                                          "Yes! I had a close call earlier—I nearly stepped on an IED hidden in the brush over there!",
                                                          "Yes, I witnessed suspicious activity and later found evidence of freshly planted IEDs right over there.",
                                                          "Actually yes. I caught sight of someone covertly placing IEDs along this path early this morning.",
                                                          "Yes, I saw a makeshift workshop where they were crafting IEDs nearby!",
                                                          "Yes, believe it or not I accidentally disturbed a concealed cache of IEDs just moments ago.",
                                                          "Yes, unfortunately, I saw remnants of exploded IEDs scattered around here. I'd be careful.",
                                                          "Yes, I noticed some unusual disturbances in the ground and upon closer inspection, found buried IEDs down the road.",
                                                          "Yes, I had a close call last night—I saw individuals planting IEDs under cover of darkness!",
                                                          "Yes, yesterday I came across some suspicious materials and equipment that strongly suggest the presence of IEDs in this area.",
                                                          "They planted them at night... I almost stepped on one."
                                                         ];
                private _NeutralResponses =       ["I haven't noticed anything out of the ordinary around here.",
                                                          "I haven't really been paying attention to that sort of thing.",
                                                          "I'm not sure, I haven't been around here much lately.",
                                                          "I've just been keeping my head down.",
                                                          "I'm not the best person to ask about that kind of stuff.",
                                                          "I haven't seen anything suspicious, but I haven't been looking for it either.",
                                                          "I can't say I've come across anything like that in this area.",
                                                          "I haven't had any reason to be concerned about that.",
                                                          "I like to mind my own business. You should do the same.",
                                                          "I haven't seen anything like that. Just leave us alone."      
                                                         ];                    
                private _UnknownandLikedReponses =   ["Yes, I've scoped out the area, and thankfully, there are no IEDs in sight. But stay safe out there!",
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
                private _KnownLieResponses =        ["No, haven't seen any IEDs... but if you keep walking straight ahead, you might find something interesting.",
                                                             "No, there haven't been any IEDs around here at all. Sure would be a shame if you found some, though. You know. With your face.",
                                                             "I've been around here a lot lately, and I can say with certainty, nope, absolutely no IEDs.",
                                                             "I haven't seen any signs of IEDs in this area whatsoever. Heh. Good luck!",
                                                             "No, haven't seen any around here... but you should explore that abandoned building over there."                                  
                                                           ];
                private _UnknownLieResponses =      ["Yes, I've seen a couple, but they seemed old and inactive.",
                                                            "Yeah, I noticed a few, but they were all disarmed already.",
                                                            "Yes, there were some, but they were removed by the authorities.",
                                                            "Absolutely, there were a few, but they were safely detonated.",
                                                            "Yeah, I spotted a couple, but they were far away from where we are now."
                                                           ];                         
                private _HatedResponses =           ["I'm certainly not telling you pigdogs.",
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
                                                           "I hope you stumble upon one! Get lost! " ,
                                                           "Who knows, maybe you'll get lucky and step on one!",
                                                           "Don't bother me with your nonsense! Go ahead, tempt fate!",
                                                           "What, you expect me to hold your hand? I hope you run into one!",
                                                           "Are you kidding me? Feel free to wander off and find out for yourself!",
                                                           "I hope you find one and learn your lesson!",
                                                           "Do I look like your guardian angel? I won't shed a tear if you find one!",
                                                           "I couldn't care less about your safety, so go ahead, have a blast!"
                                                           ];                                          
                if (fleeing _target) then {
                    _outputText = "AAAAAAAAAHHHHH!";
                } else {

                    if (_iedKnown) then {
                        if (_shgCivRep < 30) then {                         // 0-29
                            _outputText = selectRandom selectRandom _HatedResponses;
                        };
                        if (_shgCivRep < 60 and _shgCivRep >= 30) then {      // 30-59
                            _outputText = selectRandom _NeutralResponses;
                        };
                        if (_shgCivRep < 85 and _shgCivRep >= 60) then {      // 60-84
                            _outputText = selectRandom _KnownandLikedResponses;
                        };
                        if (_shgCivRep >= 85) then {                          // 85-100
                            _isPlural = _iedCount != 1;
                            _outputText = format ["There %1 %2 IED%3 in the area. I hope you find it.", if (_isPlural) then [{"are"},{"is"}], _iedCount, if (_isPlural) then [{"s"},{""}]];
                        };
                        if (_shgCivRep < 35 and _lieChance > 0 and _lieChance <=20) then {
                            _outputText = selectRandom _KnownLieResponses;
                        };
                    } else {    
                        if (_shgCivRep >= 60) then { // 60+
                            _outputText = selectRandom _UnknownandLikedReponses;
                        } else {
                            if (_shgCivRep < 35 and _lieChance >0 and _lieChance <=20) then {
                                _outputText = selectRandom _UnknownLieResponses;
                            } else {
                                if (_shgCivRep < 30) then { //0-29
                                    _outputText = selectRandom _HatedResponses;
                                } else {
                                    if (_shgCivRep < 60 and _shgCivRep >= 30) then {  // 30-59
                                         _outputText = selectRandom _NeutralResponses;
                                }
                              }
                            };                
                        };
                    };
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