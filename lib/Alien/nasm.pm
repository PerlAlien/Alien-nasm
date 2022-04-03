package Alien::nasm;

use strict;
use warnings;
use base qw( Alien::Base );
use Env qw( @PATH );
use File::Spec;

# ABSTRACT: Find or build nasm, the netwide assembler
# VERSION

=head1 SYNOPSIS

From your Perl script:

 use Alien::nasm ();
 use Env qw( @PATH );
 
 unshift @ENV, Alien::nasm->bin_dir;
 system 'nasm', ...;

From L<alienfile>:

 use alienfile;
 
 share {
   requires 'Alien::nasm';
   build [
     '%{nasm} ...',
   ];
 };

=head1 DESCRIPTION

This Alien module provides Netwide Assembler (NASM).

This class is a subclass of L<Alien::Base>, so all of the methods documented there
should work with this class.

=head1 HELPERS

=head2 nasm

 %{nasm}

Returns the name of the nasm executable.

=head2 ndisasm

 %{ndisasm}

Returns the name of the ndisasm executable.

=cut

sub alien_helper
{
  return {
    nasm => sub {
      'nasm';
    },
    ndisasm => sub {
      'ndisasm';
    },
  }
}

1;

