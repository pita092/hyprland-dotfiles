#!/bin/bash

if pgrep -x ags > /dev/null; then
    pkill ags
else
    ags &
fi

