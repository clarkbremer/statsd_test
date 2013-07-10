

class StatsdController < ApplicationController
  def index
  end

  def event
  	metric = params[:q]
  	puts "got statsd increment for #{metric}"
    $statsd.increment 'test.ruby.hardcoded'
  	flash[:notice] = "statsd hardcoded event sent"
  	redirect_to statsd_index_url

  end
end
