

class StatsdController < ApplicationController
  def index
  end

  def event
  	metric = params[:q]
  	puts "got statsd increment for #{metric}"
    $statsd.increment metric
  	flash[:notice] = "statsd event sent"
  	redirect_to statsd_index_url

  end
end
