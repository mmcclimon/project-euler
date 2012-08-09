#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #23
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
my $t0 = [gettimeofday()];

my %abundant;

sub sum_divisors {
	my $sum = 0;
	my $composite = shift;
	for (1..sqrt($composite)) {
		if ($composite % $_ == 0) {
			$sum += $_;
			my $pair = $composite / $_;
			$sum += $pair if ($_ > 1 && $_ != $pair );
		}
	}
	$sum;
}

sub summable {
	my $num = shift;
	for (keys %abundant) {
		#last if ($_ > $num);
		return 1 if (exists $abundant{$num - $_});
	}
	#say "$num is not summable";
	return 0;
}



for (2..28123) {
	$abundant{$_} = 0 if (sum_divisors($_) > $_);
}

#print "$_ " for (sort {$a <=> $b}keys %abundant);
#print "\n";
my $sum = 0;
my @unsums;
for (1..28123) {
	$sum += $_ unless summable($_);
}

#say scalar @unsums;
#$sum += $_ for @unsums;
say "Sum of non-summable abundant numbers: $sum";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
