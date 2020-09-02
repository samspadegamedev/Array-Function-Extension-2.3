// Script File to add additional array functionality

/// @function array_valid_index(array, index)
/// @param {array_id} array
/// @param {int} index
/// @description Returns true if the index is a valid index for the array. Otherwise returns false. 
function array_valid_index(_array, _index) {
    if (is_real(_index)) {
        if (_index == floor(_index)) {
            if (_index >= 0) && (_index < array_length(_array)) {
                return true;
            }
        }
    }   
    return false;
} 


/// @function array_swap_positions(array, position_1, position_2)
/// @param {array_id} array			
/// @param {int} position_1				
/// @param {int} position_2
/// @description Swaps two positions in an array. It does return the array; however, it swaps them in position.
function array_swap_positions(_array, _pos_1, _pos_2) {
    var _temp = _array[_pos_1];
    _array[@ _pos_1] = _array[_pos_2];
    _array[@ _pos_2] = _temp;
    return _array;
}
    
    
/// @function array_copy_shallow(array)
/// @param {array_id} array		
/// @description Copies an array and returns the copied array. 
/// You must assign the returned array to a variable for it to work. 
/// This is a shallow copy, and does not copy nested levels. 
/// If you want to copy nested levels, use array_copy_deep.
function array_copy_shallow(_array) {
    var _length, _new_array;
    _length = array_length(_array);
    _new_array = array_create(_length);
    array_copy(_new_array, 0, _array, 0, _length);
    return _new_array;
}    
 
   
/// @function array_copy_deep(array)
/// @param {array_id} array
/// @description Returns a deep copy of the provided array. It will copy over any nested arrays. Note - returns a new array. MUST be assigned to be any use.
function array_copy_deep(_array) {
    var _new_array, _length;
    _new_array = [];
    _length = array_length(_array);
    for(var i = 0; i < _length; i++){
        if(is_array(_array[i])) {
            array_add_to_end(_new_array, array_copy_deep(_array[i]));  
        } else {
            array_add_to_end(_new_array, _array[i]);
        }
    } 
    return _new_array;
}
    
    
/// @function array_add_to_end(array, val1 [, val2, ... max_val])
/// @param {array_id} array
/// @param {variable} value_1
/// @param {variables} ...values			
/// @description Add variables to the end of an array. It does return the array; however, it will add them to the array itself. 
function array_add_to_end() {
    var _array = argument[0];   
    for (var i = 1; i < argument_count; i += 1) {
        _array[@ array_length(_array)] = argument[i];
    }    
    return _array;
}
    
    
/// @function array_insert(array, position, val1 [, val2, ... max_val])
/// @param {array_id} array
/// @param {int} position
/// @param {variable} value_1
/// @param {variables} ...values
/// @description Inserts the values specified starting at the specified point. It does return the array; however, it will add them to the array itself. 
function array_insert() {
    var _array, _pos, _amount_to_add, _new_length;
    _array = argument[0];
    _pos = argument[1];
    _amount_to_add = argument_count - 2;
    _new_length = array_length(_array) + _amount_to_add;

    if (_pos > array_length(_array)) return _array;

    for (var i = _new_length - 1; i >= 0; i--) {
        if (i < _pos) {
            _array[@ i] = _array[i];
        } else if (i >= _pos + _amount_to_add) {
            _array[@ i] = _array[i - _amount_to_add];
        } else {
            _array[@ i] = argument[i - _pos + 2];
        }
    }

    return _array;
}
    
    
/// @function array_delete(id, position, amount)
/// @param {array_id} id
/// @param {int} position
/// @param {int} amount
/// @description Deletes the amount of values specified starting at the specified position. Note - returns a new array. MUST be assigned to be any use. Note - due to the way this script works, it will not error out if you use position or amounts outside of the array's range, but it will not work the way you think it will.
function array_delete(_id, _position, _amount) {
    var _amount_to_delete, _length, _new_array;
    _length = array_length(_id);
    _amount_to_delete = min(_length - _position, _amount);
    _new_array = array_create(_length - _amount_to_delete);

    for (var i = 0; i < _length - _amount_to_delete; i++) {
        if (i < _position) {
            _new_array[i] = _id[i];
        } else {
            _new_array[i]= _id[i + _amount_to_delete];
        }
    }

    return _new_array;
}    
    
    
/// @function array_splice(array, position, amount_to_delete, val1 [, val2, ... max_val])
/// @param {array_id} array
/// @param {int} position
/// @param {int} amount_to_delete
/// @param {variable} value_1
/// @param {variables} ...values
/// @description First deletes teh amount of values specified starting at the specified position. Then adds in the new values starting at that position. Note - this will return a new list.
function array_splice() {
    var _array, _position, _amount_to_delete, _amount_to_add, _new_array;
    _array = argument[0];
    _position = argument[1];
    _amount_to_delete = argument[2];
    _amount_to_add = argument_count - 3;

    _new_array = array_delete(_array, _position, _amount_to_delete);

    for (var i = array_length(_new_array) + _amount_to_add - 1; i >= 0; i--) {
        if (i < _position) {
            _new_array[@ i] = _new_array[i];
        } else if (i >= _position + _amount_to_add) {
            _new_array[@ i] = _array[i - _amount_to_add];
        } else {
            _new_array[@ i] = argument[i - _position + 3];
        }
    }

    return _new_array;
}    
    
    

