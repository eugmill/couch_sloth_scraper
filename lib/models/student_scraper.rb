require 'pry'
class StudentScraper
  def initialize(url)
      @doc = Nokogiri::HTML(open(url))
    rescue
      OpenURI::HTTPError # Erik Peterson and Corbin Page profile 404
  end

  # def scrape
  #     scrape_all
  #     # binding.pry
  #     create_instance
  
  # end

    def scrape_all
      information = {}
      information[:name] = scrape_name
      information[:quote] = scrape_quote
      information[:image_url] = scrape_image_url
      information[:biography] = "lalala"
      information
    # scrape_biography
    # scrape_education
    # scrape_work
  end

  def scrape_name
      @name = @doc.search("div.page-title h4.ib_main_header").text
    rescue
      NoMethodError # no method for 404s
  end

  def scrape_quote
      @quote = @doc.search("div.textwidget h3").text
    rescue
      NoMethodError # no method for 404s
  end

  def scrape_image_url
      @image_url = @doc.search("div.top-page-title div img").attribute("src").value
    rescue
      NoMethodError # no method for 404s
  end

  # def scrape_biography
  #     @biography = @doc.search("div#scroll-about div#ok-text-column-2[style=height: 204px;].column div.services p").text
  # end

  def create_instance
    @student = Student.new(scrape_all)
    @student.save
    @student
  end
end