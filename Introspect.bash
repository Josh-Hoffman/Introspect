#!/bin/bash

#    _________________________________________________________________________________________________
#   |* ___________________________________________GPL-3_Licence_____________________________________ *|
#   | /                                                                                             \ |
#   | |         This program is free software: you can redistribute it and/or modify                | |
#   | |         it under the terms of the GNU General Public License as published by                | |
#   | |         the Free Software Foundation, either version 3 of the License, or                   | |
#   | |         (at your option) any later version.                                                 | |
#   | |                                                                                             | |
#   | |         This program is distributed in the hope that it will be useful,                     | |
#   | |         but WITHOUT ANY WARRANTY; without even the implied warranty of                      | |
#   | |         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                       | |
#   | |         GNU General Public License for more details.                                        | |
#   | |                                                                                             | |
#   | |         You should have received a copy of the GNU General Public License                   | |
#   | |         along with this program.  If not, see <http://www.gnu.org/licenses/>.               | |
#   | |                                                                                             | |
#   | \_____________________________________________________________________________________________/ |
#   |* ________________________________________Trix-26_|_2/25/2020__________________________________ *|
#   | /                                                                                             \ |
#   | |                                    Written by: Joshua Hoffman                               | |
#   | |                                 joshua.hoffman.ray@protonmail.com                           | |
#   | |                                                                                             | |
#   | \________________________________________Modulation_Project___________________________________/ |
#   |_________________________________________________________________________________________________|
# MD5: #~1~#

Introspect () {

	Retrospect () { #~#
	#~#
	Timestamp=$(date +'%H:%M_%m-%d') #~#
	Verfied=$( awk '!/'#~#'/ {print $0}' $0 | md5sum | cut -c 1-32 ) #~#
	Checked=$( awk '!/'#~#'/ {gsub(/'#~1~#'/, "'$Verfied'"); print $0}' "$0" ) #~#
	#~#
		if [[ $(awk 'NR==27 {print $3}' "$0" ) != $Verfied ]]; then #~#
		export File="${Timestamp}_$(echo $Verfied | cut -c 1-5).bash" #~#
		echo "$Checked" > ${File} #~#
		fi #~#
	#~#
	} #~#
	#~#
	Retrospect #~#
	#~#
Hard=$(awk 'NR==27 {print $3}' "${File:=$0}" )
Soft=$(awk '{sub(/'$Hard'/, "'\#~1~\#'"); print $0}' "${File:=$0}" | md5sum | cut -c 1-32 )

	if [[ $Soft = $Hard ]]; then
	${Introspect_return:=return} 0
	fi
	
return 1

}

Introspect
