class StudentScraper
  def initialize(url)
      @doc = Nokogiri::HTML(open(url))
    rescue
      OpenURI::HTTPError # Erik Peterson and Corbin Page profile 404
  end

  def scrape
    scrape_name
    scrape_information
    create_instance
  end

  def scrape_name
      @name = @doc.search("div.page-title h4.ib_main_header").text
    rescue
      NoMethodError # no method for 404s
  end

  def scrape_information
    @information = {


    }
  end

  def create_instance
    @student = Student.new
    @student.name = @name
    # @student.save
    @student
  end
end