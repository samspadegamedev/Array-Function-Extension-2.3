/// @description Automated Tests


#region //automated tests

#region ///array_valid_index test
array = [0, 1, 3, 4, 5];
assert(array_valid_index(array, 0), "Invalid Index");
assert(array_valid_index(array, 1), "Invalid Index");
assert(array_valid_index(array, 2), "Invalid Index");
assert(array_valid_index(array, 3), "Invalid Index");
assert(array_valid_index(array, 4), "Invalid Index");
assert_fail(array_valid_index(array, -1), "Valid Index");
assert_fail(array_valid_index(array, 1.5), "Valid Index");
assert_fail(array_valid_index(array, 5), "Valid Index");
assert_fail(array_valid_index(array, "Hello World"), "Valid Index");
assert_fail(array_valid_index(array, -1), "Valid Index");

array = [];
assert_fail(array_valid_index(array, -1), "Valid Index");
assert_fail(array_valid_index(array, 0.5), "Valid Index");
assert_fail(array_valid_index(array, 1), "Valid Index");
assert_fail(array_valid_index(array, "Hello World"), "Valid Index");
#endregion

#region ///array_swap_indexes test
array = [0, 1];
array_swap_indexes(array, 0, 1);
assert(array_equals([1, 0], array), "Arrays arn't equal");

array = [0, [], 1];
array_swap_indexes(array, 2, 1);
assert(array_equals([0, 1, []], array), "Arrays arn't equal");
#endregion

#region ///array_copy_simple test
array = [0, 1, "Hello World"];
shallow_copy = array_copy_simple(array);
assert(array_equals(shallow_copy, array), "Arrays arn't equal");
assert(array_equals(shallow_copy, [0, 1, "Hello World"]), "Arrays arn't equal");

array = [];
shallow_copy = array_copy_simple(array);
assert(array_equals(shallow_copy, array), "Arrays arn't equal");
assert(array_equals([], array), "Arrays arn't equal");

array = [[1, 2], [3, 4]];
shallow_copy = array_copy_simple(array);
assert(array_equals([[1, 2], [3, 4]], array), "Arrays are equal");
assert(array_equals([[1, 2], [3, 4]], array), "Arrays are equal");
#endregion

#region ///array_copy_deep test
array = [0, 1, 2, [0, 1, 2, 3, 4, 5], 3, [], [[0, 1, 2]], 4, 5];
deep_copy = array_copy_simple(array);
assert(array_equals(deep_copy, array), "Arrays arn't equal");
assert(array_equals(deep_copy, array), "Arrays arn't equal");
#endregion

#region ///array_add test
array = [0, 1];
assert(array_equals([0, 1], array), "Arrays arn't equal");
array_push(array);
assert(array_equals([0, 1], array), "Arrays arn't equal");
array_push(array, "Hello World");
assert(array_equals([0, 1, "Hello World"], array), "Arrays arn't equal");
array_push(array, 2, 3, 4, "Goodbye");
assert(array_equals([0, 1, "Hello World", 2, 3, 4, "Goodbye"], array), "Arrays arn't equal");
#endregion

#region ///array_delete test
array = [0, 1, "Hello World"];
assert(array_equals([0, 1, "Hello World"], array), "Arrays arn't equal");
array_delete(array, 0, 2);
assert(array_equals(["Hello World"], array), "Arrays arn't equal");

array = [0, 1, 2, 3, 4, 5];
assert(array_equals([0, 1, 2, 3, 4, 5], array), "Arrays arn't equal");
array_delete(array, 5, 5);
assert(array_equals([0, 1, 2, 3, 4], array), "Arrays arn't equal");

array = [1, 2, 3, 4, 5];
assert(array_equals([1, 2, 3, 4, 5], array), "Arrays arn't equal");

array = [];
array_delete(array, 0, 0);
assert(array_equals([], array), "Arrays arn't equal");

#endregion

#region ///array_insert test
array = [0, 1, "Hello World"];
assert(array_equals([0, 1, "Hello World"], array), "Arrays arn't equal");
array_insert(array, 0, 2);
assert(array_equals([2, 0, 1, "Hello World"], array), "Arrays arn't equal");
array_insert(array, 4, "Goodbye", "Hello", 1, 2, 4);
assert(array_equals([2, 0, 1, "Hello World", "Goodbye", "Hello", 1, 2, 4], array), "Arrays arn't equal");


array = [0, 1, 2, 3, 4, 5];
assert(array_equals([0, 1, 2, 3, 4, 5], array), "Arrays arn't equal");
array_insert(array, 5, "Hello World", "Goodbye");
assert(array_equals([0, 1, 2, 3, 4, "Hello World", "Goodbye", 5], array), "Arrays arn't equal");
#endregion


