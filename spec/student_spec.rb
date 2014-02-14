require_relative 'spec_helper'

describe "Student" do
  before(:each) do
    DB.execute("CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, quote TEXT, biography TEXT, image_url TEXT)")
    @test_hash = {
      :name => "Eugene",
      :quote => "I'm a cool dude ;P",
      :biography => "Hangin round, downtown by myself and I've had too much caffeine.",
      :image_url => "http://test.com/image.png"
    }
  end

  after(:each) do
    DB.execute("DROP TABLE students")
  end


  describe "-model" do 
    it 'has attributes passed in on initialization' do
      s = Student.new(@test_hash)
      expect(s.name).to eq("Eugene")
      expect(s.quote).to eq("I'm a cool dude ;P")
      expect(s.biography).to eq("Hangin round, downtown by myself and I've had too much caffeine.")
      expect(s.image_url).to eq("http://test.com/image.png")
    end
  end



  # Hash tests
  describe "#to_h" do  
    it 'converts attributes to a hash' do
      s = Student.new(@test_hash)
      expect(s.to_h).to eq(
     {
      :name => "Eugene",
      :quote => "I'm a cool dude ;P",
      :biography => "Hangin round, downtown by myself and I've had too much caffeine.",
      :image_url => "http://test.com/image.png"
    }
    )
    end
  end

  describe "-database" do
    it "Should save and retrieve it's attributes" do
      s = Student.new(@test_hash)
      s.save

      # Go into the database and see if there is a row with 
      # the movie's data

      results = DB.execute("SELECT name FROM students")
      expect(results[0][0]).to eq("Eugene")

      results = DB.execute("SELECT quote FROM students")
      expect(results[0][0]).to eq("I'm a cool dude ;P")    

      results = DB.execute("SELECT biography FROM students")
      expect(results[0][0]).to eq("Hangin round, downtown by myself and I've had too much caffeine.")    

      results = DB.execute("SELECT image_url FROM students")
      expect(results[0][0]).to eq("http://test.com/image.png")    
    end
  end
end