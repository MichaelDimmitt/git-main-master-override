#!/bin/bash
errormessage=$(git checkout master 2>&1)
echo $errormessage
