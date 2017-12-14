require_relative('../models/student')
require_relative('../models/house')
require('pry-byebug')

house1 = House.new({
  'name' => 'Gryffindor',
  'logo_url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/e/ee/Gryffindor_Crest-0.jpg/revision/latest?cb=20160729145529'
  })
  house1.save()

  house2 = House.new({
    'name' => 'Slytherin',
    'logo_url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/7/72/Ccd53034-c798-452a-8032-f28e06250d8f.jpg/revision/latest?cb=20160729150848'
    })
    house2.save()

    house3 = House.new({
      'name' => 'Hufflepuff',
      'logo_url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/6/62/Download_%289%29.jpg/revision/latest?cb=20160729145653'
      })
      house3.save()

      house4 = House.new({
        'name' => 'Ravenclaw',
        'logo_url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/2/28/Download_%284%29.jpg/revision/latest?cb=20160729145945'
        })
        house4.save()

Student.delete_all()

student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house_id'=> house1.id,
  'age' => '12'
})
student1.save()

student2 = Student.new({
  'first_name' => 'Paul',
  'last_name' => 'Daniels',
  'house_id'=> house2.id,
  'age' => '50'
})
student2.save()

student3 = Student.new({
  'first_name' => 'Ron',
  'last_name' => 'Weasley',
  'house_id'=> house3.id,
  'age' => '12'
})
student3.save()

student4 = Student.new({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'house_id'=> house2.id,
  'age' => '12'
})
student4.save()



#Student.find_all()
# House.find(house1.id)

#student1.house

# Student.find(student2.id)

binding.pry
nil
