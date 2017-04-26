class SeekingAlphaArticles::Articles

  attr_accessor :title, :url, :author
  @@all = []

  def self.new_from_index_page(r)
    self.new(
       r.css("a.a-title").text.strip,
       r.css('a.a-title').attr("href"),
       r.css('div.a-info a').text.strip
       )
  end

  def initialize(title=nil, url=nil, author=nil)
    @title = title
    @url = url
    @author = author
  end

  def self.all
    @@all
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
