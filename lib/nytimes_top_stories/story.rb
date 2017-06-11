class NytimesTopStories::Story
  attr_accessor :headline, :byline, :summary
  @@all = []
  def initialize(story_hash)
    @headline = story_hash[:headline].gsub(/â/,"'")
    @byline = story_hash[:byline]
    @summary = story_hash[:summary].gsub(/â/,"'")
    @@all << self
  end

  def self.new_from_array(array = NytimesTopStories::Scraper.get_top_stories)
      self.clear_all
      array.each do |scraped_story|
      story = NytimesTopStories::Story.new(scraped_story) unless scraped_story[:headline].empty? || scraped_story[:byline].empty? || scraped_story[:summary].empty?
    end
  end

  def self.all
    @@all
  end

  def self.clear_all
    @@all.clear
  end
end
