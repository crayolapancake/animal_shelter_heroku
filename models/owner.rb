require_relative('../db/sql_runner')

class Owner

  attr_accessor :name
  attr_reader :id

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @name = options['name']
  end

  def save()
    sql = "INSERT INTO owners
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    owner = Owner.new(result)
    return owner
  end

  def self.all()
      sql = "SELECT * FROM owners"
      owner_data = SqlRunner.run(sql)
      owners = map_items(owner_data)
      return owners
  end

  def self.map_items(owner_data)
    return owner_data.map { |owner| Owner.new(owner) }
  end

  def delete()
     sql = "DELETE FROM owners
     WHERE id = $1"
     values = [@id]
     SqlRunner.run(sql, values)
   end

   def update()
    sql = "UPDATE owners
      SET
      (name) =
      ($1)
      WHERE id = $2"      
      values = [@name]
      SqlRunner.run(sql, values)
    end


end
