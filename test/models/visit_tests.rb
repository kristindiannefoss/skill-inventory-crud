require_relative '../test_helper'
# require 'minitest'
# require 'minitest/pride'
# require 'tilt/erb'

class UserSees < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_welcomed_on_homepage
    visit '/'

    within("h1") do
      assert page.has_content?("Welcome to the Skill Inventory")

    end
  end

  def test_user_sees_all_skills
    visit '/skills'

  end

  click_link(identifier)
  click_button(identifier text on button)
  assert_equal 'path', current_path  for redirect testing

end
