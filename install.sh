#!/bin/bash

# Copyright (c) 2018, Arm Limited and affiliates.
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DEVICEJS_CONFIGURATION_DIRECTORY=/etc/devicejs

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

cp -rT $DIR/install/etc /etc

if [ -f /usr/bin/devicejs ]; then
    unlink /usr/bin/devicejs
fi

ln -s $DIR/bin/devicejs /usr/bin/devicejs
ln -s $DIR/bin/devicedb /usr/bin/devicedb
