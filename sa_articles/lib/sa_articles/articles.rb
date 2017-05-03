class SaArticles::Articles

  attr_accessor :stock_symbol, :title, :url, :author, :summary
  @@all = []

  def initialize(stock_symbol=nil, title=nil, url=nil, author=nil, summary=nil)
    @stock_symbol = stock_symbol
    @title = title
    @url = url
    @author = author
    @summary = summary
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  #def summary
    #@summary ||= url.css('div.article-summary')
    #('div.article-summary article-width')
  #end

  #def title
    #@title ||=r.css("a.a-title").text.strip
  #end

  #def stock_symbol
    #@stock_symbol ||= doc.css('div.a-info').first.text.strip
  #end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
