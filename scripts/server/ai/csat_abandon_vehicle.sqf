_veh = _this select 0;

waitUntil {
	sleep 10;
	!(alive _veh) || (count (crew _veh) == 0)
};

if ( random 100 < 80 ) then {
	sleep 10;
	if ( (alive _veh) && (count (crew _veh) == 0) ) then {
		_veh setdamage 1;
	};
};