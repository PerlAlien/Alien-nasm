package Alien::nasm;

use strict;
use warnings;
use base qw( Alien::Base );
use Env qw( @PATH );
use File::Spec;

# ABSTRACT: Find or build nasm, the netwide assembler
# VERSION

=head1 SYNOPSIS

 use Alien::nasm;
 # nasm should now be in your PATH if it wasn't already

=head1 DESCRIPTION

=cut

my $in_path;

sub import
{
  return if Alien::nasm->install_type('system');
  return if $in_path;
  unshift @PATH, File::Spec->catdir(Alien::nasm->dist_dir, 'bin');
  # only do it once.
  $in_path = 1;
}

1;
