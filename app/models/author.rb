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
def new_article(title, magazine)
  Article.new(title, magazine, self)
end
#Returns article that belongs to the author
def articles
  Article.all.select { |article| article.authors == self}
end
#Author#topic_areas
def topic_areas
  articles.map { |article| article.category}.uniq
end

#Returns magazine that belongs to the article
def magazines
  articles.map(&:magazine)
end
end