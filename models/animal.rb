require_relative('../db/sql_runner')

class Animal

  attr_accessor :image_url, :name, :species, :age, :adoptable, :owner_id
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @image_url = options['image_url']
      @name = options['name']
      @species = options ['species']
      @age = options ['age']
      @adoptable = options ['adoptable']
      @owner_id = options ['owner_id'].to_i
  end


  def save()
    sql = "INSERT INTO animals
    (image_url, name, species, age, adoptable, owner_id)
    VALUES
    ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@image_url, @name, @species, @age, @adoptable, @owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
   @id = id
  end

 # return an array of Animal objects (all of them)
 def self.all()
   sql = "SELECT * FROM animals"
   values = []
   animal_hash = SqlRunner.run(sql, values)

   array_of_animal_objects = animal_hash.map { |animal_hash| Animal.new(animal_hash) }
   return array_of_animal_objects
 end

 def owner()
   owner = Owner.find(@owner_id)
   return owner
 end

def delete()
   sql = "DELETE FROM animals
   WHERE id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def update()
  sql = "UPDATE animals
    SET
    (image_url, name, species, age, adoptable, owner_id) =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@image_url, @name, @species, @age, @adoptable, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.adopt(animal_id, owner_id)
    sql = "UPDATE animals
          SET owner_id = $1
          WHERE id = $2"
    values = [owner_id, animal_id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal) }
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = (id)
    result = SqlRunner.run(sql, values).first
    animal = Animal.new(result)
    return animal
  end

  def self.find_species(species)
    sql = "SELECT * FROM animals
    WHERE species = $1"
    values = [species]
    result = SqlRunner.run(sql, values)
    animal = result.map{|animal| Animal.new(animal)}
    return animal
  end



end
