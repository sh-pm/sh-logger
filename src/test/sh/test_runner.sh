#!/bin/bash

string_start_with(){
	STRING=$1
	SUBSTRING=$2
	if [[ $STRING == "$SUBSTRING"* ]]; then
		return 0;
	else
		return 1;
	fi
}

run_all_tests_in_this_script() {

	NUM_TOTAL_TESTS=0;
	NUM_TESTS_SUCCESS=0;
	NUM_TESTS_FAIL=0;

	SCRIPT_NAME_TO_RUN_TESTS="$(basename "${BASH_SOURCE[1]}")"

	echo "-------------------------------------------------------------"
	echo "Running tests in $SCRIPT_NAME_TO_RUN_TESTS ..."
	echo "-------------------------------------------------------------"
	

	for FUNCTION_NAME in `grep -E '^[[:space:]]*([[:alnum:]_]+[[:space:]]*\(\)|function[[:space:]]+[[:alnum:]_]+)' $SCRIPT_NAME_TO_RUN_TESTS | tr \(\)\}\{ ' ' | sed 's/^[ \t]*//;s/[ \t]*$//'`
	do
		if (string_start_with $FUNCTION_NAME "test_"); then
			$FUNCTION_NAME
		fi
		
		NUM_TOTAL_TESTS=$((NUM_TOTAL_TESTS+1))
	done
	
	echo "-------------------------------------------------------------"
	echo "Finish. $NUM_TOTAL_TESTS tests executed" 
	echo "Result: $TEST_STATUS"
	echo "-------------------------------------------------------------"
	
	if [[ $TEST_STATUS == "FAIL" ]]; then
		return 1;
	else		
		return 0;
	fi
	
}
