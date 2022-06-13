set +e # dont exit on error (lerna changes no changes, exits with 1 (error))
tempFile=changed.json
changes=npx lerna changed --all --json >$tempFile
echo "$: $?"
echo "tempFile: "
cat $tempFile

matrix=""
if [ $? -eq 1 ]; then
    echo "[]" >$tempFile
    echo "::set-output name=matrix::$matrix"
    # exit 0 # if gotten here, exit as successfull
else
    echo "Should run jq"
    matrix=$(jq -c '[.[] | .location | split("/") | .[-1] ] | del(.[] | select(. == "template"))' $tempFile)
    echo "build matrix: $matrix"
    echo "::set-output name=matrix::$matrix"
    # exit 0 # if gotten here, exit as successfull
fi
rm $tempFile
exit 0 # if gotten here, exit as successfull
