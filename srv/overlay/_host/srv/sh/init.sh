#!/bin/zsh
# Copyright (C) 2014-2019 Aleksa Sarai <cyphar@cyphar.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# [[ THIS SCRIPT SHOULD ONLY BE RUN ONCE. ]]

set -Eeugo pipefail

SCRIPT_DIRECTORY="$(readlink -m "${(%):-%N}/..")"
. "$SCRIPT_DIRECTORY/conf.sh"
export RESTIC_REPOSITORY="$_RESTIC_REPOSITORY_LOCAL"

set -x
restic init
rclone --config="$RCLONE_CONFIG" config create \
	b2cyphar b2 \
	account "$B2_ACCOUNT_ID" \
	key "$B2_ACCOUNT_KEY"
