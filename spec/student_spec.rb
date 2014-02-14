require_relative 'spec_helper'

describe "Student" do
  before(:each) do
    DB.execute("CREATE TABLE movies (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)")
  end
  after(:each) do
    DB.execute("DROP TABLE movies")
  end

  it 'has a name' do
    m = Movie.new
    m.name = "4th of July"

    expect(m.name).to eq("4th of July")
  end

  it 'converts attributes to a hash' do
    m = Movie.new
    m.name = "4th of July"

    expect(m.to_h).to eq({:name => "4th of July"})
  end
  
  it 'should save itself or persist to a database' do
    m = Movie.new
    m.name = "4th of July"

    m.save

    # Go into the database and see if there is a row with 
    # the movie's data

    results = DB.execute("SELECT name FROM movies WHERE name = '4th of July'")
    
    expect(results[0][0]).to eq("4th of July")    
  end
end