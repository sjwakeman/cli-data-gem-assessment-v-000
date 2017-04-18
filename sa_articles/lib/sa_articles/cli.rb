#our CLI Controller
class SaArticles::CLI
  def call
    list_articles
    menu
    goodbye
  end

  def list_articles
    puts "The ten most recent stock trading articles from Seekingalpha:"
    @articles = SaArticles::Articles.ideas
    @articles.each.with_index(1) do |article, i|
      puts "#{i}. #{article.title} - #{article.url}"
    end
  end

    #here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    #puts "Seekingalpha articles:"
    #@articles = SaArticles::Articles.ideas
    #@articles.each.with_index(1) do |article, i|
      #puts "#{i}. #{article.title} - #{article.url}"
    #end
  #end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number 1 for Long articles, the number 2 for Short articles, type list to see the articles again or type exit?"
      input = gets.strip.downcase

      if input.to_i>0 #&& input.to_i<3
        the_article = @articles[input.to_i-1]
        puts "#{the_article.title} - #{the_article.url}"
      elsif input == "list"
        list_articles
      else
        puts "Not sure what you want. Type list to see the articles again or type exit"
      end
    end
  end

  def goodbye
    puts "Check back later for more articles."
  end
end
