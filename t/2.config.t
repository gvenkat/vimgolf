use strict;
use Test::More;
use Vim::Golf::Config;
use FindBin;
use File::Basename qw/dirname/;
use Cwd;

my $current_directory = dirname( __FILE__ ); 

{

  local $ENV{HOME} = $current_directory; 

  is( Vim::Golf::Config->path, "$current_directory/.vimgolf", "detects correct path" );
  ok( Vim::Golf::Config->load, "loads file correctly" );
  ok( Vim::Golf::Config->load->{key} eq  '65good39ac1b23c6f5b32e99aexf44b6', "correct key" );

  my $new_key = '99good39ac1b23c6f5b32e99aexf44b6';

  Vim::Golf::Config->save( { key => $new_key } );
  ok( Vim::Golf::Config->load->{key} eq  $new_key, "key saved correctly" );
}

done_testing;

