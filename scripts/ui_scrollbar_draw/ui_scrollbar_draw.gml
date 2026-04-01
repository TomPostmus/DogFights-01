/// @param scrollbar
function ui_scrollbar_draw() {

	var scrollbar = argument[0];

	//Position sub-elements
	with (scrollbar) {
		bar.left = left
		button_up.left = left
		button_down.left = left

		var scrollbar_range = height - (width+parts_margin)*2 - bar.height

		button_up.top = top
		bar.top = top + button_up.height + parts_margin + ceil((scrollbar_range)*scroll_value)
		button_down.top = top + button_up.height + parts_margin + scrollbar_range + bar.height + parts_margin
	}

	ui_button_draw(scrollbar.button_down)
	ui_button_draw(scrollbar.bar)
	ui_button_draw(scrollbar.button_up)


}
