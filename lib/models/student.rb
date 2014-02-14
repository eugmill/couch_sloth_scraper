class Student
  attr_accessor :name, :quote, :biography, :image_url
  

  def initialize(student_hash) 
    self.name = student_hash[:name]
    self.quote = student_hash[:quote]
    self.biography = student_hash[:biography]
    self.image_url = student_hash[:image_url]
  end

  def self.create_table
    sql_statement = <<-SQL
      CREATE TABLE IF NOT EXISTS students 
      (id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT, quote TEXT, biography TEXT, image_url TEXT)
    SQL
    DB.execute(sql_statement)
  end
  
  def save
    sql_statement = <<-SQL
      INSERT INTO students (name, quote, biography, image_url) 
      VALUES ((:name), (:quote), (:biography), (:image_url))
    SQL
    DB.execute(sql_statement, to_h)
  end

  def to_h
    {
      :name => name,
      :quote => quote, 
      :biography => biography,
      :image_url => image_url
    }
  end
end