/// @function array_join(array, array, [...arrays])
/// @param {array_id} array
/// @param {array_id} array
/// @param {array_id} ...arrays
/// @description Combines multiple arrays into one, and returns the new array. Note - returns a new array. MUST be assigned to be any use.
function array_join() {
    var _new_array, _counter, _current_array;
    _new_array = [];
    _counter = 0;

    for (var i = 0; i < argument_count; i++) {
        _current_array = argument[i];
        for (var j = 0; j < array_length(_current_array); j++) {
            _new_array[_counter++] = _current_array[j];
        }
    }

    return _new_array;
}    
    
    
/// @function list_to_array_shallow(list)
/// @param {ds_list} list
/// @description Takes a list and returns an array. Note - this function does not destroy the list. Note - This is a shallow copy.
function list_to_array_shallow(_list) {
    var _length, _new_array;
    _length = ds_list_size(_list);
    _new_array = array_create(_length);

    for (var i = 0; i < _length; i += 1) {
        _new_array[i] = _list[| i];
    }

    return _new_array;
}    
    
    
/// @function array_to_list_shallow(array)
/// @param {array_id} array
/// @description Takes an array and returns an list. Note - this function creates and returns a list. This list must be destroyed at some point. Note - this is a shallow copy only. Will not create nested lists.
function array_to_list_shallow(_array)
{
    var _new_list, _length;
    _new_list = ds_list_create();
    _length = array_length(_array)
    for (var i = 0; i < _length; i += 1) {
        ds_list_add(_new_list, _array[i]);
    }

    return _new_list;
}    
    
    
/// @function array_to_list_deep(array)
/// @param {array_id} array
/// @description Takes an array and returns an list. Note - this function creates and returns an list. This list must be destroyed at some point. Note - this is a deep copy and will create nested lists. This lists must be destroyed as well. Switching ds_list_add with list_add_list will mark all sub lists as lists, allowing for automatic destruction of sub lists when destroying the main list.
function array_to_list_deep(_array) {
    var _new_list, _length;
    _new_list = ds_list_create();
    _length = array_length(_array)
    for(var i = 0; i < _length; i++){
        if(is_array(_array[i])) {
            ds_list_add(_new_list, array_to_list_deep(_array[i]));  
        } else {
            ds_list_add(_new_list, _array[i]);
        }
    }    
    return _new_list;
}    
    
    
/// @function array_flatten(array)
/// @param {array_id} array
/// @description Recursively loops through the provided array and returns a new array the contains the values of the old array without any nesting. Note - will remove any completely empty arrays.  Note - returns a new array. MUST be assigned to be any use.
function array_flatten(_array) {
    var _new_array, _length; 
    _new_array = [];
    _length = array_length(_array);
    
    for(var i = 0; i < _length; i++){
        if(is_array(_array[i])) {
            _new_array = array_join(_new_array, array_flatten(_array[i]));  
        } else {
            array_add_to_end(_new_array, _array[i]);
        }
    } 

    return _new_array;
}    
    
    
/// @function array_find_index(array, value)
/// @param {array_id} array
/// @param {variable} value
/// @description Returns the first index of the value specified, searching from left to right. Returns -1 if the value is not found.
function array_find_index(_array, _value){
    var _length = array_length(_array);
    for (var i = 0; i < _length; i++) {
        if (_array[i] == _value) {
            return i;
        }
    }
    return -1;    
}  

