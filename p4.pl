#!/usr/bin/perl
use warnings;
use strict;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #4
# Find the largest palindrome made from the product of two 3-digit numbers.

my $t0 = [gettimeofday()];
my $biggest = 0;

for my $i (100..999) {
	for my $j (100..999) {
		my $product = $i * $j;
		my @prod = split //, $product;
		my @rev = reverse @prod;
		#print "@prod  @rev";
		if ($prod[0] == $rev[0]) {
			if ($prod[1] == $rev[1]) {
				$biggest = $product if ($prod[2] == $rev[2] && $product > $biggest);
			}
		}
	}
}
my $elapsed = tv_interval($t0, [gettimeofday()]);

print "$biggest\n";
print "Finished in $elapsed seconds."