use strict;
use Test::More;

{
  package Test;
  use Vim::Golf::Constants;
}

my %methods = (
  GOLFHOST  => 'http://vimgolf.com',
  GOLFDIFF      => 'diff',
  GOLFSHOWDIFF  => 'vim -d -n',
  GOLFVIM       => 'vim' 
);

{
  $ENV{GOLFVIM} = 'moodle';
  {
    package Test2;
    use Vim::Golf::Constants;
  }
}


while( my ( $key, $value ) = each( %methods ) ) {
  can_ok( 'Test', $key );
  is( Test->$key(), $value );
}

# uses correct env, and correct vim
is( Test2->GOLFVIM, 'moodle' );
is( Test2->GOLFVIMDIFF, 'moodle -d -n' );


done_testing;
