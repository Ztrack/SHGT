
params ["_boxClassName"];

[_boxClassName, "init", {

		private _thisObj = (_this select 0);
		private _boxClassName = typeOf _thisObj;

		//Write interaction
		private _initHash = SHGT_arsenal_classInitHash getOrDefault [_boxClassName,"none"];
		private _arsenalInteraction = _initHash select 1;
		private _interaction = format ["<t color='#FFBF00'>%1</t>", _arsenalInteraction];
		private _arsenalLogo = _initHash select 2;

		// Create addAction
		_actionId = _thisObj addAction ["Open Arsenal", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			private _boxClassName = typeOf _target;

			// Get list hash
			private _initHash = SHGT_arsenal_classInitHash getOrDefault [_boxClassName,"none"];
			private _arsenalTraitList = _initHash select 0;


			private _MasterList = []; // Initialize variable to hold all arsenal items
			{
				// Get hash values for this trait
				private _savedList = SHGT_arsenal_hash getOrDefault [_x,[]]; // _savedList= [_trait, _itemList,_uids];
				_thisTrait = (_savedList select 0);
				_itemList = (_savedList select 1);
				_whitelistedUIDs = (_savedList select 2);

				// get conditionals to enable this trait/arsenal list
				private _traitEnabled = (_caller getVariable [_x,false]);
				private _uid = getPlayerUID player;
				private _uidEnabled = _uid in (_savedList select 2);
				
				// Does the player fit criteria? If yes add items
				if (_traitEnabled or _uidEnabled) then { 
					_MasterList append _itemList;
				};
			
			} forEach _arsenalTraitList;

			// clear arsenal first
			[_target, false] call ace_arsenal_fnc_removeBox;

			// Fill arsenal with list
			[_target, _MasterList,false] call ace_arsenal_fnc_initBox;

			// call arsenal
			[_target, _caller, false] call ace_arsenal_fnc_openbox; 

		},[],6,true,false,"","true",5];

		// Add a picture to the add action
		// If the player has a preferred _arsenalLogo, use that, otherwise use the module defined one. If none exist, use text only.
		_preferredIcon = player getVariable ["SHGT_arsenal_preferred_arsenal_logo",false];
		if !(_preferredIcon isEqualTo false) then {
			_logoLoc = format ["%1%2%3", "<img size='8' image='", _preferredIcon, "'/>"];
			_thisObj setUserActionText [_actionId, _interaction, _logoLoc]; // Set interaction use the preferred image
		};
		if (!(_arsenalLogo isEqualTo "") and (_preferredIcon isEqualTo false)) then {
			_logoLoc = format ["%1%2%3", "<img size='8' image='", _arsenalLogo, "'/>"];
			_thisObj setUserActionText [_actionId, _interaction, _logoLoc]; // Set interaction use the module defined image
		};
		if ((_arsenalLogo isEqualTo "") and (_preferredIcon isEqualTo false)) then {
			_thisObj setUserActionText [_actionId, _interaction]; // Set interaction to just text
		};

}, false, [], true] call CBA_fnc_addClassEventHandler;