module IntegrationTestHelper
  def login_administrator
    visit "/login"
    fill_in "login", :with => "test@example.com"
    fill_in "password", :with => "test"
    click_button "Log in"
    assert_contain "You have logged in."
  end

  def el_by_css(selector)
    webrat_session.dom.at(selector)
  end
end
