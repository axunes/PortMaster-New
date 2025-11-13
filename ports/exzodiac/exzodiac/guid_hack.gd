extends SceneTree

const DB_PATH := "/tmp/gamecontrollerdb.txt"

func _init():
	var guid := Input.get_joy_guid(0) # lol

	if guid != "" and FileAccess.file_exists(DB_PATH):
		var re := RegEx.new()
		re.compile("^[0-9a-fA-F]{32}")
		var patched := re.sub(FileAccess.get_file_as_string(DB_PATH), guid)
		var f := FileAccess.open(DB_PATH, FileAccess.WRITE)
		if f:
			f.store_string(patched)
			f.close()
	quit()
