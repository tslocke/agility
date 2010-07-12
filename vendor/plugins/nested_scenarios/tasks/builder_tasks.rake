namespace :db do
  namespace :scenario do
    desc 'Build scenarios in test environment' 
    task :build do
      # Load environment using test environment
      ENV['RAILS_ENV'] = RAILS_ENV = 'test'
      Rake::Task['environment'].invoke

      # Force ActionMailer to delivery method :test
      # while building scenarios
      ActionMailer::Base.delivery_method = :test

      files = []
      files += Dir.glob(NestedScenarios::Builder.fixtures_dir + '/**/scenario.rb')
      files += Dir.glob(NestedScenarios::Builder.fixtures_dir + '/**/scenarios.rb')

      files.each do |scenario_rb|
        puts "Reading #{scenario_rb.gsub(RAILS_ROOT, '')} scenario file:"
        require scenario_rb
        puts 
      end
    end
  end
end
