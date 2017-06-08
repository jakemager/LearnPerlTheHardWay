#use strict;
use warnings;

#Exercise 3.1
# Perl also provides an operator named reverse that does
# almost the same thing as rev, except that it modifies
# the parameter list rather than creating a new one.
# Modify rev so that it works the same way.
sub swap {
    ($_[0], $_[1]) = ($_[1], $_[0]);
}

sub rev {
  #print @_/2;
   for (my $i = 0; $i < @_/2; $i++) {
     swap ($_[$i], $_[-$i-1]);
  }
  return @_;
}


#Exercise 3.2
# Using the subroutines in this chapter, write a program that reads a text file
# and counts the number of times each word is used.
# Hint: use the lc operator to convert words to lower case,
# and the first argument of split to list the characters that should separate words.
# You can download the text of many out-of-copyright books from gutenberg.net.
# Modify the program so that it prints the number of unique words that appear in the book.
# Modify the program so that it prints the most commonly used word and the
# number of times it appears.
sub readAndCount {
  open (FILE, "<", "gutenberg")
    or die "Unable to open file $!";
  my %words;

  for my $line(<FILE>) {
    @lines = split '\s', $line;
    for $word(@lines) {
      if ($word ne " " && $word ne "") {  # I don't know why, but is counting empty strings and spaces
        $word = lc($word);
        $words{$word}++;
      }
    }
  }

  $uniqueWords = keys %words;

  my $maxNumber = 0;
  my $maxNumberKey;
  while (my ($key, $value) = each %words) {
    if ($value > $maxNumber) {
      $maxNumber = $value;
      $maxNumberKey = $key;
    }
  }

  close(FILE);
  print "@{[%words]}\n";   # this prints the whole hash
  #print "Word: the, Count: $words{'the'}\n";  # print the count for "the"
  print "Unique word count: $uniqueWords\n";
  print "Max word: $maxNumberKey at $words{$maxNumberKey} times\n";


  #Exercise 3.3
  # Modify the program from the previous section to print the
  # 20 most common words in a file and their frequencies.

  sub byValue {
      $words{$b} <=> $words{$a};
  }
  # $_ is equal to a parameter
  if ($_[0]) {
    my @sortedList = sort byValue keys %words;
    for (my $i = 0; $i < 21; $i++) {
      print "Word: $sortedList[$i], Count: $words{$sortedList[$i]}\n";
    }
  }

}

#Exercise 3.4 
# Grab the text of your favorite book from gutenberg.net and make
# a list of the words in the book that aren’t in your dictionary.




# print exercises
#@a = (1,2,3,4,5,6);
#print rev(@a);
#readAndCount(true);
