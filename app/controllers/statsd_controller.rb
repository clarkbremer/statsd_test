

class StatsdController < ApplicationController
  def index
    @metric ||= 'test.ruby.myval'
  end

  def event
  	@metric = params[:q]
  	puts "got statsd increment for #{@metric}"
    1.times do
      #$statsd.increment @metric
    end  
  	flash[:notice] = "statsd event sent: (#{@metric})"
    respond_to do |format|
      format.html { render :index } 
    end
  end
end
