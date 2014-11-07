package Acme::EnclosedChar;
use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my $args  = shift || +{};

    bless $args, $class;
}

1;

__END__

=head1 NAME

Acme::EnclosedChar - one line description


=head1 SYNOPSIS

    use Acme::EnclosedChar;


=head1 DESCRIPTION

Acme::EnclosedChar is


=head1 REPOSITORY

Acme::EnclosedChar is hosted on github: L<http://github.com/bayashi/Acme-EnclosedChar>

Welcome your patches and issues :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Other::Module>


=head1 LICENSE

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

=cut
