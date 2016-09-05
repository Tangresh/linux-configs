#!/usr/bin/env bash

set -euo pipefail
IFS=

BASEDIR=/usr/sbin
SWITCHABLES=(iptables iptables-save iptables-restore iptables-xml ip6tables ip6tables-save ip6tables-restore)
XTABLES=xtables-multi
XTABLES_COMPAT=xtables-compat-multi

switch() {
    for x in ${SWITCHABLES[@]}
    do
        if [[ -f $BASEDIR/$x ]]
        then
            rm $BASEDIR/$x
            ln -s $1 $BASEDIR/$x
        fi
    done
}

if [[ $# -gt 0 ]]; then
    CHOICE=$1
else
    CHOICE=
fi

case $CHOICE in
    "-d")
        echo "deactivating..."
        switch $XTABLES
        ;;
    *)
        echo "activating..."
        switch $XTABLES_COMPAT
        ;;
esac
