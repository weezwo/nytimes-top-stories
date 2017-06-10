class NytimesTopStories::Story
  attr_accessor :headline, :byline, :summary
  @@all = []
  initialize(story_hash)
    @headline = story_hash[:headline]
    @byline = story_hash[:byline]
    @summary = story_hash[:summary]
  end

  def self.new_from_array
    scrape = Scraper.new
    scrape.get_top_stories.each do |scraped_story|
      story = Story.new(scraped_story)
      @@all << story
    end
  end
end
