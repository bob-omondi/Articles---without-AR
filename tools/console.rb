require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

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
    Article.new(title, author, self)
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
  
  end
  class Article
    attr_reader :author, :magazine, :title
    #a class variable to keep track of all class instances created.
    
    @@all = []
    
    def initialize (author, magazine, title)
        #The essence of passing in both the author and magazine instance is to build 
        # the relationship so every article knows the author and magazine they belong to.
        @author = author
        @magazine = magazine
        @title = title
        # push each instance to the all array.
        @@all << self
    end
    
    def self.all
        @@all
    end
    # def self.all_articles
    #     self.all.map { |a| a.name}
    #   end
    end
      


### DO NOT REMOVE THIS
binding.pry

0
