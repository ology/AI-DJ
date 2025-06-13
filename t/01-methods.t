#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

use_ok 'AI::DJ';

new_ok 'AI::DJ';

my $obj = new_ok 'AI::DJ' => [
    verbose => 1,
];

is $obj->verbose, 1, 'verbose';

done_testing();
