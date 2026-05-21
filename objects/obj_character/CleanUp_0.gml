instance_destroy(movement)
if (instance_exists(body))
	instance_destroy(body)
if (instance_exists(weapon))
	instance_destroy(body)
	
ds_list_destroy(damage_bill)