/// @function array_find_index_last(array, value)
/// @param {array_id} array
/// @param {variable} value
/// @description Returns the last index of the value specified, searching from right to left. Returns -1 if the value is not found.
function array_find_index_last(_array, _value) {
    var _length = array_length(_array);
    for (var i = array_length(_array) - 1; i >= 0; i--) {
        if (_array[i] == _value) {
            return i;
        }
    }
    return -1;    
}
    

/// @function array_find_index_custom(array, script, [...script_arguments_array])
/// @param {array_id} array
/// @param {script_id} script
/// @param {array} script_arguments_array
/// @description Returns the first index of the value specified, searching from left to right. Returns -1 if the value is not found.
function array_find_index_custom(_array, _script) {
    var _length = array_length(_array);
    for (var i = 0; i < _length; i++) {
        if (_script(_array[i])) {
            return i;
        }
    }
    return -1;    
}


/// @function array_find_index_last_custom(array, script, [...script_arguments_array])
/// @param {array_id} array
/// @param {script_id} script
/// @param {array} script_arguments_array
/// @description Returns the last index of the value specified, searching from right to left. Returns -1 if the value is not found.
function array_find_index_custom_last(_array, _script) {
    for (var i = array_length(_array) - 1; i >= 0; i--) {
        if (_script(_array[i])) {
            return i;
        }
    }
    return -1;    
}


/// @function array_find_index_all(array, value)
/// @param {array} array
/// @param {variable} value
/// @description Returns an array of all indexs containing the value specified, searching from left to right. Returns an empty array if the value is not found.
function array_find_index_all(_array, _value) {
    var _length, _new_array, _counter;
    _length = array_length(_array);
    _new_array = [];
    _counter = 0;
    
    for (var i = 0; i < _length; i++) {
        if (_array[i] == _value) {
            _new_array[_counter++] = i;
        }
    }

    return _new_array;
}    
    

/// @function array_find_index_all_custom(array, script, [...script_arguments_array])
/// @param {array_id} array
/// @param {script_id} script
/// @description Returns an array of all indexs containing the value specified, searching from left to right. Returns an empty array if the value is not found.
function array_find_index_all_custom(_array, _script) {
    var _new_array, _counter, _length;
    _length = array_length(_array);
    _new_array = [];
    _counter = 0;
    for (var i = 0; i < _length; i++) {
        if (_script(_array[i])) {
            _new_array[_counter++] = i;
        }
    }

    return _new_array;
}
    
    
/// @function array_every(array, script, [...script_arguments_array])
/// @param {array_id} array
/// @param {script_id} script
/// @param {array} script_arguments_array
/// @description Returns true if all values matche.
function array_every(_array, _script) {
    var _length = array_length(_array);

    for (var i = 0; i < _length; i++) {
        if (!_script(_array[i])) {
            return false;
        }
    }

    return true;
}


