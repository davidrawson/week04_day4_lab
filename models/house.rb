require('pry-byebug')
require_relative('../db/sqlrunner')

class House

  attr_reader :name,  :logo_url, :id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo_url = options['logo_url']
  end

  def save
    sql = "INSERT INTO houses
    (name, logo_url)
    VALUES
    ($1, $2) RETURNING *"
    values = [@name, @logo_url]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    result = Student.new(house.first)
    return result
  end


  def self.find_all()
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run(sql, values)
    result = houses.map{|house| House.new(house)}
    return result
  end



end
