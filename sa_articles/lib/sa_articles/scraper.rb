class SaArticles::Scraper
  attr_accessor :scrape_summary

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
       #open("https://seekingalpha.com#{r.css('a.a-title').attr("href")})"
    )
  end
        #+>https://seekingalpha.com/article/4068081-apples-bottom-line-strong-appears
       #r.css('a.a-title').attr("href")
       #.css('div.a-sum').all.text
       #{}"https://seekingalpha.com#{r.css('a.a-title').attr("href")}"
       #div.article-summary.article-width div.a-sum
       #('div.article-summary article-width')


  def make_articles(ext)
    scrape_articles_index(ext).each do |r|
      new_from_index_page(r)
    end
  end

  def get_article_summary
    new_from_index_page(r) #(runs method to be able to open scraped result)
    Nokogiri::HTML(open("https://seekingalpha.com#{r.css('a.a-title').attr("href")}"))
  end

  def scrape_article_summary
    self.get_article_summary.css("div.a-sum")
  end

  def new_from_summary_page(s)
    SaArticles.new(
    s.css("div.a-sum")
    )
  end

  def make_summary
    scrape_article_summary.each do |s|
      new_from_summary_page(s)
    end
  end

  #def get_article_summary
    #doc = Nokogiri::HTML(open("https://seekingalpha.com#{r.css('a.a-title').attr("href")}))"))
    #@scrape_summary ||= Nokogiri::HTML(doc)
    #page = Nokogiri::HTML(open("https://seekingalpha.com#{r.css('a.a-title').attr("href")}))"
  #end
    #new_from_index_page(r)
    #@doc = Nokogiri::HTML(open("https://seekingalpha.com#{r.css('a.a-title').attr("href")}))"
     #+>https://seekingalpha.com/article/4068081-apples-bottom-line-strong-appears
    #doc = Nokogiri::HTML(open("https://seekingalpha.com#{r.css('a.a-title').attr("href")}))"
    #page = search.css('https://seekingalpha.com#{r.css('a.a-title').attr("href")}')
    #SaArticles::Articles
    #Nokogiri::HTML(open("page"))#("https://seekingalpha.com#{r.css('a.a-title').attr("href")}"))
    #Nokogiri::HTML(open("#{url}"))


  #def scrape_article_summary
    #summaries = scrape_summary.css("div").css(".a-sum").css("p").children.map { |summary| summary.text }.compact

  #end

  #def article_summary_website
    #{}"https://seekingalpha.com#{r.css('a.a-title').attr("href")}"
  #end
    #self.get_article_summary.css('div.a-sum')
    #self.get_article_summary.css('div.article-width')
    #self.get_article_summary.css('div.article-summary')
    #self.get_article_summary.css('div.article-summary article-width')
    #self.get_article_summary.css('div.article-summary article-width div.a-sum")
#binding.pry
end
