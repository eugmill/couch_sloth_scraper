class MovieScraper
  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end

  def scrape
    scrape_name
    create_instance
  end

  def scrape_name
    @name = @doc.search("h1.header span.itemprop[itemprop=name]").text
  end

  def create_instance
    @movie = Movie.new
    @movie.name = @name
    @movie.save
    @movie
  end
end