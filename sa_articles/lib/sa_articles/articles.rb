class SaArticles::Articles

  attr_accessor :title, :url, :author
  @@all = []

  def self.new_from_index_page(r)
    self.new(
       r.css("a.a-title").text.strip,
       r.css('a.a-title').attr("href"),
       r.css('div.a-info a').last.text.strip
       )
       #r.css('div.a-info').text.strip
       #=> "VRX\u2022 Today, 8:02 AM \u2022 Biotechnocrat\u202210\u00A0Comments"
       #binding.pry
  end

  def initialize(title=nil, url=nil, author=nil)
    @title = title
    @url = url
    @author = author
    @@all << self
    #@stock_symbol = stock_symbol
    #@date = date
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def title
    @title ||=r.css("a.a-title").text.strip
  end

  #def stock_symbol
    #@stock_symbol ||= doc.css('div.a-info').first.text.strip
  #end

  #def date
    #@date ||= doc.css('div.a-info').text.strip
  #end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
