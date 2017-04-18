class SaArticles::Articles
  attr_accessor :title, :url
  def self.ideas
    #scrape and return a bunch of instances of long or short articles
    #SaArticles::ArticlesScraper.new(https://seekingalpha.com/stock-ideas/long-ideas)
    #SaArticles::ArticlesScraper.new(https://seekingalpha.com/stock-ideas/short-ideas)

    self.scrape_articles

      articles = []

      articles << self.scrape_longs
      #articles << self.scrape_shorts

      #SaArticles::ArticleScraper.new("https://seekingalpha.com/stock-ideas/long-ideas")
      #SaArticles::ArticleScraper.new("https://seekingalpha.com/stock-ideas/short-ideas")
      articles
  end

  def self.scrape_longs
    doc = Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/long-ideas"))
    title = doc.search("a.a-title")[0..10].text.strip
    url = doc.search('a.a-title')[0..10].attr("href")

    article = self.new
    article.title = doc.search("a.a-title")[0..10].text.strip
    article.url = doc.search('a.a-title')[0..10].attr("href")

    #go to long-ideas find the articles
    #extract the properties
    #instantiate articles

    #go to short-ideas find the articles
    #extract the properties
    #instantiate articles



    #longs = self.new
    #longs.title = "Long stock trading articles"
    #longs.url = "https://seekingalpha.com/stock-ideas/long-ideas"

    #shorts = self.new
    #shorts.title = "Short stock trading articles"
    #shorts.url = "https://seekingalpha.com/stock-ideas/short-ideas"

    #[longs, shorts]

  end
end



    #long_article = self.new

    #titles = doc.search(“a.a-title”).text.strip #returns All Titles
    #first_long_title = doc.search("a.a-title")[0].text.strip #returns First Title
    #second_long_title = doc.search("a.a-title")[1].text.strip #returns Second Title
    #third_long_title = doc.search("a.a-title")[2].text.strip #returns Third Title
    #ten_long_titles = doc.search("a.a-title")[0..10].text.strip

    #first_url = url = doc.search('a.a-title').first.attr("href")
    #first_long_url = doc.search('a.a-title')[0].attr("href")
    #second_long_url = doc.search('a.a-title')[1].attr("href")
    #third_long_url = doc.search('a.a-title')[2].attr("href")

    #long_article.author ="http://seekingalpha.com/author/A"
    #https://seekingalpha.com/stock-ideas/long-ideas
    #[longs]
  #end

  #def self.scrape_shorts
    #doc = Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/short-ideas"))
    #binding.pry

    #short_article = self.new

    #short_titles = doc.search(“a.a-title”).text.strip #returns All Titles
    #first_short_title = doc.search("a.a-title")[0].text.strip #returns First Title
    #second__short_title = doc.search("a.a-title")[1].text.strip #returns Second Title
    #third__short_title = doc.search("a.a-title")[2].text.strip #returns Third Title
    #short_titles = doc.search("a.a-title")[0..10].text.strip #returns 10 Titles

    #first_short_url = url = doc.search('a.a-title').first.attr("href")
    #first_short_url = doc.search('a.a-title')[0].attr("href")
    #second_short_url = doc.search('a.a-title')[1].attr("href")
    #third_short_url = doc.search('a.a-title')[2].attr("href")


    #short_article.author ="http://seekingalpha.com/author/B"
    #https://seekingalpha.com/stock-ideas/short-ideas

    #[shorts]
  #end
