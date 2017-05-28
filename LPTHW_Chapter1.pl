use strict;
use warnings;

sub test {
  print "test\n";
}

#Exercise 1.1
# Write a subroutine called print dir that takes
# the name of a directory as a parameter
# and that prints the file in that directory, one per line.

#parameter dirName
sub print_dir {
  my $dirName = shift || "";
  my @files = glob "$dirName/*";
  for my $file(@files) {
    print "$file\n";
  }
}

#Exercise 1.2
# open and read a file

#parameter fileName
sub print_file {
  my $fileName = shift;

  #if no parameters given
  if (!defined($fileName)) {
    print "No filename specified!";
    return;
  }

  open (FILE, "<", $fileName)
    or die "Unable to open file $!";

  for my $stuff(<FILE>) {
    print $stuff;
  }

  close(FILE);
}


#Exercise 1.3
# reads all dirs out in a dir

#parameter dirName
sub print_dir2 {
  my $dirName = shift || "";
  my @files = glob "$dirName/*";
  my @subFiles;

  for my $file(@files) {
    @subFiles = glob "$dirName$file/*";
    print "DIR: $file\n";

    for my $subFile(@subFiles) {
      print "\t$subFile\n";
    }

    print "\n\n";
    @subFiles = ();
  }
}

#test;
#print_dir();
#print_file("/Users/jmager/Desktop/testShit.pl");
#print_dir2();
