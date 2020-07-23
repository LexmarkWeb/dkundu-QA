#!/bin/sh

file="support.com.APIs/support-qa-APIs-test/reports/html/overview-summary.html"  

summary=$(grep "<td><a href=" $file | awk -F "</td><td>" '{printf "Total test summary.  Total:%s Error:%s Fail:%s Skip:%s", $2,$3,$4,$5}')

echo $summary
