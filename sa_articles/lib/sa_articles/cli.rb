#our CLI Controller
class SaArticles::CLI
  def call
    long_or_short
    list_articles
    menu
    goodbye
  end

  def long_or_short
    input = nil
    while input != "long" || input != "short"
    puts "Would you like to list the ten most recent long or short Seeking Alpha trading articles?"
      input = gets.strip.downcase
      if input = long
        long_articles = @long_list
      elsif input = short
        short_articles = @short_list
      else
        puts "Not sure what you want? Type long or short"
      end
    end
  end

  def list_articles
    #here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts "Seekingalpha articles:"
    @articles = SaArticles::Articles.ideas
    @articles.each.with_index(1) do |article, i|
      puts "#{i}. #{article.title} - #{article.url}"
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the article you would like to read or type list to see the articles again or type exit:"
      input = gets.strip.downcase
      if input.to_i>0 #&& input.to_i<3
        the_article = @articles [input.to_i-1]
        puts "#{the_article.title} - #{the_article.url}"
      elsif input == "list"
        list_articles
      else
        puts "Not sure what you want? Type 1, 2, list or exit"
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more articles."
  end
end
