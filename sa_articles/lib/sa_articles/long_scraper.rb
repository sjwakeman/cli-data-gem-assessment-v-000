class SaArticles::LongScraper
  def get_page
    Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/long-ideas"))
  end

  def scrape_articles_index
    self.get_page.css("div.media-body")
  end

  def make_articles
    scrape_articles_index.each do |r|
        SaArticles:Articles.new_from_index_page(r)
    end
  end
end
