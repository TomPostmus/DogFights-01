/// @param gun_obj
/// @param transfer_cap*
function gun_reload() {

	var gun = argument[0];
	var cap = undefined;
	if (argument_count > 1) cap = argument[1];

	with (gun) {
		var transfer = min(mag_size - ammo_mag, ammo_reserve);
		if (cap != undefined && transfer > cap) transfer = cap
		ammo_reserve -= transfer
		ammo_mag += transfer
		return transfer
	}


}
