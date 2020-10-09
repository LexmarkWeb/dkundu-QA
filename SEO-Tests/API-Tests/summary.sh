#!/bin/bash

fail=`ls results/*FAILED.txt | wc -l`
total=`ls results/*.txt | wc -l`
# Not sure we get these, but if we do, can add them
error=0
skip=0

summary="Total test summary.  Total:${total} Error:${error} Fail:${fail} Skip:${skip}"

echo $summary
