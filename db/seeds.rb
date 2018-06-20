require_relative('../models/animal')
require_relative('../models/owner')

owner1 = Owner.new({
  'name' => 'Jemma'
  })
owner2 = Owner.new({
  'name' => 'Tori'
  })

owner3 = Owner.new({
  'name' => 'Nicole'
  })

  owner4 = Owner.new({
    'name' => 'No Owner'
    })

owner1.save
owner2.save
owner3.save
owner4.save

animal1 = Animal.new({
  'image_url' => '../images/lottie_laptop.png',
  'name' => 'Lottie',
  'species'=> 'dog',
  'age' => 5,
  'adoptable' => 'yes',
  'owner_id' => owner1.id
  #'adoptable' => 'no'
  })

  animal2 = Animal.new({
    'image_url' => '../images/bambam.png',
    'name' => 'Bambam',
    'species'=> 'cat',
    'age' => 3,
    'adoptable' => 'yes',
    'owner_id' => owner2.id
    #'adoptable' => 'no'
    })

    animal3 = Animal.new({
      'image_url' => '../images/islay3.png',
      'name' => 'Islay',
      'species'=> 'dog',
      'age' => 3,
      'adoptable' => 'yes',
      'owner_id' => owner3.id
      #'adoptable' => 'no'
      })

      animal4 = Animal.new({
        'image_url' => '../images/bella.png',
        'name' => 'Bella',
        'species'=> 'dog',
        'age' => 8,
        'adoptable' => 'yes',
        'owner_id' => owner4.id
        #'adoptable' => 'no'
        })

        animal5 = Animal.new({
          'image_url' => '../images/molly.png',
          'name' => 'Molly',
          'species'=> 'dog',
          'age' => 1,
          'adoptable' => 'yes',
          'owner_id' => owner4.id
          #'adoptable' => 'no'
          })

          animal6 = Animal.new({
            'image_url' => '../images/askit.png',
            'name' => 'Askit',
            'species'=> 'cat',
            'age' => 3,
            'adoptable' => 'yes',
            'owner_id' => owner4.id
            #'adoptable' => 'no'
            })


  animal1.save#
  animal2.save
  animal3.save
  animal4.save
  animal5.save
  animal6.save
