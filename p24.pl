#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

use Algorithm::Loops qw(NextPermuteNum);

# Euler Project #10
# Find the sum of all the primes below two million.
my $t0 = [gettimeofday()];

my @list = 0..9;
my @perms;
my $count = 0;
do { $count++; push @perms, "@list" } while NextPermuteNum @list;

say "Total number of permutations: $count";
say "Millionth permutation: $perms[999_999]";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";