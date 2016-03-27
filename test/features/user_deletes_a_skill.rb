require_relative '../test_helper'

class UserDeletesSkill < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_delete_a_skill
    visit '/'

      click_link("New Skill")

      assert_equal "/skills/new", current_path
      fill_in('skill[title]', with: "pushups")
      fill_in('skill[description]', with: "get jacked")
      click_button("Submit")

    visit '/skills'

    within('body') do
      assert page.has_content?("pushups")
    end
    # save_and_open_page
      click_button("delete")

    within('body') do
      refute page.has_content?("pushups")
    end
  end
end
