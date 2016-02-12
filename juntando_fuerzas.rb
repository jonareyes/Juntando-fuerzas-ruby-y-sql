require 'sqlite3'
# require 'DateTime'

class Chef
  attr_accessor :first_name, :last_name, :birthday, :email, :phone, :created_at, :updated_at

  def initialize(first_name, last_name, birthday, email, phone, created_at, updated_at)
    @first_name = first_name 
    @last_name = last_name
    @birthday = birthday
    @email = email
    @phone = phone
    @created_at = created_at
    @updated_at = updated_at
  end

  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    chefs.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Ruben', 'Uribe', '1989-02-09', 'ruben@me.com', '34564353', DateTime.now, DateTime.now,
          ('Juan', 'Perez', '1992-04-07', 'juanelo_1@gmail.com', '27890202', DateTime.now, DateTime.now;
        -- Añade aquí más registros
      SQL
    )
  end

  def self.all 
    Chef.db.execute(
      <<-SQL
        SELECT * FROM chefs;
      SQL
      )  
  end

  def self.where(column, value)
    Chef.db.execute(
        "SELECT * FROM chefs
        WHERE #{column} = ?", value     
      )
  end

  def save
    Chef.db.execute(
      <<-SQL
    INSERT INTO chefs
        (first_name, last_name, birthday, email, phone, created_at, updated_at)
         VALUES 
         ("#{@first_name}", "#{@last_name}", "#{@birthday}", "#{@email}", "#{@phone}", "#{@created_at}", "#{@updated_at}")
      SQL
     )
  end

  def self.delete(column, value)
    Chef.db.execute(
      "DELETE FROM chefs
      WHERE #{column} = ?", value
      )  
  end


  private

  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end
end

chef = Chef.new('Jose', 'Sanchez', '1980-04-09', 'josesito@gmail.com', '37829098', DateTime.now , DateTime.now)
#
chef.save