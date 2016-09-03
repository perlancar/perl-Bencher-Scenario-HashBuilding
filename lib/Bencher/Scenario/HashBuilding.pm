package Bencher::Scenario::HashBuilding;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark building hash by adding one key at a time vs building via array',
    participants => [
        {
            name=>'one-key-at-a-time',
            code_template=>'state $keys=<keys>; my $hash = {}; for my $key (@$keys) { $hash->{$key} = 1 }; $hash',
        },
        {
            name=>'via-array',
            code_template=>'state $keys=<keys>; my $hash = {}; my $ary = []; for my $key (@$keys) { push @$ary, $key, 1 }; $hash = { @$ary }',
        },
    ],
    datasets => [
        {name=>'keys=1'    , args=>{keys=>[1]}},
        {name=>'keys=10'   , args=>{keys=>[1..10]}},
        {name=>'keys=100'  , args=>{keys=>[1..100]}},
        {name=>'keys=1000' , args=>{keys=>[1..1000]}},
        {name=>'keys=10000', args=>{keys=>[1..10000]}},
    ],
};

1;
# ABSTRACT:

=head1 append:SEE ALSO

L<Bencher::Scenario::ArrayVsHashBuilding>
