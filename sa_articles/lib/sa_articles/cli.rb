class SeekingAlphaArticles::CLI

  def call
    SeekingAlphaArticles::Scraper.new.make_articles
    puts "SeekingAlpha stock trading articles"
    start
  end

  def start
    puts ""
    puts "What number articles would you like to see? 1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90, or 91-100?"
    input = gets.strip.to_i

    print_articles(input)

    puts ""
    puts "What article would you like more information on?"
    input = gets.strip

    article = SeekingAlphaArticles::Article.find(input.to_i)

    print_article(article)

    puts ""
    puts "Would you like to read another article? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Check back later for more articles."
      exit
    end
  end

  def print_article(article)
    puts ""
    puts "----------- #{article.title} - #{article.position} -----------"
    puts ""
    puts "Stock Symbol:           #{article.stock_symbol}"
    puts "Date:           #{article.date}"
    puts "Author:           #{article.author}"
    puts "Website:            #{article.url}"
    puts ""
    puts "---------------Summary--------------"
    puts ""
    puts "#{article.summary}"
    puts ""
  end

  def print_articles(from_number)
    puts ""
    puts "---------- Articles #{from_number} - #{from_number+9} ----------"
    puts ""
    SeekingAlphaArticles::Article.all[from_number-1, 10].each.with_index(from_number) do |article, index|
      puts "#{index}. #{article.title} - #{article.stock_symbol}"
    end
  end

end
