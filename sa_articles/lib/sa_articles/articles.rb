class SeekingAlphaArticles::Article

  attr_accessor :title, :url, :author
  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("a.a-title").text.strip,
      r.css('div.a-info a').text.strip
      r.css('a.a-title').attr("href"),
      )
  end
end
