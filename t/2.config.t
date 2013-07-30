use strict;
use Test::More;
use Vim::Golf::Config;
use Cwd;

my $current_directory = getcwd;

{
  local $ENV{HOME} = getcwd;

  is( Vim::Golf::Config->path, "$current_directory/.vimgolf" )
  

}

done_testing;

