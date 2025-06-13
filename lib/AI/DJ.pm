package AI::DJ;

# ABSTRACT: An AI Radio DJ

our $VERSION = '0.0100';

use Moo;
use strictures 2;
use Carp qw(croak);
use OpenAPI::Client::OpenAI ();
use Types::Standard qw(Bool Str);
use namespace::clean;

=head1 SYNOPSIS

  use AI::DJ ();

  my $dj = AI::DJ->new(verbose => 1);

=head1 DESCRIPTION

An C<AI::DJ> is an AI radio DJ.

=head1 ATTRIBUTES

=head2 client

  $client = $dj->client;

The L<OpenAPI::Client::OpenAI> object.

=cut

has client => (
    is      => 'ro',
    isa     => sub { croak "$_[0] is not a valid OpenAI client" unless ref($_[0]) =~ /^OpenAPI::Client::OpenAI/ },
    default => sub { OpenAPI::Client::OpenAI->new },
);

=head2 model

  $model = $dj->model;

Show progress.

=cut

has model => (
    is      => 'ro',
    isa     => Str,
    default => sub { 'gpt-4o-mini' },
);

=head2 verbose

  $verbose = $dj->verbose;

Show progress.

=cut

has verbose => (
    is      => 'ro',
    isa     => Bool,
    default => sub { 0 },
);

=head1 METHODS

=head2 new

  $dj = AI::DJ->new(verbose => 1);

Create a new C<AI::DJ> object.

=head2 chat

  $text = $dj->chat;

Talk like a DJ.

=cut

sub chat {
  my ($self, $prompt) = @_;
  croak 'No prompt given' unless $prompt;
  my $tx = $self->client->createCompletion(
      {
          body => {
              model       => $self->model,
              prompt      => $prompt,
              temperature => 0,    # optional, between 0 and 1, with 0 being the least random
              max_tokens  => 1000, # optional, the maximum number of tokens to generate
          }
      }
  );

  my $response_data = $tx->res->json;
}

1;
__END__

=head1 SEE ALSO

L<Moo>

L<OpenAPI::Client::OpenAI>

L<Types::Standard>

L<http://openai.com>

=cut