#region ///array_find_index test
array = [0, 1, "Hello World", 2, 3, 4, 5];
assert_equal(array_find_index(array, 1), 1);
assert_equal(array_find_index(array, "Hello World"), 2);
assert_equal(array_find_index(array, "Goodbye"), -1);


array = [];
assert_equal(array_find_index(array, "Goodbye"), -1);
#endregion

#region ///array_find_index_custom test
array = [[0, 1, [2]], 1, "Hello World", 2, [0, 1, 2], "Hello World", 1];
assert_equal(array_find_index_custom(array, function(_value) {
    return _value == 1;
}), 1);
assert_equal(array_find_index_custom(array, function(_value) {
    return _value == "Hello World";
}), 2);
assert_equal(array_find_index_custom(array, function(_value) {
    return _value == "Goodbye";
}), -1);
assert_equal(array_find_index_custom(array, function(_value) {
    return is_array(_value) ? array_equals(_value, [0, 1, [2]]) : false;
}), 0);
assert_equal(array_find_index_custom(array, function(_value) {
    return is_array(_value) ? array_equals(_value, [0, 2]) : false;
}), -1);


array = [];
assert_equal(array_find_index_custom(array, function(_value) {
    return _value == "Goodbye";
}), -1);
assert_equal(array_find_index_custom(array, function(_value) {
    return is_array(_value) ? array_equals(_value, [0, 2]) : false;
}), -1);
#endregion

#region ///scr_array_find_index_last test
array = [0, 1, "Hello World", 1, 3, 4, 5];
assert_equal(array_find_index_last(array, 1), 3);
assert_equal(array_find_index_last(array, "Goodbye"), -1);


array = [];
assert_equal(array_find_index_last(array, "Goodbye"), -1);
#endregion

#region ///array_find_index_last_custom test
array = [[0, 1, 2], 1, "Hello World", 2, [0, 1, 2], "Hello World", 1];
assert_equal(array_find_index_custom_last(array, function(_value) {
    return _value == 1;
}), 6);
assert_equal(array_find_index_custom_last(array, function(_value) {
    return _value == "Hello World";
}), 5);
assert_equal(array_find_index_custom_last(array, function(_value) {
    return _value == "Goodbye";
}), -1);
assert_equal(array_find_index_custom_last(array, function(_value) {
    return is_array(_value) ? array_equals(_value, [0, 1, 2]) : false;
}), 4);
assert_equal(array_find_index_custom_last(array, function(_value) {
    return is_array(_value) ? array_equals(_value, [0, 2]) : false;
}), -1);


array = [];
assert_equal(array_find_index_custom_last(array, function(_value) {
    return _value == "Goodbye";
}), -1);
assert_equal(array_find_index_custom_last(array, function(_value) {
    return is_array(_value) ? array_equals(_value, [0, 2]) : false;
}), -1);
#endregion

#region ///array_find_index_all test
array = [0, 1, "Hello World", 1, 3, 1, 5];
assert_equal(array_find_index_all(array, 1), [1, 3, 5]);
assert_equal(array_find_index_all(array, "Hello World"), [2]);
assert_equal(array_find_index_all(array, "Goodbye"), []);


array = [];
assert_equal(array_find_index_all(array, "Hello World"), []);
#endregion

#region ///array_find_index_all test
array = [0, 1, "Hello World", 1, 3, 1, 5];
assert_equal(array_find_index_all_custom(array, function(_value) {
    return _value == 1;
}), [1, 3, 5]);
assert_equal(array_find_index_all_custom(array, function(_value) {
    return _value == "Hello World";
}), [2]);
assert_equal(array_find_index_all_custom(array, function(_value) {
    return _value == "Goodbye";
}), []);


array = [];
assert_equal(array_find_index_all_custom(array, function(_value) {
    return _value == "Hello World";
}), []);
#endregion

#region ///array_accumulate test
array = [0, 1, 2, 3, 4, 5];
assert_equal(array_reduce(array, function(_value) {
    return _value;
}), 15);
assert_equal(array_reduce(array, function(_value) {
    return _value > 3 ? _value : 0;
}), 9);
array = [];
assert_equal(array_reduce(array, function(_value) {
    return _value > 3 ? _value : 0;
}), 0);
#endregion

#region ///array_join test
array_a = [0, 1, 2, 3, 4, 5];
array_b = [6, 7, 8];
assert(array_equals([0, 1, 2, 3, 4, 5, 6, 7, 8], array_join(array_a, array_b)), "Arrays arn't equal");

array_a = [];
array_b = [6, 7, 8];
assert(array_equals([6, 7, 8], array_join(array_a, array_b)), "Arrays arn't equal");


