package Vim::Golf::Config;

use strict;
use YAML::Any;

sub save {
  my ( $class, $config ) = @_;
  DumpFile( $class->path, $config );
}

sub load {
  LoadFile( path() );
}

sub path {
  $ENV{HOME} . '/.vimgolf';
}

sub put_path {
  path . '/put';
}


1;
__END__
