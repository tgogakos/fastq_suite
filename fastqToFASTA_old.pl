#!/usr/bin/env perl
( $infile ) = @ARGV;

open(USRFL, "<", $infile) or die "Can't open $infile\n";
my $lines = 0;
while(<USRFL>) {
	chomp $_;
	$lines++;
	if( /^\@/ ) { $ac = substr($_, 1); $x = 1;}
	elsif( /\w/ && $x == 1 ) {
		if( not /N/ ) { print ">$ac\n$_\n"; }
		else { $nCount++; }
		$x = 0;
	}
}
close USRFL;
my $reads = $lines/4;
my $frac = 100*$nCount/$reads;
print STDERR "Total Reads: $reads\nReads filtered containing N: $nCount\nPercent Reads filtered containing N: $frac\n";



