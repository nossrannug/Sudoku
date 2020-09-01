extends Node2D

var selected_num = ""
var currently_selected_button = ""

var grid = [[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0]]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func grid_is_valid():
	for i in range(9):
		for j in range(9):
			if !grid_ok(i, j, grid[i][j]):
				return false
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_button_value(row, col, value):
	var text = ""
	if value > 0:
		text = str(value)
	var pos = (row*9+col)+1
	var button = get_node("Buttons/Button"+str(pos))
	button.text = text
	grid[row][col] = value
	if grid_ok(row, col, value):
		button.add_color_override("font_color", Color(0,0,0,1))
	else:
		button.add_color_override("font_color", Color(1,0,0,1))

func set_value(value):
	var button = get_node("Buttons/"+value)
	var pos = button.get_position_in_parent()
	var row = int(pos / 9)
	var col = pos % 9
	set_button_value(row, col, int(selected_num))
	for r in range(9):
		for c in range(9):
			set_button_value(r, c, grid[r][c])
		
func clear():
	for i in range(9):
		for j in range(9):
			set_button_value(i, j, 0)
			
func solve(r=0, c=0):
	if !grid_is_valid():
		return false
	var row = r
	var col = c
	if col > 8:
		col = 0
		row += 1
	if row > 8:
		return true
	if grid[row][col] != 0:
		return solve(row, col+1)
	for i in range(1, 10):
		set_button_value(row, col, i)
		if grid_ok(row,col, i):
			if solve(row,col+1):
				return true
	grid[row][col] = 0
	return false
	

func done():
	var count = 0
	for r in range(9):
		for c in range(9):
			if grid[r][c] != 0:
				count += 1
	return count == 81

func grid_ok(row, col, value):
	if !check_row(row, col, value):
		return false

	if !check_col(row, col, value):
		return false
	
	if !check_square(row, col, value):
		return false
	
	return true

func check_square(row, col, value):
	var r = int(row / 3) * 3
	var c = int(col / 3) * 3

	for i in range(3):
		for j in range(3):
			var v = grid[r+i][c+j]
			if v == 0 || (r+i == row && c+j == col):
				continue
			if v == value:
				return false
			
	return true

func check_row(row, col, value):
	for c in range(9):
		var v = grid[row][c]
		if v == 0 || c == col:
			continue
		if v == value:
			return false
	return true
			
		
func check_col(row, col, value):
	for r in range(9):
		var v = grid[r][col]
		if v == 0 || r == row:
			continue
		if v == value:
			return false
	return true
		

func select_value(value):
	if currently_selected_button != "":
		get_node(currently_selected_button).add_color_override("font_color", Color(0,0,0,1))
	if get_node("Buttons/"+value).text == selected_num:
		selected_num = ""
	else:
		currently_selected_button = "Buttons/"+value
		var button = get_node(currently_selected_button)
		selected_num = button.text
		button.add_color_override("font_color", Color(0,1,0,1))


func _on_Button1_pressed():
	set_value("Button1")

func _on_Button2_pressed():
	set_value("Button2")


func _on_Button3_pressed():
	set_value("Button3")


func _on_Button4_pressed():
	set_value("Button4")


func _on_Button5_pressed():
	set_value("Button5")


func _on_Button6_pressed():
	set_value("Button6")


func _on_Button7_pressed():
	set_value("Button7")


func _on_Button8_pressed():
	set_value("Button8")


func _on_Button9_pressed():
	set_value("Button9")


func _on_Button10_pressed():
	set_value("Button10")


func _on_Button11_pressed():
	set_value("Button11")


func _on_Button12_pressed():
	set_value("Button12")


func _on_Button13_pressed():
	set_value("Button13")


func _on_Button14_pressed():
	set_value("Button14")


func _on_Button15_pressed():
	set_value("Button15")


func _on_Button16_pressed():
	set_value("Button16")


func _on_Button17_pressed():
	set_value("Button17")


func _on_Button18_pressed():
	set_value("Button18")


func _on_Button19_pressed():
	set_value("Button19")


func _on_Button20_pressed():
	set_value("Button20")


