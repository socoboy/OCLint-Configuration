#!/bin/bash

# Build example: At root of the project dir, run the command
#   ./analysis_script.sh
#

START=`date +%s`
echo "========= Start time:$(date) ==========" 

source ~/.bash_profile

hash oclint &> /dev/null
if [ $? -eq 1 ]; then
echo >&2 "oclint not found, analyzing stopped"
exit 1
fi

rm -rf compile_commands.json
rm -rf report.html

SCHEME=hocvalam-dev
WORKSPACE=hocvalam.xcworkspace

echo "[*] xcodebuild with WORKSPACE=${WORKSPACE} SCHEME=${SCHEME}"

#xctool -workspace ${WORKSPACE} -scheme ${SCHEME} -reporter json-compilation-database:compile_commands.json clean
#xctool -workspace ${WORKSPACE} -scheme ${SCHEME} -reporter json-compilation-database:compile_commands.json build -dry-run

xcodebuild -workspace ${WORKSPACE} -scheme ${SCHEME} clean | xcpretty
xcodebuild -workspace ${WORKSPACE} -scheme ${SCHEME} -dry-run | xcpretty -r json-compilation-database --output compile_commands.json

BUILD_END=`date +%s`
echo "Build time:$((BUILD_END-START))s"

echo "[*] starting analyzing"
oclint-json-compilation-database -e Pods -- -report-type html -o report.html -list-enabled-rules
#oclint-json-compilation-database -e Pods | sed 's/\(.*\.\m\{1,2\}:[0-9]*:[0-9]*:\)/\1 warning:/'
ANALYZE_END=`date +%s`
echo "Analyzing time: $((ANALYZE_END-BUILD_END))s"

open report.html
