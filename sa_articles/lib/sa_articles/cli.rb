#our CLI Controller
class SaArticles::CLI
  def call
    long_or_short
    long_articles
    short_articles
    #menu
    #goodbye
  end

  def long_or_short
    puts " Seekingalpha stock trading articles:"
    input = nil
      puts "Enter the number 1 for Long articles, the number 2 for Short articles."
      while input != "1" || input != "2"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Long stock trading articles"
          long_articles
      when "2"
        puts "Short stock trading articles"
          short_articles
        else
          puts "Not sure what you want. Enter the number 1 for Long articles, the number 2 for Short articles."
      end
    end
  end

  def long_articles
    puts "Seekingalpha Long stock trading articles:"
    @long_articles = SaArticles::Articles.ideas
    @long_articles.each.with_index(1) do |article, i|
      puts "#{i}. #{article.title} - #{article.url}"
    end
  end

  def short_articles
    puts "Seekingalpha stock trading articles:"
    @short_articles = SaArticles::Articles.ideas
    @short_articles.each.with_index(1) do |article, i|
      puts "#{i}. #{article.title} - #{article.url}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number for the article you are interested in reading or exit."
      #input = gets.strip.downcase

      #if input.to_i>0
        #the_article = @articles[input.to_i-1]
        #puts "#{the_article.title} - #{the_article.url}"
      #elsif input == "list"
        #list_articles
      #else
        #puts "Not sure what you want. Type list to see the articles again or type exit"
      #end
    end
  end

  #def goodbye
    #puts "Check back later for more articles."
  #end
end
