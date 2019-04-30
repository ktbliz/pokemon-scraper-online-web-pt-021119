#require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil) 
    @id = id 
    @name = name 
    @type = type 
    @db = db 
    @hp = hp
  end  
  
  def self.save(name, type, db) 
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db) 
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    new_pokemon = self.new(id: array[0][0], name: array[0][1], type: array[0][2], db: db)
    #binding.pry
  end
  
  def alter_hp(new_hp, db)
    self.hp = new_hp
  end 
  
end
  