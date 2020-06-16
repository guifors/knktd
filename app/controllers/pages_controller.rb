require 'nokogiri'
require 'open-uri'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :create, :confirm, :confirm_two]

  def home
  end

  def confirm
  end

  def get_additional_info_from_dealroom(startups)
    startups.each do |startup|
      @agent = Mechanize.new
      @url = "https://app.dealroom.co/companies/#{startup}"

      @html_file = open(@url).read
      @html_doc = Nokogiri::HTML(@html_file)


      @tags = @agent.get(@url).search('.tag-item__name')
      @tags_stripped = []
      @tags.each do |tag|
        @tags_stripped << tag.text.strip
      end
      raise
      return @tags_stripped
    end
  end

  def store_all_startups_by_keyword
    @keywords = startup_keywords
    @keywords.each do |keyword|
      store_startup_tracker_startups_by_keywords([keyword])
      sleep 10
    end
    @test = "done"
  end

  def store_startup_tracker_startups_by_industry(industry)
    @all_startups = scrape_startup_tracker_names_all_pages_by_industry(industry)
    @all_startups.each do |startup|
      @startup = Startup.new(name: startup[0], description: startup[1], industry: industry)
      @startup.save!
    end
  end

  def store_startup_tracker_startups_by_keywords(keyword)
    @all_startups = scrape_startup_tracker_names_all_pages_by_keywords(keyword)
    @all_startups.each do |startup|
      @startup = Startup.new(name: startup[0], description: startup[1], keyword: keyword[0])
      @startup.save!
    end
  end

  def startup_keywords
    ["demand%20prediction", "last%20mile", "yield%20management"]
  end

  def scrape_startup_tracker_names_all_pages_by_keywords(keywords)
    @all_names = []
    counter = 0
    keywords.each do |keyword|
      @number = scrape_startup_tracker_number_of_pages_by_keyword(keyword)
      @number.to_i.times do
        @all_names << scrape_startup_tracker_names_single_page_by_keyword(counter, keyword)
        counter += 1
      end
    end
    return @all_names.flat_map { |e| e }
  end

  def scrape_startup_tracker_names_all_pages_by_industry(industry)
    @number = scrape_startup_tracker_number_of_pages_by_industry(industry)
    @all_names = []
    counter = 0
    @number.to_i.times do
      @all_names << scrape_startup_tracker_names_single_page_by_industry(counter, industry)
      counter += 1
    end
    return @all_names.flat_map { |e| e }
  end

  def scrape_startup_tracker_names_single_page_by_industry(number, industry)
    @agent = Mechanize.new
    @url = "https://startuptracker.io/discover?filters%5B0%5D%5Bbm%5D%5Bo%5D=inc&filters%5B0%5D%5Bbm%5D%5Bq%5D=#{industry}&page=#{number}"
    @name_elements = @agent.get(@url).search(".//p[@class='_cty35ls']")
    @description_elements = @agent.get(@url).search(".//p[@class='_1ygjwwud']")
    @names = []
    @desc_index = 0
    @name_elements.each do |element|
      @names << [element.text.strip, @description_elements[@desc_index].nil? ? "" : @description_elements[@desc_index].text.strip]
      @desc_index += 1
    end
    return @names
  end

  def scrape_startup_tracker_names_single_page_by_keyword(number, keyword)
    @names = []
    @agent = Mechanize.new
    @url = "https://startuptracker.io/discover?filters%5B0%5D%5Bmk%5D%5Bq%5D=#{keyword}&page=#{number}"
    @name_elements = @agent.get(@url).search(".//p[@class='_cty35ls']")
    @description_elements = @agent.get(@url).search(".//p[@class='_1ygjwwud']")
    @desc_index = 0
    @name_elements.each do |element|
      @names << [element.text.strip, @description_elements[@desc_index].nil? ? "" : @description_elements[@desc_index].text.strip]
      @desc_index += 1
    end
    return @names
  end

  def scrape_startup_tracker_number_of_pages_by_keyword(keyword)
    @agent = Mechanize.new
    @url = "https://startuptracker.io/discover?filters%5B0%5D%5Bmk%5D%5Bq%5D=#{keyword}&page=0"
    @elements = @agent.get(@url).search(".//span[@class='_mnrv8n']")
    @pages = []
    @elements.each do |element|
      @pages << element.text.strip.to_i
    end
    return @pages.blank? ? 0 : @pages.last - 1
  end

  def scrape_startup_tracker_number_of_pages_by_industry(industry)
    @agent = Mechanize.new
    @url = "https://startuptracker.io/discover?filters%5B0%5D%5Bbm%5D%5Bo%5D=inc&filters%5B0%5D%5Bbm%5D%5Bq%5D=#{industry}&page=0"
    @elements = @agent.get(@url).search(".//span[@class='_mnrv8n']")
    @pages = []
    @elements.each do |element|
      @pages << element.text.strip.to_i
    end
    return @pages.blank? ? 0 : @pages.last - 1
  end
end
