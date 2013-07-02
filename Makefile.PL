
use strict;
use warnings;

use 5.014001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Serve RDF data from files",
  "AUTHOR" => "Jakob Vo\303\237 <voss\@gbv.de>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Plack-App-RDF-Files",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::App::RDF::Files",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Digest::MD5" => 0,
    "Encode" => 0,
    "File::Spec::Functions" => 0,
    "HTTP::Date" => 0,
    "List::Util" => 0,
    "Plack::Component" => 0,
    "Plack::Request" => 0,
    "Plack::Util::Accessor" => 0,
    "RDF::Trine" => 0,
    "RDF::Trine::Iterator::Graph" => 0,
    "RDF::Trine::Model" => 0,
    "RDF::Trine::Parser" => 0,
    "RDF::Trine::Serializer" => 0,
    "Scalar::Util" => 0,
    "URI" => 0,
    "parent" => 0
  },
  "TEST_REQUIRES" => {
    "HTTP::Message::PSGI" => 0,
    "HTTP::Request" => 0,
    "HTTP::Request::Common" => 0,
    "Plack::Builder" => 0,
    "Plack::Test" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.02",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



