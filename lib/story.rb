class NytimesTopStories
  class Story
    attr_accessor :headline, :byline, :summary, :url
    @@all = []
    def initialize(story_hash)
      @headline = story_hash[:headline].gsub(/â/,"'")
      @byline = story_hash[:byline]
      @summary = story_hash[:summary].gsub(/â/,"'")
      @url = story_hash[:url]
      @@all << self
    end

    def self.new_from_array(array = NytimesTopStories::Scraper.get_top_stories)
        self.clear_all
        array.each do |scraped_story|
        story = NytimesTopStories::Story.new(scraped_story) unless scraped_story[:headline].empty? || scraped_story[:byline].empty? || scraped_story[:summary].empty? || scraped_story[:url].empty?
      end
    end

    def puts_story
      puts @headline
      puts @byline
      puts @summary
      puts "Press enter to open, enter any other input to escape."
      choice = gets.strip
      if choice == ""
        self.open_story
      end
    end

    def open_story
      system("open #{@url}")
    end

    def self.all
      @@all
    end

    def self.clear_all
      @@all.clear
    end
  end
end
