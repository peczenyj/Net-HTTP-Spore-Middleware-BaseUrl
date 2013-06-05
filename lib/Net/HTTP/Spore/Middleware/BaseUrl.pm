package Net::HTTP::Spore::Middleware::BaseUrl;

#ABSTRACT: Spore Middleware to change the base_url

use Moose;
extends 'Net::HTTP::Spore::Middleware';

has base_url => ( is => 'ro', isa => 'Str', required => 1);

sub call {
  my ($self, $req) = @_;
  
  $req->host( $self->base_url );
}

1;

__END__

=head1 NAME

Net::HTTP::Spore::Middleware::BaseUrl - Spore Middleware to change the base_url

=head1 SYNOPSIS
 
    my $client = Net::HTTP::Spore->new_from_spec('api.json');
    $client->enable( 'BaseUrl'
        base_url  => 'http://www.perl.org',
    );