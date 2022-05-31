
//

describe("ascii( ordinal )", function() {

    it("should return ascii character NUL(0 ordinal) if invalid or no arguments are given", function(){
        result= Chars.ascii();
        expect( result ).toBe( Chars.ascii(0) );

        result= Chars.ascii( 'bla' );
        expect( result ).toBe( Chars.ascii(0) );

        result= Chars.ascii( {name: 'lyn'} );
        expect( result ).toBe( Chars.ascii(0) );

        result= Chars.ascii( NaN );
        expect( result ).toBe( Chars.ascii(0) );

        result= Chars.ascii( null );
        expect( result ).toBe( Chars.ascii(0) );

        result= Chars.ascii( true );
        expect( result ).toBe( Chars.ascii(0) );
    });

    it("should return the corresponding ascii character if a valid ordinal between 0 and 255 is given", function(){
        result= Chars.ascii( 97 );
        expect( result ).toBe( 'a' );

        result= Chars.ascii( 90 );
        expect( result ).toBe( 'Z' );

        result= Chars.ascii( 49 );
        expect( result ).toBe( '1' );

        result= Chars.ascii( 32 );
        expect( result ).toBe( ' ' );

        result= Chars.ascii( 126 );
        expect( result ).toBe( '~' );
    });

});

describe("ordinal( char )", function() {

    it("should return (ordinal)Number 0 if invalid or no arguments are given", function(){
        result= Chars.ordinal();
        expect( result ).toBe( 0 );

        result= Chars.ordinal( /a/ );
        expect( result ).toBe( 0 );

        result= Chars.ordinal( {} );
        expect( result ).toBe( 0 );

        result= Chars.ordinal( null );
        expect( result ).toBe( 0 );

        result= Chars.ordinal( NaN );
        expect( result ).toBe( 0 );
    });

    it("should return the corresponding ordinal value (as Number) if a valid ascii character is given", function(){
        result= Chars.ordinal( 'a' );
        expect( result ).toBe( 97 );

        result= Chars.ordinal( 'a' );
        expect( result ).toBe( 97 );

        result= Chars.ordinal( 'Z' );
        expect( result ).toBe( 90 );

        result= Chars.ordinal( '1' );
        expect( result ).toBe( 49 );

        result= Chars.ordinal( ' ' );
        expect( result ).toBe( 32 );

        result= Chars.ordinal( '~' );
        expect( result ).toBe( 126 );

        // index 0 in array is the same as index 0 in string, so this should work
        result= Chars.ordinal( ['a'] );
        expect( result ).toBe( 97 );
    });

});


describe("isLower( char )", function() {

    it("should return false if invalid or no arguments are given", function(){
        result= Chars.isLower();
        expect( result ).toBe( false );

        result= Chars.isLower( 45 );
        expect( result ).toBe( false );

        result= Chars.isLower( ['A'] );
        expect( result ).toBe( false );

        result= Chars.isLower( null );
        expect( result ).toBe( false );

        result= Chars.isLower( function(){} );
        expect( result ).toBe( false );
    });

    it("should return false if a valid uppercase character or any other ascii characters is given, checking only the first character", function(){
        result= Chars.isLower( 'A' );
        expect( result ).toBe( false );

        result= Chars.isLower( '1' );
        expect( result ).toBe( false );

        result= Chars.isLower( 'Q' );
        expect( result ).toBe( false );

        result= Chars.isLower( '5' );
        expect( result ).toBe( false );

        result= Chars.isLower( '=' );
        expect( result ).toBe( false );

        result= Chars.isLower( '!@#' );
        expect( result ).toBe( false );
    });

    it("should return true if a valid lowercase character is given, checking only the first character", function(){

        result= Chars.isLower( 'a' );
        expect( result ).toBe( true );

        result= Chars.isLower( 'n' );
        expect( result ).toBe( true );

        result= Chars.isLower( 'zYX' );
        expect( result ).toBe( true );
    });


});

describe("isAlpha( char )", function() {

    it("should return false if invalid or no arguments are given", function(){
        result= Chars.isAlpha();
        expect( result ).toBe( false );

        result= Chars.isAlpha( 45 );
        expect( result ).toBe( false );

        result= Chars.isAlpha( null );
        expect( result ).toBe( false );

        result= Chars.isAlpha( function(){} );
        expect( result ).toBe( false );
    });

    it("should return false if a valid non-alpha character is given, checking only the first character", function(){
        result= Chars.isAlpha( '^' );
        expect( result ).toBe( false );

        result= Chars.isAlpha( '1' );
        expect( result ).toBe( false );

        result= Chars.isAlpha( '[' );
        expect( result ).toBe( false );

        result= Chars.isAlpha( '=' );
        expect( result ).toBe( false );

        result= Chars.isAlpha( '!@#' );
        expect( result ).toBe( false );
    });

    it("should return true if a valid alpha-character is given, checking only the first character", function(){

        result= Chars.isAlpha( 'a' );
        expect( result ).toBe( true );

        result= Chars.isAlpha( 'n' );
        expect( result ).toBe( true );

        result= Chars.isAlpha( 'zYX' );
        expect( result ).toBe( true );

        result= Chars.isAlpha( ['A', 3] );
        expect( result ).toBe( true );
    });


});


