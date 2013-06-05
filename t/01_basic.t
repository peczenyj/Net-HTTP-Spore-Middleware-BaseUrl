use Test::More tests => 1;
use Test::MockObject;

use Net::HTTP::Spore::Middleware::BaseUrl;

subtest 'basic' => sub {
  plan tests => 1;
  my $base_url   = 'http://foo.bar';
  my $middleware = Net::HTTP::Spore::Middleware::BaseUrl->new(base_url => $base_url);
  
  my $request = Test::MockObject->new();
  
  $request->mock(host => sub { 
    my ($self, $host) = @_;
    is($host, $base_url, "should call request->host with base_url");
  });
  
  $middleware->call($request);
};