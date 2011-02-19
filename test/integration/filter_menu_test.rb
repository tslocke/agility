require 'test_helper'
require 'integration/integration_test_helper'

class FilterMenuTest < ActionController::IntegrationTest
  include IntegrationTestHelper
  self.fixture_path += "basic/"
  fixtures :all

  test "project: filter status" do
    login_administrator
    click_link "First Project"
    assert_contain "First Story"
    assert_contain "Second story"
    select "discussion"
    submit_form 'filter-status'
    #selenium.select("//select[@name='status']", "label=discussion")
    #selenium.wait_for :wait_for => :no_text, :text => "Second story"
    assert_contain "First Story"
    assert_not_contain "Second story"
    select "implementation"
    submit_form 'filter-status'
    #selenium.wait_for_page
    assert_not_contain "First Story"
    assert_not_contain "Second story"
    select "All"
    submit_form 'filter-status'
    #selenium.wait_for_page
    assert_contain "First Story"
    assert_contain "Second story"
  end

end
