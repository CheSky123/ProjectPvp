extends Node2D




const Player = preload("res://mesh_instance_2d.tscn")
const PORT = 9999
var enet_peer = ENetMultiplayerPeer.new()



func add_player(peer_id):
	var player = Player.instantiate()
	player.name = str(peer_id)
	add_child(player)




func upnp_setup():
	var upnp = UPNP.new()
	
	var discover_result = upnp.discover()
	
	
	print("Success! Join Address: %s" % upnp.query_external_address())


func _on_join_pressed():
	$host.hide()
	$join.hide()
	
	enet_peer.create_client("LocalHost", PORT)
	multiplayer.multiplayer_peer = enet_peer


func _on_host_pressed():
	$host.hide()
	$join.hide()
	
	
	enet_peer.create_server(PORT)
	multiplayer.multiplayer_peer = enet_peer
	multiplayer.peer_connected.connect(add_player)
	
	add_player(multiplayer.get_unique_id())
	
	upnp_setup()
