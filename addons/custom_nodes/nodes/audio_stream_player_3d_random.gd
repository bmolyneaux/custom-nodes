tool
extends AudioStreamPlayer3D
class_name AudioStreamPlayer3DRandom
# Plays in 3D, choosing randomly from an Array of AudioStream.

export(Array, AudioStream) var streams setget set_streams
export(bool) var loop

var _rng = RandomNumberGenerator.new()

# Prevent looping in the case that we just stopped playback
var _just_stopped = false


func play(from_position: float = 0.0):
	if streams.empty():
		push_warning("AudioStreamPlayer3DRandom has no streams to play")
		return
		
	_just_stopped = false

	var index = _rng.randi_range(0, streams.size() - 1)
	stream = streams[index]
	
	# Don't allow an individual sample to loop
	if stream is AudioStreamSample:
		stream.loop_mode = AudioStreamSample.LOOP_DISABLED
	
	.play(from_position)
	

func _init():
	_rng.randomize()
	stream = null
	connect("finished", self, "_finished")


func _ready():
	if autoplay:
		play(0)


func _finished():
	if loop and not _just_stopped:
		play(0)
	_just_stopped = false


func _set(property : String, value):
	if property == "stream" and value != null:
		push_warning("AudioStreamPlayer stream property cannot be set")
		stream = null
		return true

	if property == "playing":
		if value:
			play(get_playback_position())
		else:
			_just_stopped = true
			stop()

	return false


func _get_configuration_warning() -> String:
	if streams.empty():
		return "Streams must be specified"

	for s in streams:
		if s == null:
			return "One of the specified streams is empty"

	return ""


func set_streams(value):
	streams = value
	update_configuration_warning()
