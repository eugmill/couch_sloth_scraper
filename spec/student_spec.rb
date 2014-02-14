require_relative 'spec_helper'

describe "Student" do
  before(:each) do
    DB.execute("CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)")
  end
  after(:each) do
    DB.execute("DROP TABLE students")
  end

  it 'has a name' do
    m = Student.new
    m.name = "Bob Saget"

    expect(m.name).to eq("Bob Saget")
  end

  it 'converts attributes to a hash' do
    m = Student.new
    m.name = "Bob Saget"

    expect(m.to_h).to eq({:name => "Bob Saget"})
  end
  
  it 'should save itself or persist to a database' do
    m = Student.new
    m.name = "Bob Saget"

    m.save

    # Go into the database and see if there is a row with 
    # the movie's data

    results = DB.execute("SELECT name FROM students WHERE name = 'Bob Saget'")
    
    expect(results[0][0]).to eq("Bob Saget")    
  end
end