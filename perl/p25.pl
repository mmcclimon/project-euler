#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

use bigint;

# Euler Project #25
# What is the first term in the Fibonacci sequence to contain 1000 digits?
my $t0 = [gettimeofday()];

my @fibs = (0,1);
push @fibs, ($fibs[-1] + $fibs[-2]) while (length($fibs[-1]) < 1000);

say "F$#fibs: $fibs[-1]";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";