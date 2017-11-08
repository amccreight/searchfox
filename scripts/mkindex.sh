#!/bin/bash

set -e # Errors are fatal
set -x # Show commands

if [ $# != 3 ]
then
    echo "usage: $0 <config-repo-path> <config-file> <tree-name>"
    exit 1
fi

CONFIG_REPO=$1
CONFIG_FILE=$2
TREE_NAME=$3

MOZSEARCH_PATH=$(cd $(dirname "$0") && git rev-parse --show-toplevel)
. $MOZSEARCH_PATH/scripts/load-vars.sh $CONFIG_FILE $TREE_NAME

export PYTHONPATH=$MOZSEARCH_PATH/scripts

date

$MOZSEARCH_PATH/scripts/find-objdir-files.py
#$MOZSEARCH_PATH/scripts/objdir-mkdirs.sh

echo CROSS REF
$MOZSEARCH_PATH/scripts/crossref.sh $CONFIG_FILE $TREE_NAME
