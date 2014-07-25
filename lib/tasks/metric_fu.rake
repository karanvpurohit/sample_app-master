task metric_fu: :environment do
	run "metric_fu"
end# namespace :metrics do
# 	STATS_FILE = File.join(MetricFu::BASE_DIRECTORY, 'stats')
# 	desc " A Stats Report"
# 	task :stats do
# 		`echo '<pre>' > #{STATS_FILE}`
# 		`rake stats >>  #{STATS_FILE}`
# 		`echo '</pre>' >> #{STATS_FILE}`
# 		system("open #{STATS_FILE}") 
# 	end
# end

namespace :metrics_and_tests do
	task :all do
		puts "invoking metric_fu"
		Rake::Task["metrics:all"].execute
		puts "Metrics done"
		# 'echo metric_fu --out /home/karan/.cruise/projects/sample_app/CC_BUILD_ARTIFACTS'
		puts "invoking tests"
		 Rake::Task["db:test:load"].execute
		 Rake::Task["db:migrate"].execute
		 Rake::Task["default"].execute
		 puts "testing done"
		 # Rake::Task["cucumber"].execute
	end
end

# task :metrics_and_tests => [:'metrics:all --out $HOME/.cruise/projects/sample_app/CC_BUILD_ARTIFACTS/', test]