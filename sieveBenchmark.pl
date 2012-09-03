#!/usr/bin/perl
use warnings;
use strict;
use v5.10;
use Benchmark qw(timethese cmpthese :hireswallclock);

sub looping {
	my $limit = 1_000_000;
	my @list = map {$_ = 1} 0..$limit;
	for my $i (2..sqrt($limit)) {
		if ($list[$i]) {
			for (my $j = $i**2; $j < @list; $j += $i) {
				$list[$j] = 0;
			}
		}
	}
	
	my @primes;
	for (2..$#list) {
		push @primes, $_ if $list[$_];
	}
	@primes;
}

sub grepping {
	my $limit = 1_000_000;
	my @list = map {$_ = 1} 0..$limit;

	for my $i (2..sqrt($limit)) {
		if ($list[$i]) {
			for (my $j = $i**2; $j < @list; $j += $i) {
				$list[$j] = 0;
			}
		}
	}

	my @primes = grep { $list[$_] } (2..$#list);
}

my $results = timethese(10, {
	"loop" => '&looping',
	"grep" => '&grepping'
});

cmpthese($results);