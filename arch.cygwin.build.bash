#!/bin/bash -ex
# Copyright (c) 2014-2015 Arduino LLC
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

CC="gcc -m32" CXX="g++ -m32" ./build.all.bash

rm -f *arduino*.tar.bz2 *arduino*.zip

zip -r -9 ./avr-gcc-4.9.2-arduino1-i686-pc-cygwin.zip avr/

zip -r -9 ./avrdude-6.1-arduino1-i686-pc-cygwin.zip avrdude-6.1/
