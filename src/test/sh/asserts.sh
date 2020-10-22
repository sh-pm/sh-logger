#!/bin/bash

ESC_CHAR='\033'

RED=$ESC_CHAR'[0;31m'
GREEN=$ESC_CHAR'[0;32m'
YELLOW=$ESC_CHAR'[0;93m'
NC=$ESC_CHAR'[0m' # No Color

TEST_STATUS=OK

get_caller_info(){
	echo "${BASH_SOURCE[2]} - ${FUNCNAME[2]}"
}

assert_equals(){
	#echo "PARAM1: |$1|"
	#echo "PARAM2: |$2|"

	if [[ $1 == $2 ]]; then
		echo -e "`get_caller_info`: ${GREEN}Assert Success!${NC}"
	else
		echo -e "`get_caller_info`: ${RED}Assert FAIL!${NC}"
		TEST_STATUS="FAIL"
	fi
}


assert_true(){
	LAST_FUNCTION_STATUS_EXECUTION=`echo $?`;

	if [[ $LAST_FUNCTION_STATUS_EXECUTION == "0" ]]; then
		echo -e "`get_caller_info`: ${GREEN}Assert Success!${NC}"
		return 0;
	else
		echo -e "`get_caller_info`: ${RED}Assert FAIL!${NC}"
		TEST_STATUS="FAIL"
		return 1;
	fi
}	

assert_false(){
	LAST_FUNCTION_STATUS_EXECUTION=`echo $?`;

	if [[ $LAST_FUNCTION_STATUS_EXECUTION == "0" ]]; then
		echo -e "`get_caller_info`: ${RED}Assert FAIL!${NC}"
		TEST_STATUS="FAIL"
		return 1;
	else
		echo -e "`get_caller_info`: ${GREEN}Assert Success!${NC}"
		return 0;
	fi
}

assert_fail(){
	TEST_STATUS="FAIL"
}