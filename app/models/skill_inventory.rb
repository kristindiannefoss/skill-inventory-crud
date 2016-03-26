require 'yaml/store'
require_relative 'skill'


class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(skill)
    database.from(:skills).insert(skill)
  end

  def update(id, skill)
    database.from(:skills).where(:id => id).update(skill)
  end

  def destroy(id)
    database.from(:skills).where(:id => id).delete
  end

  def all
    database.from(:skills).to_a    
  end

  def find(id)
    raw_skill = database.from(:skills).where(:id => id).to_a.first
    Skill.new(raw_skill)
  end

  def delete_all
    database.from(:skills).delete
  end
end
