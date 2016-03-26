# require 'models/skill_inventory'

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true
  set :server, 'webrick'

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = skill_inventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    skill_inventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    skill_inventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    skill_inventory.delete(id.to_i)
    redirect '/skills'
  end

  def skill_inventory
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite('db/skill_inventory_test.sqlite')
    else
      database = Sequel.sqlite('db/skill_inventory_development.sqlite')
    end
    @skill_inventory ||= SkillInventory.new(database)
  end
end
