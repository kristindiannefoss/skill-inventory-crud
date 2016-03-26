ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara/dsl'

Capybara.app = SkillInventoryApp

module TestHelpers
  def teardown
    skill_inventory.delete_all
    super
  end

  def skill_inventory
    database = Sequel.sqlite('db/skill_inventory_test.sqlite')
    @skill_inventory ||= SkillInventory.new(database)
  end
end
