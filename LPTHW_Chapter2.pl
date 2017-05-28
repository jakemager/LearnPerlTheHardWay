use strict;
use warnings;

#Exercise 2.1
# Write a program called grep.pl that takes a pattern
# and a list of files as command line arguments, and that
# traverses each file printing lines that match the pattern.

#parameters: dir, pattern
sub findFiles {
  my $dirName = shift || "";
  my $pattern = shift || ""; #default to all files
  my $file;
  my @files = glob "$dirName/*";

  for $file(@files) {
    if ($file =~ m/$pattern/) {
      print "$file\n";
    }
  }
}

#Exercise 2.2
# Write a regular expression that matches any word that
# starts with a param and ends with a param

#parameters: patternStart, patternEnd, dir
sub findFiles2 {
  my $patternStart = shift;
  my $patternEnd = shift;

  if (length($patternEnd) < 1|| length($patternStart) < 1) {
    print "No pattern parameters!";
    return;
  }

  my $dirName = shift || "";
  my $file;
  my @files = glob "$dirName/*";

  for $file(@files) {
    $file = substr $file, 1; #remove / from string name
    #regex: starting with pattern - anything/any length - ending with pattern
    if ($file =~ m\^$patternStart.+$patternEnd$\ ) {
      print "$file\n";
    }
  }
}



#Exercise 2.3
# • Find all the words that begin with a|b and end with a|b. The list should include “adverb” and “balalaika”.
# • Find all the words that either start and end with a or start and end with b. The list should include “alfalfa” and “bathtub”, but not “absorb” or “bursa”.
# • Find all the words that begin with un or in and have exactly 17 letters.
# • Find all the words that begin with un or in or non and have more than 17 letters.

sub findWords {
  open FILE, "/Users/jmager/Desktop/LearnPerlTheHardWayExercises/testText"
    or die "Can't open file $!";


  my (@ary1, @ary2, @ary3, @ary4);
  #$1 = '';
  for my $line(<FILE>) {
    if ($line =~ /^[ab].+[ab]$/i) {
      push (@ary1, $line);
    }

    if ($line =~ /^([ab])/i && $line =~ /$1$/) {
      push (@ary2, $line);
    }

    if ($line =~ /^un.{15}$/i || $line =~ /^in.{15}$/i) {
       push (@ary3, $line);
    }

    if ($line =~ /^un.{16,}$/i || $line =~ /^in.{16}$/i) {
       push (@ary4, $line);
    }

  }

  print "begin with a|b and end with a|b\n";
  for (@ary1) { print }
  print "\neither start and end with a or start and end with b\n";
  for (@ary2) { print }
  print "\nbegin with un or in and have exactly 17 letters\n";
  for (@ary3) { print }
  print "\nbegin with un or in or non and have more than 17 letters\n";
  for (@ary4) { print }
}


#findFiles("", "bin");
#findFiles2("c", "s", "");
#findWords();