array_a = [0, 1, 2, 3, 4, 5];
array_b = [6, 7, 8];
array_c = [9, 10, "Hello World"];
assert(array_equals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "Hello World"], array_join(array_a, array_b, array_c)), "Arrays arn't equal"); 
assert(array_equals([9, 10, "Hello World", 0, 1, 2, 3, 4, 5, 6, 7, 8], array_join(array_c, array_a, array_b)), "Arrays arn't equal"); 

#endregion

#region ///array_flatten test
array = [0, 1, 2, [0, 1, 2, 3, 4, 5], 3, [[]], 4, 5];
assert(array_equals([0, 1, 2, 0, 1, 2, 3, 4, 5, 3, 4, 5], array_flatten(array)), "Arrays arn't equal"); 
#endregion

#region //array_sort test
array = [0, 4, 5, 1, 4, 5, -4];
array_sort(array, function(_value_1, _value_2) {
    return _value_1 > _value_2;
});
assert(array_equals([-4, 0, 1, 4, 4, 5, 5], array), "Arrays arn't equal"); 
array_sort(array, function(_value_1, _value_2) {
    return _value_1 < _value_2;
});
assert(array_equals([5, 5, 4, 4, 1, 0, -4], array), "Arrays arn't equal"); 

#endregion

#region //array_reverse
array = [0, 1, 2, 3];
assert(array_equals([3, 2, 1, 0], array_reverse(array)), "Arrays arn't equal");

array = [0, 1, "Hello World", 2, 3];
assert(array_equals([3, 2, "Hello World", 1, 0], array_reverse(array)), "Arrays arn't equal"); 

array = [];
assert(array_equals([], array_reverse(array)), "Arrays arn't equal"); 
#endregion

#region ///array_filter test
array = [0, 1, 2, 3, 4, 5, "Hello World", "Goodbye"];
assert(array_equals([0, 2, 4], array_filter(array, function(_value) {
    if (is_real(_value)) {
        return (_value % 2) == 0 ? true : false;
    } 
    return false;
})), "Arrays arn't equal"); 
assert(array_equals(["Hello World", "Goodbye"], array_filter(array, function() {
    return is_string(argument0);
})), "Arrays arn't equal"); 
assert(array_equals([0, 1, 2, 3, 4, 5], array_filter(array, function() {
    return is_real(argument0);
})), "Arrays arn't equal"); 
array = [0, 1, 2, 3, 4, 5];
assert(array_equals([3, 4, 5], array_filter(array, function(_value){
    return _value > 2;
})), "Arrays arn't equal"); 

#endregion

#region //array_every Test
array = [0, 1, 2];
assert(array_every(array, function(_value) {
    return is_real(_value);
}));
array = [0, 1, 2, "Hello World"];
assert_fail(array_every(array, function(_value) {
    return is_real(_value);
}));

array = [0.5, 1, 2];
assert(array_every(array, function(_value) {
    return _value > 0;
}));
assert_fail(array_every(array, function(_value) {
    return _value > 1;
}));
#endregion

#region //array_some Test
array = [0, 1, 2];
assert(array_some(array, function(_value) {
    return is_real(_value);
}));
array = [0, 1, 2, "Hello World"];
assert(array_some(array, function(_value) {
    return is_real(_value);
}));
array = ["Hello World", "Goodbye"];
assert_fail(array_some(array, function(_value) {
    return is_real(_value);
}));
array = [];
assert_fail(array_some(array, function(_value) {
    return is_real(_value);
}));

array = [0.5, 1, 2];
assert(array_some(array, function(_value) {
    return _value > 0;
}));
assert_fail(array_some(array, function(_value) {
    return _value > 5;
}));
#endregion

#region ///array_for_each test
array = [0, 1, 2];
assert(array_equals([5, 6, 7], array_for_each(array, function(_value) {
    return _value + 5;
})), "Arrays arn't equal"); 
assert(array_equals([6, 7, 8], array_for_each(array, function(_value) {
    return _value + 1;
})), "Arrays arn't equal"); 
#endregion

#region ///array_for_each_copy test
array = [0, 1, 2];
map_1 = array_for_each_copy(array, function(_value) {
    return _value + 5;
});
map_2 = array_for_each_copy(array, function(_value) {
    return _value + 1;
})
assert(array_equals([5, 6, 7], map_1), "Arrays arn't equal"); 
assert(array_equals([1, 2, 3], map_2), "Arrays arn't equal"); 
#endregion

#region ///array_to_list_shallow and list_to_array_shallow test
array = [0, 1, "Hello World"];
list = array_to_list_shallow(array);
ds_list_add(list, 2, 3, 4, 5);
array_from_list = list_to_array_shallow(list);
assert(array_equals([0, 1, "Hello World", 2, 3, 4, 5], array_from_list), "Arrays arn't equal"); 
#endregion

#endregion


