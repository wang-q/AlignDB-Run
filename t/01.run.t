#!/usr/bin/perl
use strict;
use warnings;

use Test::More tests => 2;

BEGIN {
    use_ok('AlignDB::Run');
}

my $jobs = [ 'a' .. 'z' ];
my $code = sub {
    my $task = shift;

    print $task, "\n";

    return;
};

my $run = AlignDB::Run->new(
    parallel => 8,
    jobs     => $jobs,
    code     => $code,
);
$run->run;

is scalar @$jobs, 0, "There should be no task lefted";