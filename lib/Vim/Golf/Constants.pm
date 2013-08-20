package Vim::Golf::Constants;

use strict;
use warnings;

BEGIN {

  our %constants = ( 
    VIMGOLF_HOST => ( $ENV{GOLFHOST} || 'http://vimgolf.com' )
  );

}

sub import {
  my $caller_pkg = caller;
}





1;
