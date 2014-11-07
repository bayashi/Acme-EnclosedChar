use strict;
use warnings;
use utf8;
use Test::More;

use Acme::EnclosedChar qw/penclose/;

is penclose(), '';
is penclose(undef), '';

is penclose('0'), '⓪';
is penclose('1'), '①';
is penclose('012345'), '⓪①②③④⑤';
is penclose('0!12!34!5!'), '⓪!⑫!㉞!⑤!';
is penclose('Perl'), 'Ⓟⓔⓡⓛ';
is penclose('Rubyは1993/2/24生まれ'), 'Ⓡⓤⓑⓨは①⑨⑨③/②/㉔生まれ';

done_testing;
