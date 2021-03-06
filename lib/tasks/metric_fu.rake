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
		puts "invoking metric_fu Results will be stored in Build Artifacts/output tab"
		Rake::Task["metrics:all"].execute
		puts "Metrics done"
		# 'echo metric_fu --out /home/karan/.cruise/projects/sample_app/CC_BUILD_ARTIFACTS'
		puts "invoking tests"
		# Rake::Task["db:migrate RAILS_ENV=test"].execute
		
		 Rake::Task["db:test:load"].execute
		 # puts "db:test:load done"
		 Rake::Task["db:migrate"].execute
		 sh 'rspec'
		 sh 'cucumber'
		 # puts "db:migrate done"
		 # Rake::Task["default"].execute
		 # puts "default done"
		 # puts "testing done"
		 # Rake::Task["cucumber"].execute
	end
end
task :email_list do
	return ['karan.purohit@clariontechnologies.co.in', 'karanvpurohit@gmail.com']
end
# task :metrics_and_tests => [:'metrics:all --out $HOME/.cruise/projects/sample_app/CC_BUILD_ARTIFACTS/', test]