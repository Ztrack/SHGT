params ["_unit"];         
            _unit addAction [
            "Give civilian humanitarion ration",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                _fName = "<t align='center' shadow='2' color='#f860f6' size='1.5' font='PuristaBold'>";
                _fDialogue = "<t align='center' shadow='2' valign='bottom' color='#ffffff' size='1.5' font='PuristaBold' shadow='2'>";
				_outputText = "";
				
				private _unitName = name _target;
				private _currentRep = _target getVariable ["SHGT_civReputation",0];
				private _repAdd = 1;
				private _newRep = _currentRep + _repAdd;
				private _humratCount = { _x isEqualTo "ACE_Humanitarian_Ration" } count (items _caller);
				
					//If player has HUMRAT, then it is deleted from inventory and rep goes up.
				 if (_humratCount >= 1) then {
      			 
				 	 canAfford = true;
       		  	     isPersonal = true;
            		_caller removeItem "ACE_Humanitarian_Ration";
       			 	_target setVariable ["SHGT_civReputation", _newRep,true];
					_outputText = "Thank you. I will use this to feed my family.";
				 } else {
				
					//If player does not have HUMRAT, civ is upset.
					_outputText = "Why do you disrespect me with your false gestures?";
				 };
				
				 //Failsafe if no workie
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
