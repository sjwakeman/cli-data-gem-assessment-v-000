class SaArticles::LongScraper
  def get_page
    Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/long-ideas"))
  end

  def scrape_articles_index
    self.get_page.css("div.media-body")
  end

  def new_from_index_page(r)
    SaArticles::Articles.new(
       r.css('div.a-info a').first.text.strip,
       r.css("a.a-title").text.strip,
       "https://seekingalpha.com#{r.css('a.a-title').attr("href")}",
       r.css('div.a-info a').last.text.strip
       )
  end

  def make_articles
    scrape_articles_index.each do |r|
        new_from_index_page(r)
    end
  end
end
