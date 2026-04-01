/// @param low1
/// @param high1
/// @param low2
/// @param high2*
function ranges_overlap() {

	var low1 = argument[0];
	var high1 = argument[1];
	var low2 = argument[2];
	var high2 = undefined;
	if (argument_count > 3) high2 = argument[3];

	if (high2 != undefined) {
		return max(low1, low2) <= min(high1, high2) //(high2 <= high1 && high2 >= low1) || (low2 <= high1 && low2 >= low1) || (high1 <= high2 && high1 >= low2)
	} else {
		return low2 == clamp(low2, low1, high1)
	}


}
