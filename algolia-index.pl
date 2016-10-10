#!/usr/bin/perl

use strict;
use warnings;
use JSON;
use File::Find;
use List::MoreUtils qw(firstidx);
use HTTP::Request;
use LWP::UserAgent;
use Getopt::Long qw(GetOptions);
use Pod::Usage;

###
# algolia API setting
###

my $algolia_api_key='***REMOVED***';
my $algolia_appliacation_id='GEETCE1DI1';

###
# global variables
###

my $index = {};
my $json_index;
my $icon = '';
my $url_prefix = '';
my $content_directory = '';
my $algolia_index_name = '';
my $config = {};

my $config_file = 'config.toml';
my $dryrun;
my $help;
my $urlcheck;


sub index_file {
  my $filename = shift;
  my $file;
  my $base_url;
  my $description;
  my $title;
  my $in_header = 1;
  my $headline;
  my $url;
  my $content;
  my $prio = 1;

  open($file, "<", $filename )
    or die "Can't open $filename: $!";

  while (<$file>) {

      ###
      # Parsing the header
      ###

      if ( /^draft:\s+true/ ) {
        last;
      }

      if ( /^url: (.*)/ && ! $base_url ) {
        $base_url = $1;
        $base_url =~ s/^\s+|\s+$//g;
        $base_url =~ s/^\///;

        next;
      }

      if ( /^title: (.*)/ && ! $title ) {
        $title = $1;
        next;
      }

      if ( /^description: (.*)/ && ! $description ) {
        $description = $1;
        next;
      }

      # If we find ^---$ twice the header is over
      if ( /^---$/ && $in_header ){
         $in_header++;
         if ($in_header == 3){
           # Push header to index
           push @{$index->{requests}},
                   { action => "addObject",
                     body => {
                       title => $title,
                       url => "$url_prefix$base_url",
                       text => $description,
                       prio => $prio,
                       icon => $icon,
                       type => "page"
                     }
                  };
           $prio++;
           $in_header = 0;

         }
      }

      next if $in_header;

      ###
      # Parsing the section
      ###

      if ( /^#./ ) {
        # Index the data of the last section if any
        if ($content){
          $content =~ s/{{%.*%}}//g; # Delete shortcodes
          $content =~ s/!\[.*\]\(.*\)//g; # Delete links
          $content =~ s/\r?\n|\r/ /g; # Replace line breaks with space
          $content =~ s/[`|*]/ /g; # Replace markup signs
          $content =~ s/--+//g; # Delete multibe -- signs
          $content =~ s/\s+/ /g; # Replace multible spaces with one
          $content =~ s/^\s+|\s+$//g; #Trim

        # Push to index


        push @{$index->{requests}},
                { action => "addObject",
                  body => {
                    title => $headline,
                    url => "$url_prefix$url",
                    text => $content,
                    prio => $prio,
                    icon => $icon,
                    type => "section"
                  }
                };
          $prio++;

        }

        # Start a new section

        s/#*//g;
        s/^\s+|\s+$//g;
        s/\s+/ /g;

        $headline = "$title > $_";

        $url = "$base_url/#$_";
        $url = lc($url);
        $url =~ s/\s/-/g;
        $url =~ s/\/\//\//g;
        $url =~ s/^\///;
        $url =~ s/[^0-9a-zA-Z\/\-_#äöüÄÖÜß]//g;
        $url =~ s/--+/-/g;
        $content = '';

        next;
      }

      next if ! $headline;

      ###
      # Parsing the content
      ###

      # Skip empty lines
      next if (/^$/);

      $content = "$content $_ ";

    }
    close ($file);
}

sub get_icon {
  my $filename = shift;
  my $file;

  open($file, "<", $filename )
    or die "Can't open $filename: $!";

  while (<$file>) {
    if ( /^icon: (.*)/ ) {
      $icon = $1;
      last;
    }
  }

  close ($file);
}

sub process_files {

  if (/.*index.md/){

    get_icon($_);
  }

  # Only process content pages
  if ( /.*\.md$/ && ! /.*index.md/ ) {
    index_file($_);
  }
}

sub sort_files {
  my $id;
  # If we find an index.md put it at top of the list, because we need that
  # Information first.

  $id = firstidx { $_ eq "index.md" } @_;
  if ( $id != -1 ) {
    splice (@_,$id);
    unshift (@_,"index.md");
  }
  return @_;
}

sub algolia_clear {
  my $url = "https://$algolia_appliacation_id.algolia.net/1/indexes/$algolia_index_name/clear";
  my $req = HTTP::Request->new( 'POST', $url );
  $req->header( 'X-Algolia-Application-Id' => $algolia_appliacation_id,
                'X-Algolia-API-Key' => $algolia_api_key
  );

  my $ua = LWP::UserAgent->new;
  $ua->ssl_opts(verify_hostname => 0);
  my $res = $ua->request( $req );

  if ($res->is_success) {
    print $res->decoded_content;
  }
  else {
    die $res->status_line . " " . $res->decoded_content;
  }

}

sub algolia_push {

  my $url = "https://$algolia_appliacation_id.algolia.net/1/indexes/$algolia_index_name/batch";
  my $req = HTTP::Request->new( 'POST', $url );
  $req->header( 'X-Algolia-Application-Id' => $algolia_appliacation_id,
                'X-Algolia-API-Key' => $algolia_api_key
  );
  $req->content( $json_index );

  my $ua = LWP::UserAgent->new;
  $ua->ssl_opts(verify_hostname => 0);
  my $res = $ua->request( $req );

  if ($res->is_success) {
    print $res->decoded_content;
  }
  else {
    die $res->status_line . " " . $res->decoded_content;
  }

}

sub read_config {
  my $filename = shift;
  my $file;
  my @vars = qw( contentdir algoliaindex wikiurl handbookurl );
  my $var;

  open($file, "<", $filename )
    or pod2usage(-message => "\n\n***\n* ERROR: Can't open config file $filename: $!\n***\n\n",
                  -exitval => 0,
                  -verbose => 2,
                  -noperldoc => 1
                  );


  while (<$file>) {

    foreach $var (@vars) {
      if ( /^\s*$var\s*=\s*(.*)/ ) {
        $config->{$var} = $1;
        $config->{$var} =~ s/"//g;
        next;
      }
    }
  }

  close ($file);

  foreach (@vars) {
    if ($config->{$_}){

      print ("Using '$config->{$_}' as $_.\n");

    } else {

      print ("Could not find '$_' variable in $filename. Please specify.\n");
      exit 1;
      pod2usage(-message => "\n\n***\n* ERROR: Could not find '$_' variable in $filename. Please specify.\n***\n\n",
                -exitval => 0,
                -verbose => 2,
                -noperldoc => 1
                );

    }
  }

}


###
# Main
###

GetOptions('config=s' => \$config_file,
           'dryrun' => \$dryrun,
           'urlcheck' => \$urlcheck,
           'help|?' => \$help );

pod2usage(-exitval => 0, -verbose => 2, -noperldoc => 1) if $help;

read_config ($config_file);

$config->{wikiurl} =~ s/\/$//;
$url_prefix = "$config->{wikiurl}/$config->{handbookurl}/";
$content_directory = $config->{contentdir};
$algolia_index_name = $config->{algoliaindex};

find( { wanted => \&process_files, preprocess => \&sort_files } , $content_directory );

$json_index = to_json ($index, { latin1 => 1, pretty => 1 });


if ($urlcheck){
   my $ua = LWP::UserAgent->new;
   $ua->ssl_opts(verify_hostname => 0);

   foreach (@{$index->{requests}}) {

      my $url = "$_->{body}->{url}";
      my $req = HTTP::Request->new( 'GET', $url );

      my $res = $ua->request( $req );

      print $res->status_line . ": " . $_->{body}->{url} ."\n";
  }
  exit 0;
}


if ( $algolia_index_name && ! $dryrun ){
  print "Algolio: clearing index $algolia_index_name ...\n";
  algolia_clear;
  print "Algolio: pushing data to index $algolia_index_name ...\n";
  algolia_push;
} else {
  print $json_index;
}

exit 0;

__END__

=head1 NAME

algolia-index.pl - Create an algolia index out of a hugo content directory

=head1 SYNOPSIS

algolia-index.pl [options]

 Options:
   --config FILE    hugo config file
   --dryrun         perform a dry run
   --checkurl       check if all urls in index are valid
   --help|?         print this help message

=head1 OPTIONS

=over 8

=item B<--config FILE>

Per default 'config.toml' is expected in the root directory of the
hugo project. You can provide a different filename FILE with this option.

=item B<--dryrun>

This script uses the algolia REST API to first clear and then create a new
index live. If you perform a dry run this script will not talk to the algolia
REST API but prints the index to the standard output.

=item B<--checkurl>

Checks if all urls in index are valid. Does not touch the algolia index. For
debuging issues only.

=back

=head1 DESCRIPTION

B<algolia-index.pl> has to be started in a hugo project root. It will search for
a config.toml file. Then it will create a search index out of the *.md files
which where foud in the 'contetdir' defined in the config.toml.

After that the programm will clear the related algolia index via the algolia
REST API and push the created index to an algolia index. The name of the algolia
index is defined by a variable called 'algoliaindex' in the config.toml.

=cut
