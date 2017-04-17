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
    #binding.pry

    long_article = self.new

    titles = doc.search(“a.a-title”).text.strip #returns All Titles
    first_long_title = doc.search("a.a-title")[0].text.strip #returns First Title

    second_long_title = doc.search("a.a-title")[1].text.strip #returns Second Title

    third_long_title = doc.search("a.a-title")[2].text.strip #returns Third Title

    ten_long_titles = doc.search("a.a-title")[0..10].text.strip

    #first_url = url = doc.search('a.a-title').first.attr("href")
    first_long_url = doc.search('a.a-title')[0].attr("href")
    #=> "/article/4062487-gopro-trade-offer-solidifies-2017-will-turnaround-year"

    second_long_url = doc.search('a.a-title')[1].attr("href")
    #=> "/article/4062485-harmony-gold-stable-earning-undervalued-gold-producer"

    third_long_url = doc.search('a.a-title')[2].attr("href")
    #=> "/article/4062469-barrick-gold-good-long-term-investment"


    #long_article.author ="http://seekingalpha.com/author/A"
    #https://seekingalpha.com/stock-ideas/long-ideas
    [longs]
  end

  def self.scrape_shorts
    doc = Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/short-ideas"))
    #binding.pry

    short_article = self.new

    short_titles = doc.search(“a.a-title”).text.strip #returns All Titles
    first_short_title = doc.search("a.a-title")[0].text.strip #returns First Title
    second__short_title = doc.search("a.a-title")[1].text.strip #returns Second Title
    third__short_title = doc.search("a.a-title")[2].text.strip #returns Third Title
    short_titles = doc.search("a.a-title")[0..10].text.strip #returns 10 Titles

    #first_short_url = url = doc.search('a.a-title').first.attr("href")
    first_short_url = doc.search('a.a-title')[0].attr("href")
    second_short_url = doc.search('a.a-title')[1].attr("href")
    third_short_url = doc.search('a.a-title')[2].attr("href")


    #short_article.author ="http://seekingalpha.com/author/B"
    #https://seekingalpha.com/stock-ideas/short-ideas

    [shorts]
  end
end
