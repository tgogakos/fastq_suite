#!/usr/bin/perl
#

$cnt=1;
open(IN,$ARGV[0]) || die();
while(<IN>)
	{
	if(/^\@HI/)
		{
		$s=<IN>;
		print ">$cnt\n$s";
		$cnt++;
		}	
	}
close(IN);