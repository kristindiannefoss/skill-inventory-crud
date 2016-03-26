require 'sequel'
require 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
  database = Sequel.sqlite("db/skill_inventory_#{env}.sqlite")
  database.create_table :skills do
    primary_key :id
    String      :title
    String      :description
  end
end
