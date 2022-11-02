class Author
attr_reader :first_name, :last_name

@@all = []

def initialize(name)
  name = name.split()
  @first_name = name[0]
  @last_name = name[1]
  @@all << self
end 

def self.all
  @@all
end

def name
  "#{@first_name} #{@last_name}"
end
#Returns new instance of articles that knows it belongs to the author
def add_article(magazine, title)
  Article.new(magazine, self, title)
end
#Returns article that belongs to the author
def articles
  Article.all.select do |article|article.author.name == self.name
  end
end
#Author#topic_areas
def topic_areas
  @magazine.map {|magazine|magazine.category}.uniq
end

#Returns magazine articles that belongs to the article
def magazines 
  self.articles.map { |article| article.magazine }.uniq
  end
end