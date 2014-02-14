class Student
  attr_accessor :name, :tagline, :biography, :education_list, :work_list 
  

  def initialize

  end

  def self.create_table
    sql_statement = <<-SQL
      CREATE TABLE IF NOT EXISTS students 
      (id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT, tagline TEXT)
    SQL
    DB.execute(sql_statement)
    DB.execute("SELECT tagline FROM students")
  end
  
  def save
    DB.execute("SELECT tagline FROM students")
    DB.execute("INSERT INTO students (name, tagline) VALUES ((:name),(:tagline))", to_h)
    # DB.execute("INSERT INTO movies (name) VALUES (?) WHERE name = ?", name)
  end

  def to_h
    {
      :name => name,
      :tagline => tagline
    }
  end
end