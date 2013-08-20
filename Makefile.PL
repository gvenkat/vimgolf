use strict;
use warnings;

# FIXME: move to ExtUtils::MakeMaker
use inc::Module::Install;

name 'Vim::Golf';
all_from 'lib/Vim/Golf.pm';
license 'perl';

requires 'YAML::Any'              => 0;
requires 'LWP::UserAgent'                => 0;
requires 'JSON::Any'           => 0;

build_requires 'Test::More'     => 0;

tests('t/*.t');

WriteAll();
