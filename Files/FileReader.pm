#!/usr/bin/perl
use strict;
use warnings;

use Path::Class;
use autodie; # die if problem reading or writing a file

package FileReader;

$FileReader::VERSION = "0.02";

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

sub setName{
  my ($self, $new_name) = @_;
  $self->{name} = $new_name if defined($new_name);
  return $self->{name};
}

sub getName{
  my ($self) = @_;
  return $self->{name};
}

sub getLines{
	my ($self) = @_;
   	return $self->{lines} if defined($self->{lines}); 
	return $self->Count();
}

sub setPath{
  my ($self, $new_path) = @_;
  $self->{path} = $new_path if defined($new_path);
  return $self->{path};
}

sub getPath{
  my ($self) = @_;
  return $self->{path};
}

sub ShowLines{
	my ($self) = @_;
	my $count = 0;
	my $file_handle = $self->GetFileHandle();

	while(my $line = $file_handle->getline()) {
        print $line;
        $count++;
	}
	$self->{lines} = $count if defined($count);	
	return $count
}

sub GetFileHandle{
	my ($self) = @_;

	my $dir = $self->{path};

	my $file = $dir->file($self->{name});

	my $file_handle = $file->openr();
	
	return $file_handle;
}

sub Count{
	my ($self) = @_;
	
	my $count = 0;
	
	my $file_handle = $self->GetFileHandle();
	
	while($file_handle->getline )
	{
    	$count++;
	}
	$self->{lines} = $count if defined($count);	
	return $count;
}