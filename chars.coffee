#
# chars.js - A single-ascii-character utility
#
# MIT License
#
# Copyright (c) 2014 Dennis Raymondo van der Sluis
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

"use strict"

if window? then _= window.Types
else if module? then _= require 'types.js'


mapStringToNumber= ( array ) ->
	return 0 if _.notArray array
	for value, index in array
		return index if _.isNaN nr= parseInt array[index], 10
		array[ index ]= nr
	return array.length

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



class Chars

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


	constructor: ( char, range ) ->
		@range = _.forceArray( range, Chars.ASCII_RANGE_ALL );
		@char = @set char

	get: -> @char
	set: ( char ) ->
		return if _.isNumber(char) and char > 9
			# handle ordinal argument
			Chars.ascii _.limit( char, @range )
		else _.forceString char?[0], Chars.ascii @range[0]

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


Chars.types = Chars._ = _


if module? then module.exports= Chars
else if window? then window.Chars= Chars