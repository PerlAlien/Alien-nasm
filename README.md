# Alien::nasm [![Build Status](https://secure.travis-ci.org/plicease/Alien-nasm.png)](http://travis-ci.org/plicease/Alien-nasm)

Find or build nasm, the netwide assembler

# SYNOPSIS

From your Perl script:

```perl
use Alien::nasm ();
use Env qw( @PATH );

unshift @ENV, Alien::nasm->bin_dir;
system 'nasm', ...;
```

From [alienfile](https://metacpan.org/pod/alienfile):

```perl
use alienfile;

share {
  requires 'Alien::nasm';
  build [
    '%{nasm} ...',
  ];
};
```

# DESCRIPTION

This Alien module provides Netwide Assembler (NASM).

This class is a subclass of [Alien::Base](https://metacpan.org/pod/Alien::Base), so all of the methods documented there
should work with this class.

# HELPERS

## nasm

```
%{nasm}
```

Returns the name of the nasm executable.  As of this writing it is always
`nasm`, but in the future it may have a different value.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
