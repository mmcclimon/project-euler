#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

use bigint;

# Euler Project #20
# Find the sum of the digits in the number 100!
my $t0 = [gettimeofday()];

my $fact = 1;
my $sum = 0;
$fact *= $_ for (2..100);
$sum += $_ for (split //, $fact);

say "100! = $fact";
say "sum of digits = $sum";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
