

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

// keybind for build menu
["SHGT","logistics_menu_key", "Open logistics menu", {[] call SHGT_fnc_logistics_guiUserSelectObject;}, "", [DIK_B, [true, false, false]]] call CBA_fnc_addKeybind;

// keybind for refund
["SHGT","logistics_Interaction_key", "Interaction Key", {[] call SHGT_fnc_logistics_interactionKey;}, "", [DIK_B, [false, true, false]]] call CBA_fnc_addKeybind;
