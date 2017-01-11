#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;
use autodie; # die if problem reading or writing a file

package FileWriter;

$FileWriter::VERSION = "0.01";

sub new{
	my $class = shift;
	my $self = {
    	name => shift,
    	lines => shift,
    	path => shift
    };
    bless $self, $class;
    return $self;
}