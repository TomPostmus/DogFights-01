for (var i = 0; i < ds_list_size(cards); i++) {
	instance_destroy(ds_list_find_value(cards, i))
}

ds_list_destroy(cards)