/// @param client_id
/// @param key
function create_packet_authenticate() {

	var client_id = argument[0];
	var key = argument[1];

	var buffer = buffer_create(17, buffer_grow, 1)
	buffer_seek(buffer, buffer_seek_start, 0)

	buffer_write(buffer, buffer_u8, MSG_AUTHENTICATE)
	buffer_write(buffer, buffer_u64, client_id)
	buffer_write(buffer, buffer_u64, key)

	return buffer;


}
