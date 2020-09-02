// Script File for Show Debug Message

#region //macros

#macro A show_debug_message("A " + string(current_time));
#macro B show_debug_message("B " + string(current_time));
#macro C show_debug_message("C " + string(current_time));

#endregion

#region //utility functions

/// @function print(...arg)
/// @param {variables} ....args
/// @description Functions like show_debug_message except that it 
///				 automatically turns non-strings into strings and
///				 different arguments are separated by a common.
///				 Example: print("Hello World. This is ", name, "!", " I am ", age);
///				 where name is variable that holds a string and age
///				 is a variable which holds a number.
function print() {
	var final_text = "";
	for (var i = 0; i < argument_count; i += 1) {
	   if (is_string(argument[i])) {
	       final_text += argument[i];
	   } else {
	       final_text += string(argument[i]);
	   }
	}
	show_debug_message(final_text);
}


/// @function print_start([optional_string])
/// @param {string} optional_string
/// @description A function that can be used make the start of 
///				 a debug message in the output window more visible.
///              can take an option argument
function print_start() {
    var _optional_string = argument_count = 1 ? (" " + argument[0]) : "";
	print("\n//////////", _optional_string, " START //////////");
}


/// @function print_end([optional_string])
/// @param {string} optional_string
/// @description A function that can be used make the end of 
///				 a debug message in the output window more visible.
function print_end() {
    var _optional_string = argument_count = 1 ? (" " + argument[0]) : "";
	print("//////////", _optional_string, " END //////////\n");
}


/// @function print_object_and_instance_id()
/// @description Print the object id of the instance this scrip is called in.
function print_instance_info() {
	print("INSTANCE ID: ", id, ". INSTANCE OF OBJECT ", object_get_name(object_index));
}

#endregion













