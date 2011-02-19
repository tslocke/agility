require 'test_helper'
require 'integration/integration_test_helper'

class Bug414Test < ActionController::IntegrationTest
  include IntegrationTestHelper
  self.fixture_path += "basic/"
  fixtures :all

  test "can have a table-plus and field-list with arrays of hashes" do
    login_administrator
    visit "/foos/bug_414_test"
    
    assert_selector_contains ".table-plus td:first", "unlucky"
    assert_selector_contains ".table-plus tr:nth-child(2) td:nth-child(2)", "42"
    assert_selector_contains ".table-plus .field-heading-row", "Left Right"
    assert_selector_contains ".field-list tr:nth-child(2)", "right 42"
  end

end
