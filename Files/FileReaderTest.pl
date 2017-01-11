#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;

use lib 'lib';
use FileReader;
 
my $file_reader = new FileReader("rust.rs", undef, dir('\dev','Rust'));
 
print("File name: ");
print($file_reader->getName());
print("\nFile path: ");
print($file_reader->getPath());
print("\nNumber of lines: ");
print($file_reader->getLines());
print("\nFile content: \n");
$file_reader->ShowLines();
 