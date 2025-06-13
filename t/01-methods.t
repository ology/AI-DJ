#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::Exception;

use_ok 'AI::DJ';

subtest dies => sub {
  $ENV{OPENAI_API_KEY} = '';
  dies_ok { AI::DJ->new } 'no APIKEY environment variable';
};

# subtest defaults => sub {
#  $ENV{OPENAI_API_KEY} = 'sk-proj-...';
#  my $dj = new_ok 'AI::DJ' => [verbose => 1];
#  is $dj->verbose, 1, 'verbose';
#  isa_ok $dj->client, 'OpenAPI::Client::OpenAI';
#};

done_testing();
