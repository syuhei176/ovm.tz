#!/bin/sh
# ligo compile-storage main.ligo main "`echo $(cat initial_storage)`"

SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)
ligo dry-run main.ligo main "`echo $(cat ${SCRIPT_DIR}/deposit_parameter)`" "`echo $(cat ${SCRIPT_DIR}/initial_storage)`" --amount=1