class Student
  attr_accessor :name

  # def self.create_table
  #   DB.execute("CREATE TABLE IF NOT EXISTS movies (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)")
  # end
  
  # def save
  #   DB.execute("INSERT INTO movies (name) VALUES (:name)", to_h)
  #   # DB.execute("INSERT INTO movies (name) VALUES (?) WHERE name = ?", name)
  # end

  # def to_h
  #   {:name => name}
  # end
end