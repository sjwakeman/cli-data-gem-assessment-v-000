class SaArticles::Article

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

end
