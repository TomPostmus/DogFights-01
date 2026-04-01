if (async_load[? "id"] == request) {
	show_message(string(async_load[? "http_status"]) + ", " + async_load[? "result"])
}