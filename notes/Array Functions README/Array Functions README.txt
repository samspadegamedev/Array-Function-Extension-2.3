2.3.1 UPDATE NOTE

2.3 and 2.3.1 introduced a variety of new array functions making some of the functions
in this asset obsolute. So in any case where a new array function has been officially
added, the corresponding function in this asset as been removed. In most cases these
functions work identically; however, the built in array delete and array sort work
directly on the array and do not return an array, this may need to be take into account.

I've also removed the array to list functions and list to arrays. These existed primarily 
because you might want to save an array in json format, which is also no longer necessary 
in 2.3.1 as you can save arrays straight to json.

Additionally, many of the functions take advantage of the ability to pass in callback scripts that is no 
available in 2.3. If you are not familiar with how to use callback scripts, look up how to 
use a for each loop in javascript. The principles are nearly the same.



GENERAL OVERVIEW

Array Functions is a set of scripts that extend the normal use and function of arrays.
This set of array functions specifically extends the normal use of arrays.

The following is a list of the built in GameMaker Studio 2 1d array functions:
- array_create
- array_copy   (in 2.3.1 this works on deeply nested arrays)
- array_equals (in 2.3.1 this works on deeply nested arrays)
- array_set
- array_get
- array_push
- array_pop
- array_insert
- array_delete
- array_delete
- array_length
- array_resize
- is_array

You can find out more about these functions in the manual. Some of them are used
inside of the custom array functions.

The following is a list of the added functions:



EXTENSION SCRIPTS
- array_valid_index
- array_swap_indexes
- array_copy_simple		
- array_add_to_end	
- array_join	
- array_flatten	
- array_find_index			
- array_find_index_custom	
- array_find_index_last			
- array_find_index_last_custom	
- array_find_index_all
- array_find_index_all_custom
- array_every
- array_some	
- array_shuffle	
- array_filter				
- array_reduce			
- array_reverse				
- array_for_each		
- array_for_each_copy	


NOTES ABOUT SCRIPTS

I have not performanced tested any of the scripts. And in general, if choosing between an 
easy to understand but more verbose version or a single line version, went with the more
verbose version for ease of understanding and debugging.





