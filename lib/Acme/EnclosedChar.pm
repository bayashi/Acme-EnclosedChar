package Acme::EnclosedChar;
use strict;
use warnings;
use utf8;
use parent qw/Exporter/;
our @EXPORT_OK = qw/enclose/;

our $VERSION = '0.01';

my %MAP;
{
    my @numbers = _s('⓪①②③④⑤⑥⑦⑧⑨');
    my @double_digits = _s('⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲'
                            . '⑳㉑㉒㉓㉔㉕㉖㉗㉘㉙'
                            . '㉚㉛㉜㉝㉞㉟㊱㊲㊳㊴'
                            . '㊵㊶㊷㊸㊹㊺㊻㊼㊽㊾㊿');
    my @alphabet_uc = _s('ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ');
    my @alphabet_lc = _s('ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ');

    for my $i (0..9) {
        $MAP{numbers}->{$i} = shift @numbers;
    }
    for my $i (10..50) {
        $MAP{double_digits}->{$i} = shift @double_digits;
    }
    for my $i ('A'..'Z') {
        $MAP{alphabet_uc}->{$i}    = shift @alphabet_uc;
        $MAP{alphabet_lc}->{lc $i} = shift @alphabet_lc;
    }
}

sub _s { return split('', $_[0]); }

sub enclose {
    my $string = shift;

    return '' if !defined($string) || $string eq '';

    for my $dg (keys %{$MAP{double_digits}}) {
        $string =~ s!([^\d])$dg([^\d])!$1$MAP{double_digits}->{$dg}$2!g;
    }

    for my $i (keys %{$MAP{numbers}}) {
        $string =~ s!$i!$MAP{numbers}->{$i}!g;
    }

    for my $i ('A'..'Z') {
        $string =~ s!$i!$MAP{alphabet_uc}->{$i}!g;
        my $j = lc $i;
        $string =~ s!$j!$MAP{alphabet_lc}->{$j}!g;
    }

    return $string;
}

1;

__END__

=encoding UTF-8

=head1 NAME

Acme::EnclosedChar - Ⓔⓝⓒⓛⓞⓢⓔⓓ Ⓐⓛⓟⓗⓐⓝⓤⓜⓔⓡⓘⓒⓢ Ⓔⓝⓒⓞⓓⓔⓡ


=head1 SYNOPSIS

    use Acme::EnclosedChar;


=head1 DESCRIPTION

Acme::EnclosedChar is


=head1 METHOD

=head2 enclose($text)

encode text into Enclosed Alphanumerics


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
