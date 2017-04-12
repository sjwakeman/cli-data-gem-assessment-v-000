class SaArticles::Articles
  attr_accessor :title, :author, :url
  def self.ideas
    #scrape and return a bunch of instances of long or short articles
    #puts <<-DOC.gsub /^\s+/, ""
    #1. long articles
    #2. short articles
    #DOC

    self.scrape_longs
      #SaArticles::ArticleScraper.new("https://seekingalpha.com/stock-ideas/long-ideas")
    self.scrape_shorts
      #SaArticles::ArticleScraper.new("https://seekingalpha.com/stock-ideas/short-ideas")
  end

  def self.scrape_long_trading_ideas
    longs = []
    #go to https://seekingalpha.com/stock-ideas/long-ideas
    #extract the ideas properties (title, author and url)
    longs << self.scrape_longs
  end

  def self.scrape_short_trading_ideas
    shorts = []
    #go to https://seekingalpha.com/stock-ideas/short-ideas
    #extract the ideas properties (title, author and url)
    shorts << self.scrape_shorts
  end

  def self.scrape_longs
    doc = Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/long-ideas"))
    binding.pry
    #article_1 = self.new
    #article_1.title = "1. article"
    #article_1.author ="http://seekingalpha.com/author/A"
    #article_1.url ="http://seekingalpha.com/article/1"
    #https://seekingalpha.com/stock-ideas
    #https://seekingalpha.com/stock-ideas/long-ideas
    [longs]
  end

  def self.scrape_shorts
    doc = Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/short-ideas"))
    binding.pry
    #article_2 = self.new
    #article_2.title = "2. article"
    #article_2.author ="http://seekingalpha.com/author/B"
    #article_2.url ="http://seekingalpha.com/article/2"
    #https://seekingalpha.com/stock-ideas
    #https://seekingalpha.com/stock-ideas/short-ideas
  end
end
