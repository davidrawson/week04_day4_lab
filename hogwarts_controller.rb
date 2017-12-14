require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/student.rb')
require_relative('./models/house.rb')


get ('/students') do
  @students = Student.find_all
  erb :index
end

# NEW
get ('/students/new') do
  @houses = House.find_all
  erb :new
end



post ('/students') do
  @student = Student.new(params)
  @student.save
  erb :create
end
