require 'pry'
class StudentScraper
  def initialize(url)
      @doc = Nokogiri::HTML(open(url))
    rescue
      OpenURI::HTTPError # Erik Peterson and Corbin Page profile 404
  end

  def scrape
      scrape_one_line_information
      binding.pry
      create_instance
    rescue
      NoMethodError # no method for 404s
      binding.pry
  end

    def scrape_one_line_information
    scrape_name
    scrape_quote
    scrape_image_url
    scrape_biography
    # scrape_education
    # scrape_work
  end

  def scrape_name
      @name = @doc.search("div.page-title h4.ib_main_header").text
  end

  def scrape_quote
      @quote = @doc.search("div.textwidget h3").text
  end

  def scrape_image_url
      @image_url = @doc.search("div.top-page-title div img").attribute("src").value
  end

  # def scrape_biography
  #     @biography = @doc.search("div#scroll-about div#ok-text-column-2[style=height: 204px;].column div.services p").text
  # end

  def create_instance
    @student = Student.new
    @student.name = @name
    # @student.save
    @student
  end
end