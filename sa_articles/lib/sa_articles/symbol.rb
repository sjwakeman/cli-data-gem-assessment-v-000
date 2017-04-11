class SaArticles::Symbol
  #require 'net/http'
  #seekingalpha.com/symbol/MNST?s=mnst
    #def stock(*symbols)
        #Hash[*(symbols.collect{|symbol|[symbol,Hash[\
        #*(Net::HTTP.get('seekingalpha.com','/d?f=nl1&s='+symbol).chop\
        #.split(',').unshift("Name").insert(2,"Price"))]];}.flatten)];
    #end
#end
end
