tool
extends EditorPlugin


func _enter_tree():
	#add_custom_type("AudioStreamPlayerRandom", "AudioStreamPlayer", preload("nodes/audio_stream_player_random.gd"), null)
	#add_custom_type("AudioStreamPlayer2DRandom", "AudioStreamPlayer2D", preload("nodes/audio_stream_player_2d_random.gd"), null)
	#add_custom_type("AudioStreamPlayer3DRandom", "AudioStreamPlayer3D", preload("nodes/audio_stream_player_3d_random.gd"), null)
	pass


func _exit_tree():
	#remove_custom_type("AudioStreamPlayerRandom")
	#remove_custom_type("AudioStreamPlayer2DRandom")
	#remove_custom_type("AudioStreamPlayer3DRandom")
	pass
