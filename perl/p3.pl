#!/usr/bin/perl
use warnings;
use strict;

# this is really inefficient

my $composite = 600_851_475_143;

my @primes = (2);
my @factors;

select(STDOUT); $| = 1;
my $max = sqrt($composite);
print "max = $max\n";
my $num = 3;
while ($num < $max) {
	my $found;
	for (@primes) {
		if ($num % $_ == 0) {
			$found = 1;
			last;
		}
	}
	push(@primes, $num) unless $found;
	$num += 2;
}

for (@primes) {
	#print "$composite\n";
	if ($composite % $_ == 0) {
		print "found one, $_\n";
		push @factors, $_;
		$composite /= $_;
		redo;
	}
}

#print "\n@primes";


@factors == 0 ? print "\n\nnum is prime" : print "\n\n@factors";