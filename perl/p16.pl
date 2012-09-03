#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

use Math::BigInt;

# Euler Project #16
# What is the sum of the digits of the number 2^1000 ?
my $t0 = [gettimeofday()];


# uses a big int, since I couldn't come up with anything more clever
my $base = new Math::BigInt '2';
my $value = $base->bpow(1000);

my $sum = 0; 
$sum += $_ for (split //, $value);
say "Sum of digits: $sum";


say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
