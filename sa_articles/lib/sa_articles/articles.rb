class SaArticles::Articles
  attr_accessor :title, :url
  def self.ideas
    #scrape and return a bunch of instances of long or short articles
    #SaArticles::ArticlesScraper.new(https://seekingalpha.com/stock-ideas/long-ideas)
    #SaArticles::ArticlesScraper.new(https://seekingalpha.com/stock-ideas/short-ideas)

    self.scrape_longs
      long_articles = []
      long_articles << self.scrape_longs
      #SaArticles::ArticleScraper.new("https://seekingalpha.com/stock-ideas/long-ideas")
      long_articles

    self.scrape_shorts
      short_articles = []
      short_articles << self.scrape_shorts
      #SaArticles::ArticleScraper.new("https://seekingalpha.com/stock-ideas/short-ideas")
      short_articles
  end


  def self.scrape_longs
    #go to long-ideas find the articles
      #extract the properties
      #instantiate articles

    doc = Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/long-ideas"))
    title = doc.search("a.a-title")[0..9].text.strip
    url = doc.search('a.a-title')[0..9].attr("href")

    longs = self.new
    longs_title = doc.search("a.a-title")[0..9].text.strips
    longs_url = doc.search('a.a-title')[0..9].attr("href")
    [longs_title, longs_url]
    binding.pry
    #long_article_1 = self.new
    #long_article_1.title = doc.search("a.a-title")[0].text.strip
    #long_article_1.url = doc.search('a.a-title')[0].attr("href")

    #long_article_2 = self.new
    #long_article_2.title = doc.search("a.a-title")[1].text.strip
    #long_article_2.url = doc.search('a.a-title')[1].attr("href")

    #long_article_3 = self.new
    #long_article_3.title = doc.search("a.a-title")[2].text.strip
    #long_article_3.url = doc.search('a.a-title')[2].attr("href")

    #long_article_4 = self.new
    #long_article_4.title = doc.search("a.a-title")[3].text.strip
    #long_article_4.url = doc.search('a.a-title')[3].attr("href")

    #long_article_5 = self.new
    #long_article_5.title = doc.search("a.a-title")[4].text.strip
    #long_article_5.url = doc.search('a.a-title')[4].attr("href")

    #long_article_6 = self.new
    #long_article_6.title = doc.search("a.a-title")[5].text.strip
    #long_article_6.url = doc.search('a.a-title')[5].attr("href")

    #long_article_7 = self.new
    #long_article_7.title = doc.search("a.a-title")[6].text.strip
    #long_article_7.url = doc.search('a.a-title')[6].attr("href")

    #long_article_8 = self.new
    #long_article_8.title = doc.search("a.a-title")[7].text.strip
    #long_article_8.url = doc.search('a.a-title')[7].attr("href")

    #long_article_9 = self.new
    #long_article_9.title = doc.search("a.a-title")[8].text.strip
    #long_article_9.url = doc.search('a.a-title')[8].attr("href")

    #long_article_10 = self.new
    #long_article_10.title = doc.search("a.a-title")[9].text.strip
    #long_article_10.url = doc.search('a.a-title')[9].attr("href")

    #[long_article_1, long_article_2, long_article_3, long_article_4, long_article_5, long_article_6, long_article_7, long_article_8, long_article_9, long_article_10]

    #longs.url = "https://seekingalpha.com/stock-ideas/long-ideas"
  end

  def self.scrape_shorts
    #go to short-ideas find the articles
      #extract the properties
      #instantiate articles

    doc = Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/short-ideas"))
    title = doc.search("a.a-title")[0..9].text.strip
    url = doc.search('a.a-title')[0..9].attr("href")

    shorts = self.new
    shorts_title = doc.search("a.a-title")[0..9].text.strip
    shorts_url = doc.search('a.a-title')[0..9].attr("href")
    [shorts_title, shorts_url]

    #short_article_1 = self.new
    #short_article_1.title = doc.search("a.a-title")[0].text.strip
    #short_article_1.url = doc.search('a.a-title')[0].attr("href")

    #short_article_2 = self.new
    #short_article_2.title = doc.search("a.a-title")[1].text.strip
    #short_article_2.url = doc.search('a.a-title')[1].attr("href")


    #short_article_3 = self.new
    #short_article_3.title = doc.search("a.a-title")[2].text.strip
    #short_article_3.url = doc.search('a.a-title')[2].attr("href")

    #short_article_4 = self.new
    #short_article_4.title = doc.search("a.a-title")[3].text.strip
    #short_article_4.url = doc.search('a.a-title')[3].attr("href")

    #short_article_5 = self.new
    #short_article_5.title = doc.search("a.a-title")[4].text.strip
    #short_article_5.url = doc.search('a.a-title')[4].attr("href")

    #short_article_6 = self.new
    #short_article_6.title = doc.search("a.a-title")[5].text.strip
    #short_article_6.url = doc.search('a.a-title')[5].attr("href")

    #short_article_7 = self.new
    #short_article_7.title = doc.search("a.a-title")[6].text.strip
    #short_article_7.url = doc.search('a.a-title')[6].attr("href")

    #short_article_8 = self.new
    #short_article_8.title = doc.search("a.a-title")[7].text.strip
    #short_article_8.url = doc.search('a.a-title')[7].attr("href")

    #short_article_9 = self.new
    #short_article_9.title = doc.search("a.a-title")[8].text.strip
    #short_article_9.url = doc.search('a.a-title')[8].attr("href")

    #short_article_10 = self.new
    #short_article_10.title = doc.search("a.a-title")[9].text.strip
    #short_article_10.url = doc.search('a.a-title')[9].attr("href")

    #[short_article_1, short_article_2, short_article_3, short_article_4, short_article_5, short_article_6, short_article_7, short_article_8, short_article_9, short_article_10]

    #shorts = self.new
    #shorts.title = "Short stock trading articles"
    #shorts.url = "https://seekingalpha.com/stock-ideas/short-ideas"

  end
end






    #[longs, shorts]





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
