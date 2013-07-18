# Demo Rails application using AppFirst Statsd Gem #

in `Gemfile` (assuming your development environment might be non-posix):

    group :production do
      gem ‘posix_mq’, ‘~>2.0.0’
    end
    gem ‘afstatsd’

in `config/application.rb:`

    $statsd = Statsd.new
    $statsd.aggregating = false

Then with bundler:

    bundle install --without production
