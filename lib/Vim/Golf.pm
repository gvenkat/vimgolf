package Vim::Golf;

use strict;
use warnings;
use Vim::Golf::Config;
use Vim::Golf::Challenge;
use Vim::Golf::Constants;

my $messages;


sub run {
  my $class = shift;

}

sub setup { 
  my $class = shift;
  my $key   = $class->prompt( "Please specify your VimGolf API key (register on vimgolf.com to get it):" );

  if( $key =~ /[\w\d]{32}/ ) {
    # save the key
  }

  else {
    $class->error( "Invalid key, please double check your key on vimgolf.com" ); 
  }


}

sub put   { 
  my $class = shift;

  # FIXME: get ID
  my ( $id, $challenge );

  $class->warn( "Downloading Vimgolf challenge: $id" );

  VimGolf::Challenge->path( VimGolf::Config->put_path );

  $challenge = VimGolf::Challenge
    ->new( $id )
    ->download;

  
}


sub error {
  shift;
  print shift;
  exit 1;
}

sub message_for {
  shift;
  $messages->{ shift };
}

sub prompt {
  my ( $class, $prompt ) = @_;
  my $data;

  ( print $prompt ) && chomp( $data = scalar( <STDIN> ) ) && $data;
}

sub _setup_messages { 
  my $class = shift;

  my ( $current_command, $is_short_desc, $is_long_desc );
  my %msg = (); 

  # read all messages from __DATA__ section
  while( my $line = <DATA> ) {

    chomp( $line );

    # current command section?
    if( $line =~ /^\[(?<command>\w+)\]/ ) {

      # get the command
      $current_command  = $+{ command };

      # reset all flags
      $is_short_desc    = 0;
      $is_long_desc     = 0;

      # initialize messages
      $msg{$current_command} = {
        short => '',
        long  => ''
      };

    }

    # stick the messages in
    if( $line =~ /__(?<type>(?:SHORT)|(?:LONG))_DESC__/ && $current_command ) {
      $msg{$current_command}{ lc( $+{type} ) } .= $line . "\n";
    }

  }

  $messages = \%msg;

}




1;
__DATA__
[configure]

__SHORT_DESCRIPTION__
Configure your VimGolf credentials

__LONG_DESCRIPTION__
To participate in the challenge please go to vimgolf.com and register an
account. Once signed in, you will get your API key, which you need to
setup the command client.

If you have the key, simply run the setup and paste in your key.
