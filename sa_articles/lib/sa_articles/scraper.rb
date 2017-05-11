class SaArticles::Scraper
  attr_accessor :article_link

  def get_page(ext)
    Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/#{ext}"))
  end

  def scrape_articles_index(ext)
    self.get_page(ext).css("div.media-body")
  end

  def new_from_index_page(r)
    SaArticles::Articles.new(
       r.css('div.a-info a').first.text.strip,
       r.css("a.a-title").text.strip,
       "https://seekingalpha.com#{r.css('a.a-title').attr("href")}",
       r.css('div.a-info a').last.text.strip
    )
  end

  def make_articles(ext)
    scrape_articles_index(ext).each do |r|
      new_from_index_page(r)
    end
  end
end
