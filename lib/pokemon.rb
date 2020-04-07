require 'pry'
class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type 
        @db = db
    end

    def self.save(name, type, database_connection)
        database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.new_from_db(row)
        pokemon = Pokemon.new(row[1], row[2], row[0])
      end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        name = pokemon[0][1]
        type = pokemon[0][2]
        i_d = pokemon[0][0]

        new_pokemon = Pokemon.new(name: name, db: db, type: type, id: i_d)
        new_pokemon
    end


end
