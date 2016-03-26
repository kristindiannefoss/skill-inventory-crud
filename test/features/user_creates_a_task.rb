require_relative '../test_helper'
# require 'minitest'
# require 'minitest/pride'
# require 'tilt/erb'

class UserCreatesSkill < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_new_skill
    visit '/'

      click_link("New Skill")

      assert_equal "/skills/new", current_path
      fill_in('skill[title]', with: "pushups")
      fill_in('skill[description]', with: "get jacked")
      click_button("Submit")

    visit '/skills'

    assert_equal "/skills/1", current_path

    within("from") do
      assert page.has_content?("situps")
    end
  end

  # click_link(identifier)
  # click_button(identifier text on button)
  # assert_equal 'path', current_path  for redirect testing

end
