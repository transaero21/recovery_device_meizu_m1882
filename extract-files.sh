#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

export VENDOR=meizu
export DEVICE=m1882

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

OMNI_ROOT="${MY_DIR}/../../.."

HELPER="${OMNI_ROOT}/vendor/omni/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
. "${HELPER}"

# Default to sanitizing the vendor folder before extraction
VENDOR_STATE=0
SECTION=
KANG=

while [ "$1" != "" ]; do
    case "$1" in
        -n | --no-cleanup )     VENDOR_STATE=1
                                ;;
        -k | --kang)            KANG="--kang"
                                ;;
        -s | --section )        shift
                                SECTION="$1"
                                VENDOR_STATE=1
                                ;;
        * )                     SRC="$1"
                                ;;
    esac
    shift
done

export VENDOR_STATE

if [ -z "${SRC}" ]; then
    SRC=adb
fi

export OUTDIR="device/"$VENDOR"/"$DEVICE"/proprietary"

if [ ! -d "$OMNI_ROOT/$OUTDIR" ]; then
    mkdir -p "$OMNI_ROOT/$OUTDIR"
fi

export PRODUCTMK="$OMNI_ROOT"/"$OUTDIR"/"$DEVICE"-vendor.mk

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" ${KANG} --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"