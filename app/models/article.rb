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

end
