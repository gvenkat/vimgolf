package Vim::Golf::Constants;

use strict;
use warnings;
use Data::Dumper;



sub import {

  print Dumper( \%ENV );

  my $vim = ( $ENV{GOLFVIM} || 'vim' );
  my %constants = ( 
    GOLFHOST      => ( $ENV{GOLFHOST}     || 'http://vimgolf.com' ),
    GOLFDIFF      => ( $ENV{GOLFDIFF}     || 'diff' ),
    GOLFSHOWDIFF  => ( $ENV{GOLFSHOWDIFF} || "$vim -d -n" ),
    GOLFVIM       => $vim
  );

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
