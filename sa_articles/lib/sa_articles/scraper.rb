class SaArticles::Scraper

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
       #.css('div.a-sum').all.text
       #{}"https://seekingalpha.com#{r.css('a.a-title').attr("href")}"
       #div.article-summary.article-width div.a-sum
       #('div.article-summary article-width')
       )
  end

  def make_articles(ext)
    scrape_articles_index(ext).each do |r|
        new_from_index_page(r)
    end
  end

  def get_article_summary
    #SaArticles::Articles
    Nokogiri::HTML(open("https://seekingalpha.com#{r.css('a.a-title').attr("href")}"))
    #Nokogiri::HTML(open("#{url}"))
  end

  def scrape_article_summary
    self.get_article_summary.css('div.a-sum')
    #self.get_article_summary.css('div.article-width')
    #self.get_article_summary.css('div.article-summary')
    #self.get_article_summary.css('div.article-summary article-width')
    #self.get_article_summary.css('div.article-summary article-width div.a-sum")
#binding.pry
  end

end
