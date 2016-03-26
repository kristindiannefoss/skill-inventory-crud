require_relative '../test_helper'

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
end
