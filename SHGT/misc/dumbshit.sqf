
// To allow player to move very fast
SHGT_DEBUG = true;
[] spawn {
player allowDamage false;
player enableStamina false;
while {SHGT_DEBUG isEqualTo true} do {player setAnimSpeedCoef 10; sleep .5;};
};

//
SHGT_DEBUG = true;

man1 hideObject true;
car1 attachTo [man1, [0,0,0.2]];

[] spawn {
while {SHGT_DEBUG isEqualTo true} do {

car1 setObjectScale .1;

};
};

//
SHGT_DEBUG = true;

man1 hideObject true;
heli1 attachTo [man1, [0,0,1]];

[] spawn {
while {SHGT_DEBUG isEqualTo true} do {

heli1 setObjectScale .1;

};
};