# Demo Rails application using AppFirst Statsd Gem #

## Here are the key points: ##

in `Gemfile` (assuming your development environment might be non-posix):

    group :production do
      gem ‘posix_mq’, ‘~>2.0.0’
    end
    gem ‘afstatsd’

in `config/application.rb:`

    #Statsd.logger ||= Logger.new 'afstatsd.log'   # uncomment to enable logging
    #Statsd.logger.level = Logger::DEBUG           # 
    
    $mystatsd = Statsd.new
    $mystatsd.aggregating = false

Then with bundler:

    bundle install --without production

Anywhere in your code:

	$mystatsd.increment 'foo'                            # increment event counter 'foo'.
	$mystatsd.decrement 'manchu'                         # decrement event counter 'manchu'.
	$mystatsd.count 'mustache', 10                       # report that event 'mustache' occurred 10 times.
	$mystatsd.gauge 'buffers_left', buffer_pool.count    # report a value as a guage
    $mystatsd.time 'cart_process_time' {cart_processing} # will report the execution time of	a block