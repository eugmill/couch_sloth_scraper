require_relative "../config/environment"

# DB = SQLite3::Database.new "students.db"
# Movie.create_table

# # 1. Open up http://www.imdb.com/movies-coming-soon/ and find each movie URL
# # 2. Pass that movie url to an instane of MovieScrapper
# # 3. Tell that instance to scrape itself and return a movie
# index_doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
# movie_urls = index_doc.search("h4[itemprop=name] a").collect{|e| e.attribute("href").value}

# movie_urls.each do |url|
#   movie_scrape = MovieScraper.new("http://www.imdb.com#{url}")
#   movie_instance = movie_scrape.scrape
#   puts "Just scrapped #{movie_instance.name}..."
# end
