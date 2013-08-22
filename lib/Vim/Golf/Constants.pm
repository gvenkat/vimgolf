package Vim::Golf::Constants;

use strict;
use warnings;


my %constants = ( 
  GOLFHOST => ( $ENV{GOLFHOST} || 'http://vimgolf.com' )
);


sub import {

  my $caller = caller;

  {
    no strict 'refs';
    while( my ( $key, $value ) = each( %constants ) ) {
      my $method = $caller . '::' . $key;
      *$method = sub () { $value };
    }
  }

}


1;
__END__
