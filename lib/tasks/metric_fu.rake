begin
  require 'metric_fu'
  
  MetricFu::Configuration.run do |config|
    config.metrics = [:flog]
    config.flog = { :dirs_to_flog => ['app'] }
  end
  
rescue LoadError
end

 task :metric => :environment do
 	run "metric_fu"
 end