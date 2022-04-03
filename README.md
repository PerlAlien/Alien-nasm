# Alien::nasm ![static](https://github.com/PerlAlien/Alien-nasm/workflows/static/badge.svg) ![linux](https://github.com/PerlAlien/Alien-nasm/workflows/linux/badge.svg) ![macos](https://github.com/PerlAlien/Alien-nasm/workflows/macos/badge.svg) ![windows](https://github.com/PerlAlien/Alien-nasm/workflows/windows/badge.svg)

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

Returns the name of the nasm executable.

## ndisasm

```
%{ndisasm}
```

Returns the name of the ndisasm executable.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017-2022 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
