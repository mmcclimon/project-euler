#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

# Euler Project #22
# What is the total of all the name scores in the file?
my $t0 = [gettimeofday()];

open (my $file, "<", "names.txt") or die "Can't open file: $|";
my $name = <$file>;

# create a hash of letters/scores, and a sorted list of names
my %letters = map { ('A'..'Z')[$_-1] => $_ } (1..26);
my @list = sort map { substr $_, 1, -1 } split ',', $name;

my $sum = 0;
for (0..$#list) {
	my $score = 0;
	$score += $letters{$_} for (split //, $list[$_]);
	$score *= $_ + 1;
	$sum += $score;
}

say "Total value: $sum";



say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
