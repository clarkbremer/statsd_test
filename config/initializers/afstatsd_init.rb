if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      # restart aggregation
      if defined?($statsd)
        $statsd.restart_aggregation
      end  
    end
  end
end