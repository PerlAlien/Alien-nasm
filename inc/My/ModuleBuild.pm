package My::ModuleBuild;

use strict;
use warnings;
use base qw( Alien::Base::ModuleBuild );
use Capture::Tiny qw( capture );
use File::chdir;

sub alien_check_installed_version
{
  my($stdout, $stderr) = capture {
    system 'nasm', '-v';
  };
  $stdout =~ /NASM version ([0-9.]+)/ ? $1 : ();
}

sub alien_check_built_version
{
  $CWD[-1] =~ /^nasm-(.*)$/ ? $1 : 'unknown';
}

1;
