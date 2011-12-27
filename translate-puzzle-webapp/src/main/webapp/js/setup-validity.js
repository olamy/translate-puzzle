function validitySetup()
{
    // setup validity display based on css classes
    $.validity.outputs.bootstrap = {

        start:function ()
        {
            $( "div.clearfix" ).removeClass( "error" );
            $( "span.help-inline" ).remove();
        },

        // The end function is called when validation has concluded.
        end:function ( results )
        {

        },

        // The raise function is called to raise an error for a specific input.
        raise:function ( $obj, msg )
        {
            $obj.parents( "div.clearfix" ).addClass( "error" );
            $obj.parent().append( "<span class=\"help-inline\">" + msg + "</span>" )
        },

        // The raiseAggregate function is similar to the raise function, except that
        raiseAggregate:function ( $obj, msg )
        {
            $obj.parents( "div.clearfix" ).addClass( "error" );
            $obj.parent().append( "<span class=\"help-inline\">" + msg + "</span>" )
        }
    }

    $.validity.setup( { outputMode:'bootstrap' } );
    // class ++ error
    function getIdentifier( $obj )
    {
        return $obj.attr( 'id' ).length ? $obj.attr( 'id' ) : $obj.attr( 'name' );
    }
}