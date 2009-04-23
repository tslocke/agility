require 'test_helper'
require 'integration/integration_test_helper'

class TableControlsPermissionTest < ActionController::IntegrationTest
  include IntegrationTestHelper
  scenario "basic"

  test "story: proper controls display respecting permissions in project table" do
    login_administrator
    click_link "First Project"
    assert_have_selector ".delete-story-button"
    assert_have_selector ".story-link.edit-link"
    assert_have_selector ".new-story-link"
    
    Story.class_eval do
      alias_method :old_destroy_permitted?, :destroy_permitted?
      def destroy_permitted?
        false
      end
      alias_method :old_update_permitted?, :update_permitted?
      def update_permitted?
        false
      end
      alias_method :old_create_permitted?, :create_permitted?
      def create_permitted?
        false
      end
    end
    webrat_session.reload
    assert_have_no_selector ".delete-story-button"
    assert_have_no_selector ".new-story-link"
    assert_have_no_selector ".story-link.edit-link"
    
    Story.class_eval do
      alias_method :old_view_permitted?, :view_permitted?
      def view_permitted?(attr=nil)
        false
      end
    end
    webrat_session.reload
    assert_have_no_selector ".story-link"
    
    Story.class_eval do
      alias_method :destroy_permitted?, :old_destroy_permitted?
      alias_method :update_permitted?, :old_update_permitted?
      alias_method :view_permitted?, :old_view_permitted?
      alias_method :create_permitted?, :old_create_permitted?
    end
    webrat_session.reload
    assert_have_selector ".delete-story-button"
  end
end
