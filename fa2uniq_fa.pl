#!/usr/bin/perl

# written by Miguel Brown 2010-Apr-14. This script takes a fasta file and compresses it into one with uniq reads only with the count as part of the seq name


%reads;
open(I,$ARGV[0]) || die;

while(<I>){
    chomp $_;
    if($_!~/^>/){
	$reads{$_}+=1;
    }
}
close(I);
my $i=1;
foreach $read(sort {$reads{$b}<=>$reads{$a}} keys %reads){
    print ">Read_$i"."\|$reads{$read}\n$read\n";
    $i+=1;
}
