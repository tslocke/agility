require 'test_helper'

class FilterMenuTest < ActionController::IntegrationTest
  scenario "basic"

  def login
    visit "/login"
    fill_in "login", :with => "test@example.com"
    fill_in "password", :with => "test"
    click_button "Log in"
    assert_contain "You have logged in."
  end

  def wait_assert(&block)
    wait_for do
      begin
        yield
      rescue
        true
      else
        false
      end
    end
  end

  # Replace this with your real tests.
  test "project: filter status" do
    login
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
