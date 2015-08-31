active_sectors = [];

waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "sectors_allSectors" };

while { GRLIB_endgame == 0 } do {

	{
		private [ "_nextsector"];
		_nextsector = _x;
		if (  [] call F_opforCap < GRLIB_sector_cap ) then {
			if ( ( [ getmarkerpos _nextsector , GRLIB_sector_size , WEST ] call F_getUnitsCount > 0 ) && !( _nextsector in active_sectors ) ) then {
				_hc = [] call F_lessLoadedHC;
				if ( isNull _hc ) then {
					[ _nextsector ] spawn manage_one_sector;
				} else {
					[ [ _nextsector ] , "manage_one_sector", _hc ] call BIS_fnc_MP;
				}
			};
		};
		sleep 0.25;

	} foreach ( sectors_allSectors - blufor_sectors );

	sleep 1;
};

