#!/usr/bin/perl
use warnings;
use strict;

my @fibs = (1, 2);
my $sum = 2;
my $i = 3;

while (1) {
	my $fib = $fibs[-1] + $fibs[-2];
	last if $fib > 4_000_000;
	$sum += $fib if ($fib % 2 == 0);
	push(@fibs, $fib);
	$i++;
}

print $sum;

=cut 
for (my $i = 0; $i < @fibs; $i++) {
	$sum += $fibs[$i] if ($i % 2 == 0);
}

print $sum;