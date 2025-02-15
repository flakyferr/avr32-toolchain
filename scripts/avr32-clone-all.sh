#!/bin/sh

# Copyright (C) 2013 Embecosm Limited.

# Contributor Jeremy Bennett <jeremy.bennett@embecosm.com>

# A script to clone all the components of the AVR32 tool chain

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation; either version 3 of the License, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.

# You should have received a copy of the GNU General Public License along
# with this program.  If not, see <http://www.gnu.org/licenses/>.

#		    CLONE ALL AVR32 TOOL CHAIN COMPONENTS
#		    =====================================

# Run this from the tool chain directory

# Function to clone a tool. First argument is the name of the remote, second
# is the name of the tool, third the repository to clone from.
clone_tool () {
    remote=$1
    tool=$2
    repo=$3

    # Clear out anything pre-existing and clone the repo
    rm -rf ${tool}
    git clone ${repo} ${tool}
}

# Clone all the AVR32 tool components. Note that we need two copies of the
# binutils-gdb repo, to allow us to work with different versions (branches) of
# binutils and gdb
clone_tool origin binutils https://github.com/flakyferr/avr32-binutils-gdb
clone_tool origin gcc      https://github.com/GomSpace/avr32-gcc
clone_tool origin newlib   https://github.com/GomSpace/avr32-newlib
cp -rd binutils gdb

# We perhaps ought to allow an option to check out specific versions. For now
# just messages.
echo "All repositories cloned"
