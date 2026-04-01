function http_get_kaas() {
	var httpreq = create_controllers(obj_httprequest_kaas)
	httpreq.request = http_get(global.central_server_base + "/createGame")


}
