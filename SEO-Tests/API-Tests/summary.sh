#!/bin/sh

file="SEO-Tests/API-Tests/reports/html/overview-summary.html"

total=$(grep "<td><a href=" $file | awk -F "</td><td>" '{printf "%s", $2}')
error=$(grep "<td><a href=" $file | awk -F "</td><td>" '{printf "%s", $3}')
fail=$(grep "<td><a href=" $file | awk -F "</td><td>" '{printf "%s", $4}')
skip=$(grep "<td><a href=" $file | awk -F "</td><td>" '{printf "%s", $5}')

# What we did before, in case you need it again
#summary=$(grep "<td><a href=" $file | awk -F "</td><td>" '{printf "Total test summary.  Total:%s Error:%s Fail:%s Skip:%s", $2,$3,$4,$5}')
#echo $summary

# Grab test steps from results output files, seems valid for this test anyway
passed=`ls SEO-Tests/API-Tests/results/*-OK.txt 2>/dev/null | wc -l`
failed=`ls SEO-Tests/API-Tests/results/*-FAILED.txt 2>/dev/null | wc -l`
faketotal=`expr ${passed} + ${failed}`

# New summary line using our faked total above as well as failed info above. 
# Error and skipped still come from the HTML file
echo "Total test summary. Total:${faketotal} Error:${error} Fail:${failed} Skip:${skip}"