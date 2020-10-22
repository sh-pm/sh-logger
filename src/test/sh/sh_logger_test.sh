#!/bin/bash

. ../../main/sh/sh_logger.sh
. ./asserts.sh
. ./test_runner.sh

test_constants() {
	assert_equals $LOG_LEVEL_ERROR "ERROR"
	assert_equals $LOG_LEVEL_TRACE "TRACE"
}

run_all_tests_in_this_script