/// @function array_some(array, script, [...script_arguments_array])
/// @param {array_id} array
/// @param {script_id} script
/// @param {array} script_arguments_array
/// @description Returns true if at least one value matches.
function array_some(_array, _script) {
    var _length = array_length(_array);

    for (var i = 0; i < _length; i++) {
        if (_script(_array[i])) {
            return true;
        }
    }

    return false;    
}


/// @function array_shuffle(array)
/// @param {array} array
/// @description Randomizes the order of an array. It does return the array, however, it will add them to the array itself. 
function array_shuffle(_array) {
    var _length = array_length(_array);
    repeat (_length) {
        array_swap_positions(_array, irandom(_length - 1), irandom(_length - 1));
    }
    return _array;
}


/// @function array_filter(array, script, [script_arguments_array])
/// @param {array_id} array
/// @param {script_id} filter_script
/// @param {array} script_arguments_array
/// @description Creates and returns a new array that only has the values from the prior array that meet the requirement of the filter script.
function array_filter(_array, _script) {
    var _length, _new_array, _counter;
    _length = array_length(_array);
    _new_array = [];
    _counter = 0;
    for (var i = 0; i < _length; i += 1) {
        if (_script(_array[i])) {
            _new_array[_counter++] = _array[i];
        }
    }
    return _new_array;
}


/// @function array_reduce(array, script, [script_arguments_array])
/// @param {array_id} array
/// @param {script_id} filter_script
/// @description Returns the total value of all numbers in an array. Note - this script will cause an error if the array contains anything except numbers.
function array_reduce(_array, _script) {
    var _length, _accumulator;
    _length = array_length(_array);
    _accumulator = 0;
    for (var i = 0; i < _length; i++) {
        _accumulator += _script(_array[i]);
    }
    return _accumulator;   
}


/// @function array_sort(array, sorting_script)
/// @param {array_id} array
/// @param {script} sorting_script
/// @description Sorts an array using the sorting script provided. Modifies and eturns the original array. Does not need to be assigned. Uses a simple bubble sort: Time Complexity is O(n^2)
function array_sort(_array, _script) {
    var _no_change;
    for (var i = array_length(_array); i > 0; i -= 1) {
        _no_change = true;
        for (var j = 0; j < i - 1; j+= 1) {
            if (_script(_array[j], _array[j + 1])) {
                array_swap_positions(_array, j, j + 1);
                _no_change = false;
            }
        }
        if (_no_change) break;
    }
    return _array;
}


/// @function array_reverse(array)
/// @param {array_id} array
/// @description Returns the array in reverse order.
function array_reverse(_array) {
    var _position_1, _position_2, _position_3;
    _position_1 = 0;
    _position_2 = array_length(_array);
    while (_position_1 < --_position_2) {
        _position_3 = _array[_position_1];
        _array[_position_1++] = _array[_position_2];
        _array[_position_2] = _position_3;
    }
    return _array;
}


/// @function array_for_each(array, script, [script_arguments_array])
/// @param {array_id} array
/// @param {scripts} script_id
/// @param {array} script_arguments_array
/// @description Performs the script on each element of the array. It does return the array, however, it will add them to the array itself. 
function array_for_each(_array, _script) {
    var _length = array_length(_array);   
    for (var i = 0; i < _length; i++) {
        _array[@ i] = _script(_array[i]);
    }
    return _array;
}


/// @function array_for_each_copy(array, script, [script_arguments_array])
/// @param {array_id} array
/// @param {scripts} script_id
/// @param {array} script_arguments_array
/// @description Copies the array and performs the script on each element of the copied array. Note - returns a new array. MUST be assigned to be any use.
function array_for_each_copy(_array, _script) {   
    var _length, _new_array;
    _length = array_length(_array);
    _new_array = array_copy_shallow(_array);    
    for (var i = 0; i < _length; i++) {
        _new_array[i] = _script(_array[i]);
    }
    return _new_array;   
}










