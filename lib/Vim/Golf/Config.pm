package Vim::Golf::Config;

use strict;
use File::Spec::Functions;
use YAML::Any;


sub path {
  catfile( $ENV{HOME}, '.vimgolf' );
}

sub config_path {
  catfile( path, 'config.yaml' );
}

sub put_path {
  catfile( path, 'put' );
}

sub load {
  LoadFile( config_path );
}

sub save {
  my ( $class, $config ) = @_;
  DumpFile( config_path, $config ) 
}


1;
__END__
