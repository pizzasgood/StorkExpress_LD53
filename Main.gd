extends Node


@onready var time_started := Time.get_ticks_msec()


func _process(_delta) -> void:
	var completed := len(get_tree().get_nodes_in_group("complete_targets"))
	var total := len(get_tree().get_nodes_in_group("targets"))
	var babies := len(get_tree().get_nodes_in_group("babies"))
	%CompletionLabel.text = "Deliveries Completed: {completed}/{total}".format({"completed": completed, "total": total})
	var now := Time.get_ticks_msec()
	var seconds :=  (now - time_started)/1000.0
	%TimeLabel.text = "Time Taken: {seconds}s".format({"seconds": round(seconds)})
	if completed == total:
		%VictoryMenu.victory(seconds, babies - total)

