class SaArticles::Articles

  attr_accessor :stock_symbol, :title, :url, :author, :summary_one, :summary_two, :summary_three
  @@all = []

  def initialize(stock_symbol=nil, title=nil, url=nil, author=nil)
    @stock_symbol = stock_symbol
    @title = title
    @url = url
    @author = author
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def summary_one
     doc.css('div.article-summary .a-sum p:first-child').text
  end

  def summary_two
     doc.css('div.article-summary .a-sum p:nth-child(2)').text
  end

  def summary_three
     doc.css('div.article-summary .a-sum p:nth-child(3)').text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
