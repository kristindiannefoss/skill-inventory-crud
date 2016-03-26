require_relative '../test_helper'

class UserEditsSkill < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_edit_a_skill
    visit '/'

      click_link("New Skill")

      assert_equal "/skills/new", current_path
      fill_in('skill[title]', with: "pushups")
      fill_in('skill[description]', with: "get jacked")
      click_button("Submit")

    visit '/skills'

      click_link("Edit")

      fill_in('skill[title]', with: "situps")
      fill_in('skill[description]', with: "abs mon")
      click_button("Submit")

    within('.navbar-brand') do
      assert page.has_content?("situps")
    end
  end
end
