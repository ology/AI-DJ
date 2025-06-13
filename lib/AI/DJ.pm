package AI::DJ;

# ABSTRACT: An AI Radio DJ

our $VERSION = '0.0100';

use Moo;
use strictures 2;
use Carp qw(croak);
use OpenAPI::Client::OpenAI ();
use Types::Standard qw(Bool);
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
}

1;
__END__

=head1 SEE ALSO

L<Moo>

L<OpenAPI::Client::OpenAI>

L<Types::Standard>

L<http://openai.com>

=cut
