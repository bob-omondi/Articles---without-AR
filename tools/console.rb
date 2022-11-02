require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

magazine1 = Magazine.new("magazine1", "category1")
magazine2 = Magazine.new("magazine2", "category2")
magazine3 = Magazine.new("magazine3", "category2")

art1 = Article.new("author1",  "magazine1", "title1")
art2 = Article.new("author2",  "magazine2", "title2")

author1 = Author.new("Thierry Henry")
author2 = Author.new("Steve Wozniak")
author3 = Author.new("Bianca Glen")
      


### DO NOT REMOVE THIS
binding.pry

0
