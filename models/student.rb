require('pry-byebug')
require_relative('../db/sqlrunner')


class Student

  attr_reader :first_name, :last_name, :house_id, :age ,:id

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id']
    @age = options['age']
  end

  def save
    sql = "INSERT INTO students
    (first_name, last_name, house_id, age)
    VALUES
    ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first['id'].to_i
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    result = SqlRunner.run(sql, values)[0]
    return House.new(result)
  end


  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student.first)
    return result
  end


  def self.find_all()
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run(sql, values)
    result = students.map{|student| Student.new(student)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    values = []
    SqlRunner.run(sql, values)
  end

end
