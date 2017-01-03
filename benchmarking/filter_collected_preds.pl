#!/usr/bin/env perl

use strict;
use warnings;

my $usage = "\n\n\tusage: $0 preds.collected.wAnnot\n\n";

my $preds_file = $ARGV[0] or die $usage;

open (my $fh, $preds_file) or die "Error, cannot open file $preds_file";
while(<$fh>) {
    my $line = $_;
    my @x = split(/\t/);
    my $fusion_name = $x[2];
    my $annot = $x[5];
    
    if ($fusion_name =~ /HLA/ 
        ||
        $annot =~ /chrM:/
        ||
        $annot =~ /NEIGHBOR/
        ||
        $annot =~ /BLAST/
        ) {
        next;
    }

    
    print $line;
}

exit(0);

