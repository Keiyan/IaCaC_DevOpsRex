# Test AWX

## Purpose

The awx_tests roles runs integration tests on AWX instance and globally report their result in the variable **awx_test_result**:
* *true* when all test have passed
* *false* when at least one test has failed

## Prerequisites

`pip` must be installed on the machine.
