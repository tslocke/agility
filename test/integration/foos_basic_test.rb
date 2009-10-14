require 'test_helper'
require 'integration/integration_test_helper'

class FoosBasicTestTest < ActionController::IntegrationTest
  include IntegrationTestHelper
  scenario "basic"

  def fill_in_foo
    check "foo[bool1]"
    uncheck "foo[bool2]"
    fill_in "foo_i", :with => "17"
    fill_in "foo_f", :with => "3.14159"
    fill_in "foo_dec", :with => "19.42"
    fill_in "foo_s", :with => "hello"
    fill_in "foo[tt]", :with => "plain text"
    select "2009", :from => "foo_d_year"
    select "April", :from => "foo_d_month"
    select "8", :from => "foo_d_day"
    select "2009", :from => "foo_dt_year"
    select "May", :from => "foo_dt_month"
    select "13", :from => "foo_dt_day"
    select "09", :from => "foo_dt_hour"
    select "30", :from => "foo_dt_minute"
    fill_in "foo[hh]", :with => "<i>this</i> is <b>HTML</b>"
    fill_in "foo[tl]", :with => "_this_ is *textile*"
    fill_in "foo[md]", :with => "*this* is **markdown**"
    select "C", :from => "foo[es]"
  end

  def verify_foo
    assert_equal el_by_css(".foo-bool1").text.strip, "Yes"
    assert_equal el_by_css(".foo-bool2").text.strip, "No"
    assert el_by_css(".foo-i").text.strip == "17"
    assert el_by_css(".foo-f").text.strip == "3.14159"
    assert el_by_css(".foo-dec").text.strip == "19.42"
    assert el_by_css(".foo-s").text.strip == "hello"
    assert el_by_css(".foo-tt").text.strip == "plain text"
    assert el_by_css(".foo-d").text.strip == "April  8, 2009"
    assert el_by_css(".foo-dt").text.strip == "May 13, 2009 09:30"
    assert el_by_css(".foo-hh b").text.strip == "HTML"
    assert el_by_css(".foo-tl strong").text.strip == "textile"
    assert el_by_css(".foo-md strong").text.strip == "markdown"
    assert el_by_css(".foo-es").text.strip == "c"
  end

  test "basic actions for foo" do
    login_administrator
    click_link "Foos"
    click_link "New Foo"
    fill_in_foo
    click_button "Create Foo"
    verify_foo
    click_link "Foos"
    click_link "New Foo"
    click_button "Create Foo"
    click_link "Edit Foo"
    fill_in_foo
    click_button "Save"
    verify_foo    
  end
end
