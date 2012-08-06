#!/usr/bin/perl
use warnings;
use strict;

my @palindromes;
for my $i (100..999) {
	for my $j (100..999) {
		my $product = $i * $j;
		my @prod = split //, $product;
		my @rev = reverse @prod;
		#print "@prod  @rev";
		if ($prod[0] == $rev[0]) {
			if ($prod[1] == $rev[1]) {
				push @palindromes, $product if ($prod[2] == $rev[2]);
			}
		}
	}
}

print ((sort {$b <=> $a} @palindromes)[0]);
#print "$sorted[0]";