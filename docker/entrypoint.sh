#!/bin/bash

MAIN_BIN="$1"

BIN_PATH=$(dirname $MAIN_BIN)
CFG_PATH="$BIN_PATH/../etc/janus"
CFG_BIN="$BIN_PATH/janus-cfgconv"

mkdir -p $CFG_PATH
SAMPLE_PATH="$BIN_PATH/../conf/janus"
if [ -e "$SAMPLE_PATH" -a -e "$CFG_BIN" ]; then
    for sample in $(ls $SAMPLE_PATH/*.sample); do
        jcfg=${sample##*/} && jcfg=${jcfg%.*} && jcfg=$CFG_PATH/$jcfg
        [ ! -e "$jcfg" ] && $CFG_BIN ${sample} ${jcfg} 1>/dev/null
    done
else
    echo -e "[ERROR] no $SAMPLE_PATH or $CFG_BIN"
    exit 1
fi

exec "$@"
