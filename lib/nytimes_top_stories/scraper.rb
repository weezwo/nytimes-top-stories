require 'open-uri'

class NytimesTopStories::Scraper

  def self.open_site(site = "http://nytimes.com")
    html = open(site)
    doc = Nokogiri::HTML(html)
  end

  def self.get_top_stories(site = "http://nytimes.com")
    doc = self.open_site(site)
    top_stories_array = []
    stories = doc.css("#top-news .collection .theme-summary")
    stories.each do |story|
      story_hash = {}
      story_hash[:headline] = story.css(".story-heading a").text
      story_hash[:byline] = story.css(".byline").text.strip
      if story.css("ul") != []
        story_hash[:summary] = story.css("ul").text.strip
      else
        story_hash[:summary] = story.css(".summary").text
      end
        top_stories_array << story_hash
      end
    top_stories_array
  end

  def self.get_weather(site = "http://nytimes.com")
    doc = self.open_site(site)
    doc.css("#weather .weather-button").text
  end

end
