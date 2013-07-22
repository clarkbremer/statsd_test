

class StatsdController < ApplicationController
  def index
    @metric ||= 'test.ruby.monday'
  end

  def event
  	@metric = params[:q]
  	puts "got statsd increment for #{@metric}"
    1.times do
      $mystatsd.increment @metric
    end  
  	flash[:notice] = "statsd event sent: (#{@metric})"
    respond_to do |format|
      format.html { render :index } 
    end
  end
end