func _on_Button21_pressed():
	set_value("Button21")


func _on_Button22_pressed():
	set_value("Button22")


func _on_Button23_pressed():
	set_value("Button23")


func _on_Button24_pressed():
	set_value("Button24")


func _on_Button25_pressed():
	set_value("Button25")


func _on_Button26_pressed():
	set_value("Button26")


func _on_Button27_pressed():
	set_value("Button27")


func _on_Button28_pressed():
	set_value("Button28")


func _on_Button29_pressed():
	set_value("Button29")


func _on_Button30_pressed():
	set_value("Button30")


func _on_Button31_pressed():
	set_value("Button31")


func _on_Button32_pressed():
	set_value("Button32")


func _on_Button33_pressed():
	set_value("Button33")


func _on_Button34_pressed():
	set_value("Button34")


func _on_Button35_pressed():
	set_value("Button35")


func _on_Button36_pressed():
	set_value("Button36")


func _on_Button37_pressed():
	set_value("Button37")


func _on_Button38_pressed():
	set_value("Button38")


func _on_Button39_pressed():
	set_value("Button39")


func _on_Button40_pressed():
	set_value("Button40")


func _on_Button41_pressed():
	set_value("Button41")


func _on_Button42_pressed():
	set_value("Button42")


func _on_Button43_pressed():
	set_value("Button43")


func _on_Button44_pressed():
	set_value("Button44")


func _on_Button45_pressed():
	set_value("Button45")


func _on_Button46_pressed():
	set_value("Button46")


func _on_Button47_pressed():
	set_value("Button47")


func _on_Button48_pressed():
	set_value("Button48")


func _on_Button49_pressed():
	set_value("Button49")


func _on_Button50_pressed():
	set_value("Button50")


func _on_Button51_pressed():
	set_value("Button51")


func _on_Button52_pressed():
	set_value("Button52")


func _on_Button53_pressed():
	set_value("Button53")


func _on_Button54_pressed():
	set_value("Button54")


func _on_Button55_pressed():
	set_value("Button55")


func _on_Button56_pressed():
	set_value("Button56")


func _on_Button57_pressed():
	set_value("Button57")


func _on_Button58_pressed():
	set_value("Button58")


func _on_Button59_pressed():
	set_value("Button59")

func _on_Button60_pressed():
	set_value("Button60")


func _on_Button61_pressed():
	set_value("Button61")


func _on_Button62_pressed():
	set_value("Button62")


func _on_Button63_pressed():
	set_value("Button63")


func _on_Button64_pressed():
	set_value("Button64")


func _on_Button65_pressed():
	set_value("Button65")


func _on_Button66_pressed():
	set_value("Button66")


func _on_Button67_pressed():
	set_value("Button67")


func _on_Button68_pressed():
	set_value("Button68")


func _on_Button69_pressed():
	set_value("Button69")


func _on_Button70_pressed():
	set_value("Button70")


func _on_Button71_pressed():
	set_value("Button71")


func _on_Button72_pressed():
	set_value("Button72")


func _on_Button73_pressed():
	set_value("Button73")

func _on_Button74_pressed():
	set_value("Button74")

func _on_Button75_pressed():
	set_value("Button75")

func _on_Button76_pressed():
	set_value("Button76")

func _on_Button77_pressed():
	set_value("Button77")

func _on_Button78_pressed():
	set_value("Button78")

func _on_Button79_pressed():
	set_value("Button79")

func _on_Button80_pressed():
	set_value("Button80")

func _on_Button81_pressed():
	set_value("Button81")

func _on_Button82_pressed():
	select_value("Button82")

func _on_Button83_pressed():
	select_value("Button83")

func _on_Button84_pressed():
	select_value("Button84")

func _on_Button85_pressed():
	select_value("Button85")

func _on_Button86_pressed():
	select_value("Button86")

func _on_Button87_pressed():
	select_value("Button87")

func _on_Button88_pressed():
	select_value("Button88")

func _on_Button89_pressed():
	select_value("Button89")

func _on_Button90_pressed():
	select_value("Button90")

func _on_Button91_pressed():
	solve()

func _on_Button92_pressed():
	clear()
