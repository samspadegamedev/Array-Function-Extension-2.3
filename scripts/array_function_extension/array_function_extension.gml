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


/// @function array_swap_indexes(array, index_1, index_2)
/// @param {array_id} array				
/// @param {int} index_1				
/// @param {int} index_2
/// @description Swaps two positions in an array. It does return the array; however, it swaps them in position.
function array_swap_indexes(_array, _index_1, _index_2) {
    var _temp = _array[_index_1];
    _array[@ _index_1] = _array[_index_2];
    _array[@ _index_2] = _temp;
    return _array;
}
    

/// @function array_copy_simple(array)
/// @param {array_id} array		
/// @description Returns a copy of the array
function array_copy_simple(_array) {
    var _new_array = [];
	array_copy(_new_array, 0, _array, 0, array_length(_array));
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
            array_push(_new_array, _array[i]);
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


/// @function array_find_index_custom_last(array, script, [...script_arguments_array])
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
        array_swap_indexes(_array, irandom(_length - 1), irandom(_length - 1));
    }
    return _array;
}


/// @function array_filter(array, script)
/// @param {array_id} array
/// @param {script_id} filter_script
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


/// @function array_reduce(array, script)
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


/// @function array_for_each_copy(array, script)
/// @param {array_id} array
/// @param {scripts} script_id
/// @description Copies the array and performs the script on each element of the copied array. Note - returns a new array. MUST be assigned to be any use.
function array_for_each_copy(_array, _script) {   
    var _length, _new_array;
    _length = array_length(_array);
    _new_array = array_copy_simple(_array);    
    for (var i = 0; i < _length; i++) {
        _new_array[i] = _script(_array[i]);
    }
    return _new_array;   
}


