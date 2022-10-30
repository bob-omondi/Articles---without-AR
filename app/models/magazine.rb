class Magazine
  attr_reader :name, :category

@@all = []
  def initialize(name, category)
    @name = name
    @category = category
    @@all << self

  end
  #Returns an array of all Magazine instances
def self.all
  @@all
end
#Returns new instance of articles that knows it belongs to the magazine
def new_article(title, author)
  Article.new(author, self, title)
end
#Returns an articles that belong to the magazine
def articles
  Article.all.select { |article| article.magazine == self}
end
#Returns collection of author that belong to the article
def authors
  articles.map(&author)
end
#Magazine.find_by_name(name)
#Given a string of magazine's name, this method returns the first magazine object that matches
def self.find_by_name(name)
  magazine = self.all.find { |magazine| magazine.name == name}
  magazine.name
end
#  Returns an array strings of the titles of all articles written for that magazine
def article_titles
  articles.map do |article|
    article.title
end

 #  Returns an array of authors who have written more than 2 articles for the magazine
 def contributing_authors
  self.authors.filter {|author|author.articles.count > 2}
end 
 

end 
end
