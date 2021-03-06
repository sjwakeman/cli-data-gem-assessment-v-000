class SaArticles::CLI
  attr_accessor :article_link
  def long_or_short
    puts "Seekingalpha stock trading articles:"
    input = nil
      puts "Enter the number 1 for Long articles, or the number 2 for Short articles."
      while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        long_call
      when "2"
        short_call
        else
          puts "Not sure what you want. Enter the number 1 for Long articles, the number 2 for Short articles, or exit."
      end
    end
  end

  def long_call
    SaArticles::Scraper.new.make_articles("long-ideas")
    puts "SeekingAlpha Long stock trading articles"
    start
  end

  def short_call
    SaArticles::Scraper.new.make_articles("short-ideas")
    puts "SeekingAlpha Short stock trading articles"
    start
  end

  def start
    puts ""
    puts "What number articles would you like to see?"
    input = gets.strip.to_i

    print_articles(input)

    puts ""
    puts "What article number would you like more information on?"
    input = gets.strip

    article = SaArticles::Article.find(input.to_i)
    SaArticles::Scraper.scrape_summaries(article)
    print_article(article)

    puts ""
    puts "Would you like to read another article? Enter y or n"

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
    puts "----------- #{article.title} -----------"
    puts ""
    puts "Stock Symbol:           #{article.stock_symbol}"
    puts "Author:                 #{article.author}"
    puts "Website:                #{article.url}"
    puts ""
    puts "Summary:                #{article.summary_one}"
    puts "                        #{article.summary_two}"
    puts "                        #{article.summary_three}"
    puts ""
  end

  def print_articles(from_number)
    puts ""
    puts "---------- Articles #{from_number} - #{from_number+9} ----------"
    puts ""
    SaArticles::Article.all[from_number-1, 10].each.with_index(from_number) do |article, index|
      puts "#{index}. #{article.title} - #{article.stock_symbol}"
    end
  end

end
