#our CLI Controller
class SaArticles::CLI
  def call
    list_articles
    menu
    goodbye
  end

  def list_articles
    #here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts "Today's seekingalpha articles:"
    @articles = SaArticles::Article.today
    @articles.each.with_index(1) do |article, i|
      puts "#{i}. #{article.title} - {article.author} - #{article.url}" 
    end
  end

  def menu
    input = nil
    while input != "exit"
    puts "Enter the number of the article you would like to read or type list to see the articles again or type exit:"
      input = gets.strip.downcase
      if input.to_i>0 #&& input.to_i<3
        the_article = @articles [input.to_i-1]
        puts puts "#{the_article.title} - {the_article.author} - #{the_article.url}"
      elsif input == "list"
        list_articles
      else
        puts "Not sure what you want? Type 1, 2, list or exit"
      end
    end
  end
hello
  def goodbye
    puts "See you tomorrow for more articles."
  end
end