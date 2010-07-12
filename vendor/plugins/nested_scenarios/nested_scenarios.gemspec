Gem::Specification.new do |s|
  s.name     = "nested_scenarios"
  s.version  = "0.1.1"
  s.date     = "2008-11-29"
  s.summary  = "FixtureScenarios, FixtureScenariosBuilder, Yaml and Ruby in one big mix for Rails"
  s.email    = "jose.valim@gmail.com"
  s.homepage = "http://github.com/josevalim/nested_scenarios"
  s.description = "FixtureScenarios, FixtureScenariosBuilder, Yaml and Ruby in one big mix for Rails"
  s.has_rdoc = true
  s.authors  = [ "José Valim", "Tom Preston-Werner", "Chris Wanstrath" ]
  s.files    = [
    "MIT-LICENSE",
    "README",
    "Rakefile",
    "lib/nested_scenarios.rb",
    "lib/nested_scenarios/builder.rb",
    "lib/nested_scenarios/fixtures.rb",
    "lib/nested_scenarios/join.rb",
    "lib/nested_scenarios/nested_scenarios.rb",
    "tasks/builder_tasks.rake"
  ]
  s.test_files = []
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
end
