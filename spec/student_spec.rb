require_relative 'spec_helper'

describe "Student" do
  before(:each) do
    DB.execute("CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, tagline TEXT)")
  end
  after(:each) do
    DB.execute("DROP TABLE students")
  end

  describe "-model" do 
    # Model itself
    it 'has a name' do
      m = Student.new
      m.name = "Bob Saget"

      expect(m.name).to eq("Bob Saget")
    end

    it 'has a tagline' do
      m = Student.new
      m.tagline = "Hello there"

      expect(m.tagline).to eq("Hello there")
    end
  end

  # Hash tests
  describe "#to_h" do  
    it 'converts attributes to a hash' do
      m = Student.new
      m.name = "Bob Saget"
      m.tagline = "Hello there"

      expect(m.to_h).to eq(
        {
          :name => "Bob Saget",
          :tagline => "Hello there"
        }
      )
    end
  end
  describe "-database" do
    it 'should save itself or persist to a database' do
      m = Student.new
      m.name = "Bob Saget"
      m.tagline = "Hello there"

      m.save

      # Go into the database and see if there is a row with 
      # the movie's data

      results = DB.execute("SELECT name,tagline FROM students WHERE name = 'Bob Saget'")
      
      expect(results[0][0]).to eq("Bob Saget")
      expect(results[0][1]).to eq("Hello there")    
    end
  end
end