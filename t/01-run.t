use strict;
use warnings;
use Test::More;

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
    parallel => 4,
    jobs     => $jobs,
    code     => $code,
);
$run->run;

is( scalar @$jobs, 0, "There should be no task lefted" );

done_testing();
