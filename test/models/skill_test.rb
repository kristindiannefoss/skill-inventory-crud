require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    skill = Skill.new({ :title => "Skill Title",
                      :description => "Skill Description",
                      :id => 1 })

    assert_equal "Skill Title", skill.title
    assert_equal "Skill Description", skill.description
    assert_equal 1, skill.id
  end
end
