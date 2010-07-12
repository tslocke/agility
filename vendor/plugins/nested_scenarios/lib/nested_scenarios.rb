if RAILS_ENV == 'test'
  require 'test/unit/testcase'
  require 'test/unit/testsuite'
  require 'active_record/fixtures'

  dir = File.dirname(__FILE__)
  require File.join(dir, 'nested_scenarios', 'nested_scenarios')
  require File.join(dir, 'nested_scenarios', 'builder')
  require File.join(dir, 'nested_scenarios', 'fixtures')
  require File.join(dir, 'nested_scenarios', 'join')
end