describe("isNumeric( char )", function() {

    it("should return false if invalid or no arguments are given", function(){
        result= Chars.isNumeric();
        expect( result ).toBe( false );

        result= Chars.isNumeric( '!' );
        expect( result ).toBe( false );

        result= Chars.isNumeric( ['A'] );
        expect( result ).toBe( false );

        result= Chars.isNumeric( null );
        expect( result ).toBe( false );

        result= Chars.isNumeric( function(){} );
        expect( result ).toBe( false );
    });

    it("should return false if a valid non-numeric ascii character is given, checking only the first character", function(){
        result= Chars.isNumeric( '' );
        expect( result ).toBe( false );

        result= Chars.isNumeric( '!' );
        expect( result ).toBe( false );

        result= Chars.isNumeric( ' ' );
        expect( result ).toBe( false );

        result= Chars.isNumeric( '!23' );
        expect( result ).toBe( false );
    });

    it("should return true if a valid numeric ascii character is given, checking only the first character", function(){

        result= Chars.isNumeric( '1' );
        expect( result ).toBe( true );

        result= Chars.isNumeric( '0' );
        expect( result ).toBe( true );

        result= Chars.isNumeric( '5!!' );
        expect( result ).toBe( true );
    });
});

describe("isAlphaNumeric( char )", function() {

    it("should return false if invalid or no arguments are given", function(){
        result= Chars.isAlphaNumeric();
        expect( result ).toBe( false );

        result= Chars.isAlphaNumeric( '!' );
        expect( result ).toBe( false );

        result= Chars.isAlphaNumeric( null );
        expect( result ).toBe( false );

        result= Chars.isAlphaNumeric( function(){} );
        expect( result ).toBe( false );
    });

    it("should return false if a valid non-alpha-numeric ascii character is given, checking only the first character", function(){
        result= Chars.isAlphaNumeric( '' );
        expect( result ).toBe( false );

        result= Chars.isAlphaNumeric( '.' );
        expect( result ).toBe( false );

        result= Chars.isAlphaNumeric( ' ' );
        expect( result ).toBe( false );

        result= Chars.isAlphaNumeric( '!23' );
        expect( result ).toBe( false );
    });

    it("should return true if a valid alpha-numeric ascii character is given, checking only the first character", function(){

        result= Chars.isAlphaNumeric( '1' );
        expect( result ).toBe( true );

        result= Chars.isAlphaNumeric( '0' );
        expect( result ).toBe( true );

        result= Chars.isAlphaNumeric( '1!@' );
        expect( result ).toBe( true );

        result= Chars.isAlphaNumeric( 'a' );
        expect( result ).toBe( true );

        result= Chars.isAlphaNumeric( 'Z.?' );
        expect( result ).toBe( true );

        result= Chars.isAlphaNumeric( ['A', 0] );
        expect( result ).toBe( true );
    });

});


describe("isSpecial( char )", function() {

    it("should return false if invalid or no arguments are given", function(){
        result= Chars.isSpecial();
        expect( result ).toBe( false );

        result= Chars.isSpecial( NaN );
        expect( result ).toBe( false );

        result= Chars.isSpecial( ['A'] );
        expect( result ).toBe( false );

        result= Chars.isSpecial( null );
        expect( result ).toBe( false );

        result= Chars.isSpecial( function(){} );
        expect( result ).toBe( false );
    });

    it("should return false if a valid non-special ascii character is given, checking only the first character", function(){
        result= Chars.isSpecial( '' );
        expect( result ).toBe( false );

        result= Chars.isSpecial( 'a' );
        expect( result ).toBe( false );

        result= Chars.isSpecial( 'z' );
        expect( result ).toBe( false );

        result= Chars.isSpecial( '0' );
        expect( result ).toBe( false );
    });

    it("should return true if a valid special ascii character is given, checking only the first character", function(){

        result= Chars.isSpecial( '.' );
        expect( result ).toBe( true );

        result= Chars.isSpecial( '?' );
        expect( result ).toBe( true );

        result= Chars.isSpecial( '!23' );
        expect( result ).toBe( true );

        result= Chars.isSpecial( '~bc' );
        expect( result ).toBe( true );
    });
});



describe("random( range )", function() {

    it("should return one random ascii character in the range 32..126 if invalid or no arguments are given", function(){
        result= Chars.random();
        expect( result ).toBeGreaterThan( Chars.ascii(31) );
        expect( result ).toBeLessThan( Chars.ascii(127) );
    });

    it("should return one random ascii character in the range 'A'..'Z'", function(){
        result= Chars.random( Chars.ASCII_RANGE_UPPERCASE );
        expect( result ).toBeGreaterThan( '@' );
        expect( result ).toBeLessThan( '[' ) ;
    });

    it("should return one random ascii character in the range 'a'..'z'", function(){
        result= Chars.random( Chars.ASCII_RANGE_LOWERCASE );
        expect( result ).toBeGreaterThan( '`' );
        expect( result ).toBeLessThan( '{' ) ;
    });

    it("should return one random ascii character in the range '0'..'9'", function(){
        result= Chars.random( Chars.ASCII_RANGE_NUMBERS );
        expect( result ).toBeGreaterThan( '/' );
        expect( result ).toBeLessThan( ':' ) ;
    });

});