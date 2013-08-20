package Vim::Golf::Challenge;

use strict;
use Carp qw/confess/;
use Vim::Golf::Constants;
use LWP::UserAgent;
use JSON::Any;

my $put_path;

sub path {
  shift;
  $put_path = $path;
}

sub new {
  my ( $class, $id ) = @_;

  confess "ID is required, none given" 
    unless $id;

  bless {
    id    => $id,
    data  => undef
  } $class;

}

# Replace these accessors
sub id { shift->{id}; }
sub data { shift->{data}; }


sub url {
  "@{[ GOLFHOST ]}/challenges/@{[ $self->id ]}.json";
}


sub download {
  my $self      = shift;

  $self->{data} = $self->get_challenge_data;

  $self
    ->cleanup
    ->save;

}


sub save {
  my $self = shift;

  $self;

}

sub start {
  my $self = shift;

  $self;
}

sub cleanup {
  my $self = shift;

  ( $self->data->{$_} =~ s/\r\n/\n/g )
    for qw/in out/;

  $self;

}


sub get_response {
  my ( $self, $url ) = @_;
  my $response = $self->agent->get( $url );

  unless( $response->is_success ) {
    confess( $response->error );
  }

  $response->content;
}


sub get_challenge_data {
  my $self = shift;

  $self->from_json( 
    $self->get_response( 
      $self->url
    )
  );
}


sub from_json {
  shift;

  JSON::Any
    ->new
    ->jsonToObj( shift ); 
}

1;
__END__
