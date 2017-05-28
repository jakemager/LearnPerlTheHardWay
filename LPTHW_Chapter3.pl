#use strict;
use warnings;

#Exercise 3.1
# Perl also provides an operator named reverse that does
# almost the same thing as rev, except that it modifies
# the parameter list rather than creating a new one.
# Modify rev so that it works the same way.

sub rev {
  #print @_/2;
   for (my $i = 0; $i < @_/2; $i++) {
     swap ($_[$i], $_[-$i-1]);
  }
  return @_;
}

@a = (1,2,3,4,5,6);
print rev(@a);
