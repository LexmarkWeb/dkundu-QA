#!/bin/sh

path="SEO-Tests/API-Tests/results/"
fail=`ls ${path}/*FAILED.txt | wc -l`
total=`ls ${path}/*OK.txt | wc -l`
error=0
skip=0

summary="Total test summary.  Total:${total} Error:${error} Fail:${fail} Skip:${skip}"

echo $summary
