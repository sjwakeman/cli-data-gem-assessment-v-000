class SaArticles::Article
  attr_accessor :title, :author, :url
  def self.today
    #scrape and return a bunch of instances of articles
    #puts <<-DOC.gsub /^\s+/, ""
    #1. article
    #2. article
    #DOC

    self.scrape_longs
    #SaArticles::ArticleScraper.new("https://seekingalpha.com/stock-ideas/long-ideas")
    self.scrape_shorts
    #SaArticles::ArticleScraper.new("https://seekingalpha.com/stock-ideas/short-ideas")

    def self.scrape_longs
      longs = []
      #go to https://seekingalpha.com/stock-ideas/long-ideas
      #extract the ideas properties (title, author and url)
      
      

    end

    def self.scrape_shorts
      shorts = []
      #go to https://seekingalpha.com/stock-ideas/short-ideas
      #extract the ideas properties (title, author and url)



      
    end  
      
    #article_1 = self.new
    #article_1.title = "1. article"
    #article_1.author ="http://seekingalpha.com/author/A"
    #article_1.url ="http://seekingalpha.com/article/1"
    #https://seekingalpha.com/stock-ideas
    #https://seekingalpha.com/stock-ideas/long-ideas

    #article_2 = self.new
    #article_2.title = "2. article"
    #article_2.author ="http://seekingalpha.com/author/B"
    #article_2.url ="http://seekingalpha.com/article/2"
    #https://seekingalpha.com/stock-ideas
    #https://seekingalpha.com/stock-ideas/short-ideas
    [longs, shorts]
  end
end
