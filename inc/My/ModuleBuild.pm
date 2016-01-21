package My::ModuleBuild;

use strict;
use warnings;
use base qw( Alien::Base::ModuleBuild );
use Capture::Tiny qw( capture );
use File::chdir;

# this will need to be updated with newer versions!
# also update inc/pkgconfig/nasm.pc
my $fetch_version = '2.11.08';

sub new
{
  my($class, %args) = @_;
  
  $args{alien_name} = 'nasm';
  $args{alien_stage_install} = 1;
  $args{alien_build_commands} = [
    '%c --prefix=%s',
    "%{gmake}",
  ];
  $args{alien_install_commands} = [
    "%{gmake} install",
  ],
  $args{alien_repository} = {
    protocol => 'http',
    host     => 'www.nasm.us',
    location => "/pub/nasm/releasebuilds/$fetch_version/",
    pattern  => qr{^nasm-.*\.tar\.gz$},
  };
  $args{alien_bin_requires}->{'Alien::gmake'} = '0.05';
  
  my $self = $class->SUPER::new(%args);
  
  $self;
}

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
