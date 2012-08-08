#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Time::HiRes qw(gettimeofday tv_interval);

use POSIX;

# Euler Project #17
# How many letters would be needed to write all the numbers in words from 1 to 1000?
my $t0 = [gettimeofday()];

my %ones = qw{ 1 one 2 two 3 three 4 four 5 five 6 six 7 seven 8 eight 9 nine };
my %tens = qw{ 2 twenty 3 thirty 4 forty 5 fifty 6 sixty 7 seventy 8 eighty 9 ninety };
my %teens = qw { 10 ten 11 eleven 12 twelve 13 thirteen 14 fourteen 15 fifteen 16 sixteen 17 seventeen 18 eighteen 19 nineteen };

my $sum = 0;
for (1..1000) {
	my $num = $_;
	my $str = '';
		
	# 1000 is a special case
	if ($num == 1000) {
		$str = "onethousand";
		$sum += length($str);
		next;
	}

	#hundreds
	my $hund = floor($num/100);
	if ($hund) {
		$str .= "$ones{$hund}hundred";
		$str .= "and" if ($num % 100);
	}

	#tens
	$num -= $hund * 100;
	my $ten = floor($num/10);
	if ($ten == 1) {
		$str .= "$teens{$num}";
	} elsif ($ten > 1) {
		$str .= "$tens{$ten}";		
	}
	
	# ones
	$num -= $ten * 10;
	$str .= "$ones{$num}" if ($num && $ten != 1);
	
	$sum += length($str);
}

say "Total number of letters: $sum";

say "\nFinished in ",tv_interval($t0, [gettimeofday()]) ," seconds.";
