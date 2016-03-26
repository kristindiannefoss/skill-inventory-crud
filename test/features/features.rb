require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_skill
    skill_inventory.create({
      :title       => "a title",
      :description => "a description"
    })

    skill = skill_inventory.find(1)
    assert_equal "a title", skill.title
    assert_equal "a description", skill.description
    assert_equal 1, skill.id
  end
end
