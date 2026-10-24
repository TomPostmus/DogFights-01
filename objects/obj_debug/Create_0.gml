global.debug = false // whether we are in debug draw mode
	// TODO: make variable non global and more descriptive name

// Screenshot index
screenshot_i = 0 // current index of screenshot

// Data structure management
{
	
	ds_types = [ // all DS types
		ds_type_grid,
		ds_type_list,
		ds_type_map,
		ds_type_priority,
		ds_type_queue,
		ds_type_stack,
	]
	ds_counts = array_create(array_length(ds_types), 0) // array containing for each ds type how many there are
	
	enum DS_NONSTANDARD_TYPES { // non-standard ds types
		PATH,
		SURFACE,
		BUFFER,
		END // last element
	}
	ds_ns_counts = array_create(DS_NONSTANDARD_TYPES.END, 0) // counts of non-standard ds's
	
	// Runtime reports timer
	ds_report_tick = 0
	ds_report_time = 60

	// Count datastructures for DS report (useful for spotting memory leaks)
	function ds_count_all() {
		var max_id_check = 20000; // maximum identifier number to check for
	
		ds_counts = array_create(array_length(ds_types), 0) // reset
		ds_ns_counts = array_create(DS_NONSTANDARD_TYPES.END, 0)
	
		for (var i = 0; i < max_id_check; i ++) { // loop through identifiers
		
			// count standard data structures
			for (var j = 0; j < array_length(ds_types); j++)
				ds_counts[j] += ds_exists(i, ds_types[j])
					
			// count non-standard structures
			for (var j = 0; j < DS_NONSTANDARD_TYPES.END; j++) {
				switch (j) {
					case DS_NONSTANDARD_TYPES.PATH: ds_ns_counts[j] += path_exists(i); break
					case DS_NONSTANDARD_TYPES.SURFACE: ds_ns_counts[j] += surface_exists(i); break
					case DS_NONSTANDARD_TYPES.BUFFER: ds_ns_counts[j] += buffer_exists(i); break
				}
			}
		}
	
		// count total amount of data structures
		var _total = 0
		for (var j = 0; j < array_length(ds_types); j++)
			_total += ds_counts[j]
		for (var j = 0; j < DS_NONSTANDARD_TYPES.END; j++)
			_total += ds_ns_counts[j]
	
		return _total
	}

}