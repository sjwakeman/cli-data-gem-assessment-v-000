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
       article_link = "https://seekingalpha.com#{r.css('a.a-title').attr("href")}",
       r.css('div.a-info a').last.text.strip
       #{}"https://seekingalpha.com#{r.css('a.a-title').attr("href div.a-sum").text.strip}"
       #=>/home/sjwakeman/code/labs/cli-data-gem-assessment-v-000/sa_articles/lib/sa_articles/scraper.rb:18:in `new_from_index_page': undefined method `text'
       #for nil:NilClass (NoMethodError)
       #{}"https://seekingalpha.com#{r.css('a.a-title').attr("href")("div.a-sum").text.strip}"
       #scraper.rb:18: syntax error, unexpected '(', e
       #xpecting tSTRING_DEND (SyntaxError)
       #....css('a.a-title').attr("href")("div.a-sum").text.strip}"
       #article_summary = article_link.css("div.a-sum").text
       #=>/home/sjwakeman/code/labs/cli-data-gem-assessment-v-000/sa_articles/lib/sa_articles/scraper.rb:18:in `new_from_index_page': undefined method `css'
       #for #<String:0x000000015c8090> (NoMethodError)
       #article_link.css('div.a-sum').text
       #/home/sjwakeman/code/labs/cli-data-gem-assessment-v-000/sa_articles/lib/sa_articles/scraper.rb:21:in `new_from_index_page': undefined method `css'
       #for #<String:0x00000003237988> (NoMethodError)
       #article_link.css("div.a-sum").text
       #/home/sjwakeman/code/labs/cli-data-gem-assessment-v-000/sa_articles/lib/sa_articles/scraper.rb:21:in `new_from_index_page': undefined method `css'
       #for #<String:0x000000023cfd28> (NoMethodError)
    )
    #binding.pry

      # HTML(open(@link.css("div.article-summary")))#can use link.css to parse summary from URL for article
       #make summary
       #s.css("div.a-sum")# undefined local variable s
       #open("https://seekingalpha.com#{r.css('a.a-title').attr("href")})"
       #summary = ("https://seekingalpha.com#{r.css('a.a-title').attr("href")}")
       #summary.article-summary
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

  #def get_article_summary
    #new_from_index_page(r) #(runs method to be able to open scraped result)
    #Nokogiri::HTML(open("https://seekingalpha.com#{r.css('a.a-title').attr("href")}"))
    #Nokogiri::HTML(open(article_link))
  #end

  #def scrape_article_summary
    #self.get_article_summary.css("div.article-summary")
    #self.get_article_summary.css("div.a-sum")
  #end

  #def new_from_summary_page(article_link)
    #SaArticles.new(
    #article_link.css("div.article-summary")
    #s.css("div.a-sum")
    #)
  #end

  #def make_summary
    #scrape_article_summary.each do |s|
      #new_from_summary_page(article_link)
    #end
  #end

  #def article_summary_website
    #summary = Nokogiri(open(article_link))
  #end

  #def scrape_summary
    #article_summary = summary.css("div.a-sum").text
  #end

  #def make_summary
    #scrape_summary
    #self
  #end
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
