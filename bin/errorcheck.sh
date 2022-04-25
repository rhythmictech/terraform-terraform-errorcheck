#!/bin/sh -efu

jq -er '(.assert |= ascii_downcase) | if .assert == "true" then {"value":"Assertion Passed"} else error(.error_message) end'
