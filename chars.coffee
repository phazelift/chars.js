#-----------------------------------------------------------------------------------------
#
# chars.coffee - A little Javascript single-ascii-character library, written in Coffeescript.
#
#		Experimental and under development. I now and then add something to it.
#
# Copyright (c) 2014 Dennis Raymondo van der Sluis
#
# This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>
#
#------------------------------------------------------------------------------------------

"use strict"

# load dependencies
if window? then _= window.Types
else if module? then _= require 'types.js'

# some tools

mapStringToNumber= ( array ) ->
	return 0 if _.notArray array
	for value, index in array
		return index if _.isNaN nr= parseInt array[index], 10
		array[ index ]= nr
	return array.length

# extend the following to Chars later

_.inRange= ( nr, range ) ->
	return false if (_.isNaN nr= parseInt nr, 10) or (mapStringToNumber( range ) < 2)
	return (nr >= range[0]) and (nr <= range[1])

_.limit= ( nr, range ) ->
	return 0 if mapStringToNumber( range ) < 2
	return range[0] if ( _.isNaN nr= parseInt nr, 10 ) or ( nr < range[0] )
	return range[1] if nr > range[1]
	return nr

_.random= ( min, max ) ->
	return 0 if mapStringToNumber([min, max]) < 2
	return min if max < min
	max= (max- min)+ 1
	return Math.floor ( Math.random()* max )+ min

#											Chars

class Chars extends _

	@ASCII_RANGE_UPPERCASE	: [65, 90]
	@ASCII_RANGE_LOWERCASE	: [97, 122]
	@ASCII_RANGE_NUMBERS		: [48, 57]
	@ASCII_RANGE_SPECIAL_1	: [32, 47]
	@ASCII_RANGE_SPECIAL_2	: [58, 64]
	@ASCII_RANGE_SPECIAL_3	: [91, 96]
	@ASCII_RANGE_SPECIAL_4	: [123, 126]
	@ASCII_RANGE_ALL			: [32, 126]

	@REGEXP_SPECIAL_CHARS	: ['?', '\\', '[', ']', '(', ')', '*', '+', '.', '/', '|', '^', '$', '<', '>', '-', '&']

	@ascii	: ( ordinal ) -> String.fromCharCode _.forceNumber ordinal, 0
	@ordinal	: ( char ) -> _.forceNumber _.forceString( char?[0] ).charCodeAt(), 0

	@isUpper	: ( char ) -> _.inRange( Chars.ordinal(char), Chars.ASCII_RANGE_UPPERCASE )
	@isLower	: ( char ) -> _.inRange( Chars.ordinal(char), Chars.ASCII_RANGE_LOWERCASE )

	@isAlpha		: ( char ) -> Chars.isUpper(char) or Chars.isLower(char)
	@isNumeric	: ( char ) -> _.inRange Chars.ordinal(char), Chars.ASCII_RANGE_NUMBERS
	@isAlphaNumeric: ( char ) -> Chars.isAlpha(char) or Chars.isNumeric(char)
	@isSpecial	: ( char ) -> ('' isnt char= _.forceString(char)) and not Chars.isAlphaNumeric(char)

	@random: ( range= Chars.ASCII_RANGE_ALL ) ->
		return '' if _.notArray(range) or range.length < 2
		min= _.limit( range[0], range )
		max= _.limit( range[1], range )
		return Chars.ascii _.random min, max

# end statics

	constructor: ( char, range ) ->
		if not range? or _.notArray(range) then @range= Chars.ASCII_RANGE_ALL
		else @range= range
		@set char

	get: -> @char
	set: ( char ) ->
		if _.isNumber(char) and char > 9
			# we have an ordinal here
			@char= Chars.ascii _.limit( char, @range )
		else @char= _.forceString char?[0], Chars.ascii @range[0]
		return @char

	next: ( amount ) -> @set @ordinal+ _.forceNumber( amount, 1 )
	prev: ( amount ) -> @set @ordinal- _.forceNumber( amount, 1 )

	isUpper: -> Chars.isUpper @char
	isLower: -> Chars.isLower @char

	isAlpha		: -> Chars.isAlpha @char
	isNumeric	: -> Chars.isNumeric @char
	isSpecial	: -> Chars.isSpecial @char
	isAlphaNumeric	: -> Chars.isAlphaNumeric @char

	random: -> @set Chars.random()

Object.defineProperty Chars::, 'ordinal', { get: -> Chars.ordinal @char }
Object.defineProperty Chars::, 'ascii', { get: -> @char }

Chars._ = _

# export Chars
if module? then module.exports= Chars
else if window? then window.Chars= Chars

