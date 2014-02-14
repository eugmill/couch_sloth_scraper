require 'pry'
require_relative "../config/environment"

# DB = SQLite3::Database.new "students.db"
# Movie.create_table

# # 1. Open up http://students.flatironschool.com/ and find each student URL
# # 2. Pass that student url to an instance of StudentScraper
# # 3. Tell that instance to scrape itself and return student info (name, tagline, etc.)
index_doc = Nokogiri::HTML(open("http://students.flatironschool.com/"))
student_urls = index_doc.search("div.big-comment h3 a").collect{|e| e.attribute("href").value}
student_urls.each do |url|
  student_scrape = StudentScraper.new("http://students.flatironschool.com/#{url}")
  student_instance = student_scrape.scrape
  puts "Just scraped #{student_instance.name}..."
  
  


  
end
