#!/bin/bash

if [ -z "$REDIS_PASS" ]
then
    if [ "$REDIS_CONFIG" == "true" ]
    then
        honcho start -f ConfigProcfileWithoutPwd
    else 
        honcho start -f ProcfileWithoutPwd
    fi
    # honcho start -f ProcfileWithoutPwd
else 
    if [ "$REDIS_CONFIG" == "true" ]
    then
        honcho start -f ConfigProcfileWithPwd
    else 
        honcho start -f ProcfileWithPwd
    fi
    # honcho start -f ProcfileWithPwd
fi
