class NytimesTopStories::Story
  attr_accessor :headline, :byline, :summary
  @@all = []
  def initialize(story_hash)
    @headline = story_hash[:headline]
    @byline = story_hash[:byline]
    @summary = story_hash[:summary]
    @@all << self
  end

  def self.new_from_array(array = NytimesTopStories::Scraper.get_top_stories)
      array.each do |scraped_story|
      story = NytimesTopStories::Story.new(scraped_story)
    end
  end

  def self.all
    @@all
  end
end
