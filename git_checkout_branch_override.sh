#!/bin/bash
errormessage=$(git checkout main 2>&1)
echo $errormessage
