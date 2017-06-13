require 'open-uri'
require 'open_uri_redirections'

class NytimesTopStories
  class Scraper
    def self.open_site(site = "https://www.nytimes.com")
      html = open(site, :allow_redirections => :safe)
      doc = Nokogiri::HTML(html)
    end

    def self.get_top_stories(site = "https://www.nytimes.com")
      doc = self.open_site(site)
      top_stories_array = []
      stories = doc.css("#top-news .collection .theme-summary")
      stories.each do |story|
        story_hash = {}
        story_hash[:headline] = story.css(".story-heading a").text
        story_hash[:byline] = story.css(".byline").text.strip
        if !story.css("ul").empty?
          story_hash[:summary] = story.css("ul").text.strip
        else
          story_hash[:summary] = story.css("p.summary").text.strip
        end
        if !story.at_css(".story-heading a").nil?
          story_hash[:url] = story.css(".story-heading a").attr("href").value
        end
        top_stories_array << story_hash
      end
      top_stories_array
    end

    def self.get_date(site = "http://nytimes.com")
      doc = self.open_site(site)
      doc.css(".masthead-menu .date").text
    end
  end
end
