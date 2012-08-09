#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #21
# Evaluate the sum of all amicable pairs under 10000.
my $t0 = [gettimeofday()];

my $numCalcs = 0;
sub sum_divisors {
	$numCalcs++;
	my $sum = 0;
	my $composite = shift;
	for (1..$composite/2) {
		$sum += $_ if ($composite % $_ == 0);
	}
	$sum;
}

my %aliquots;
my @amicables;

for (2..10000) {
	my $sum = sum_divisors($_);
	$aliquots{$_} = $sum;
	if (exists $aliquots{$sum}) {
		push @amicables, ($aliquots{$_}, $_) if ($aliquots{$sum} == $_ && $_ != $sum);
	}
}
#say "@amicables";

my $sum = 0;
$sum += $_ for @amicables;

say "Sum of all amicable pairs < 10,000: $sum";
say "Did $numCalcs calculations...";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
