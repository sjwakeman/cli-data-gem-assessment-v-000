class SaArticles::Scraper
  attr_accessor :article_link

  def get_page(ext)
    Nokogiri::HTML(open("https://seekingalpha.com/stock-ideas/#{ext}"))
  end

  def scrape_articles_index(ext)
    self.get_page(ext).css("div.media-body")
  end

  def new_from_index_page(r)
    SaArticles::Article.new(
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

  def self.scrape_summaries(article)
    doc = Nokogiri::HTML(open(article.url))

    article.summary_one = doc.css('div.article-summary .a-sum p:first-child').text
    article.summary_two = doc.css('div.article-summary .a-sum p:nth-child(2)').text
    article.summary_three = doc.css('div.article-summary .a-sum p:nth-child(3)').text
  end
end
