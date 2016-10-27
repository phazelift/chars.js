chars.js
========

About single ascii characters.

<br/>

>install with npm: `npm install --save chars.js`

<br/>
___

API
---

**Chars.ASCII_RANGE_...**

> Chars.ASCII_RANGE_... are `static const` arrays with only two indices: [bottomOfRange, topOfRange]. These ranges are directly
> related to the ordinal values of the ascii-table.

> The following ranges are defined in chars.js:

|Range									|Ordinal range	|Characters found in range
|:-------------------------------|--------------|:-----------------------------
|Chars.ASCII_RANGE_UPPERCASE		|[65,90]			|ABCDEFGHIJKLMNOPQRSTUVWXYZ
|Chars.ASCII_RANGE_LOWERCASE		|[97,122]		|abcdefghijklmnopqrstuvwxyz
|Chars.ASCII_RANGE_NUMBERS			|[48,57]			|0123456789
|Chars.ASCII_RANGE_SPECIAL_1		|[32,47]			|(white space) !"#$%&'()*+,-./
|Chars.ASCII_RANGE_SPECIAL_2		|[58,64]			|:;<=>?@
|Chars.ASCII_RANGE_SPECIAL_3		|[91,96]			|[\\]^_`
|Chars.ASCII_RANGE_SPECIAL_4		|[123,126]		|{\|}~
|Chars.ASCII_RANGE_ALL(printable)|[32,126]		|(white space) !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{\|}~`


**Chars.REGEXP_SPECIAL_CHARS**

> `<array> REGEXP_SPECIAL_CHARS`

> Returns an array (like a set) with all special characters used in regular expressions.

> I use this for one of my other libraries, strings.js, for escaping a string to prepare for making a new RegExp.

**Chars.ascii**
> `<string> Chars.ascii( <string>/<number> ordinal )`

> Returns the ascii character found at ordinal.

```javascript
var space= Chars.ascii( 32 );
// ' '
```

**Chars.ordinal**
> `<number> Chars.ordinal( <string>/<number> char )`

> Returns the ordinal for char.

```javascript
var ordSpace= Chars.ordinal( ' ' );			
// 32
```

**Chars.isUpper**
> `<boolean> Chars.isUpper( <string>/<number> char )`

> Returns true if char is uppercase.

```javascript
var test= Chars.isUpper( 'z' );				
// false
```

**Chars.isLower**
> `<boolean> Chars.isLower( <string>/<number> char )`

> Returns true if char is lowercase.

```javascript
var test= Chars.isLower( 'z' );				
// true
```

**Chars.isAlpha**
> `<boolean> Chars.isAlpha( <string>/<number> char )`

> Returns true if char is uppercase or lowercase alpha.

```javascript
var test= Chars.isAlpha( 'a' );				
// true
```

**Chars.isNumeric**
> `<boolean> Chars.isNumeric( <string>/<number> char )`

> Returns true if char is a number.

```javascript
var test= Chars.isNumeric( '0' );			
// true
var test= Chars.isNumeric( 0 );				
// true
```

**Chars.isSpecial**
> `<boolean> Chars.isSpecial( <string>/<number> char )`

> Returns true if char is a special character from the SPECIAL_1,2,3 or 4 range.


```javascript
var test= Chars.isSpecial( '.' );			
// true
```

**Chars.isAlphaNumeric**
> `<boolean> Chars.isAlphaNumeric( <string>/<number> char )`

> Returns true if char is a uppercase, lowercase or number.

```javascript
var test= Chars.isAlphaNumeric( 'A' );		
// true
var test= Chars.isAlphaNumeric( 1 );		
// true
```

**Chars.random**
> `<string> Chars.random( range )`

> Returns a random character in range range. range defaults to the Chars.ASCII_RANGE_ALL range

```javascript
var test= Chars.random( Chars.ASCII_RANGE_UPPERCASE );
// returns a single random character between 'A' and 'Z'
```

**Chars.prototype.constructor**
> `<this> constructor( <string>/<number> char, <array> range )`

> char can be a number character or ordinal, range has the format of ASCII_RANGE

```javascript
var char= new Chars( '?' );
// I will be using this char instance for the following examples.
```

**Chars.prototype.get**
> `<string> get()`

> Returns this.char

```javascript
console.log( char.get() );					
// '?'
```

**Chars.prototype.set**
> `<string> set( <string>/<number> char )`

> char can be a number character or ordinal. If char is an ordinal, the character represented by ordinal will be set.

```javascript
console.log( char.set('!') );				
// '!'
```

**Chars.prototype.next**
> `<string> next( <string>/<number> amount )`

> Proceed this.char to the following ascii character and returns it, if no arguments are given. Proceed to amount ascii characters
> ahead, limited by this.range, if amount is set.

```javascript
console.log( char.next() );					
//	'@'
```

**Chars.prototype.prev**
> `<this> prev( <string>/<number> amount )`

> Sets and returns this.char to the predecessor of the current ascii character in the ascii-table, if no arguments
> are given. If amount is given, it will decrease and set to the amount characters back in the ascii table.

> prev is limited to the current active range. So, casting a prev on the bounds of the range will keep returning
> this bound.

```javascript
console.log( char.prev() );					
//	'!'
```

The remaining methods are similar in working as the static versions by the same name, they only do not require a
string argument, they use the objects string instead.

**Chars.prototype.isUpper**
> `<boolean> isUpper()`

**Chars.prototype.isLower**
> `<boolean> isLower()`

**Chars.prototype.isAlpha**
> `<boolean> isAlpha()`

**Chars.prototype.isNumeric**
> `<boolean> isNumeric()`

**Chars.prototype.isSpecial**
> `<boolean> isSpecial()`

**Chars.prototype.isAlphaNumeric**
> `<boolean> isAlphaNumeric()`

**Chars.prototype.random**
> `<string> random()`

---

change log
==========

0.2.0

-	changed license to MIT
-	updated readme

---

0.1.5

-	chars.js now depends on types.js.
-	Some fixes and cleanup.
-	Added some basic Jasmine tests, still incomplete, will finish later
-	Updated the readme.

___

###license
MIT