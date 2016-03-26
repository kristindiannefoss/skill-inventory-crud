require_relative "../test_helper"

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_skill
    skill_inventory.create({
      :title       => "Skill Title",
      :description => "Skill Description"
      })
    id = skill_inventory.database.from(:skills).max(:id)

    skill = skill_inventory.find(id)

    assert_equal "Skill Title", skill.title
    assert_equal "Skill Description", skill.description
  end

  def test_it_can_find_all_skills
    skill_inventory.create({
      :title       => "Skill Title 1",
      :description => "Skill Description"
      })
    skill_inventory.create({
      :title       => "Skill Title 2",
      :description => "Skill Description"
      })
    skill_inventory.create({
      :title       => "Skill Title 3",
      :description => "Skill Description"
      })
    all_skills = skill_inventory.all

    assert_equal 3, all_skills.count
    assert_equal "Skill Title 1", all_skills.first[:title]
    assert_equal "Skill Title 3", all_skills.last[:title]
  end

  def test_it_can_find_a_specific_skill
    skill_inventory.create({
      :title       => "Skill Title 1",
      :description => "Skill Description 1"
      })
    skill_inventory.create({
      :title       => "Skill Title 2",
      :description => "Skill Description 2"
      })
    skill_inventory.create({
      :title       => "Skill Title 3",
      :description => "Skill Description 3"
      })

    id = skill_inventory.database.from(:skills).min(:id)
    skill1 = skill_inventory.find(id)
    assert_equal "Skill Title 1", skill1.title
    assert_equal "Skill Description 1", skill1.description

    id = skill_inventory.database.from(:skills).max(:id)
    skill3 = skill_inventory.find(id)

    assert_equal "Skill Title 3", skill3.title
    assert_equal "Skill Description 3", skill3.description
  end

  def test_it_can_update_an_existing_skill
    skill_inventory.create({
      :title       => "Skill Title 1",
      :description => "Skill Description 1"
      })

    id = skill_inventory.database.from(:skills).min(:id)
    skill1 = skill_inventory.find(id)

    assert_equal "Skill Title 1", skill1.title
    assert_equal "Skill Description 1", skill1.description

    updated_skill_info = {title: "New Skill Title",
                        description: "New Skill Description"}

    skill_inventory.update(id, updated_skill_info)

    skill1 = skill_inventory.find(id)

    assert_equal "New Skill Title", skill1.title
    assert_equal "New Skill Description", skill1.description
  end

  def test_it_can_destroy_a_skill
    skill_inventory.create({
      :title       => "Skill Title 1",
      :description => "Skill Description 1"
      })

    all_skills = skill_inventory.all
    id = skill_inventory.database.from(:skills).min(:id)

    assert_equal 1, all_skills.size
    assert all_skills.any? { |skill| skill[:title] == "Skill Title 1" }

    skill_inventory.destroy(id)
    all_skills = skill_inventory.all

    assert_equal 0, all_skills.size
    refute all_skills.any? { |skill| skill.title == "Skill Title 1" }
  end
end
