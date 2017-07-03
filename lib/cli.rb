class NytimesTopStories
  class CLI
    def call
      puts NytimesTopStories::Scraper.get_date
      puts "Headlines live from NYT:"
      self.display_stories
      self.menu
      self.goodbye
    end

    def display_stories
      NytimesTopStories::Story.new_from_array
      NytimesTopStories::Story.all.each.with_index(1) {|story, i| puts "#{i}: #{story.headline}"}
    end

    def display_historical_stories
      NytimesTopStories::Story.history.each.with_index(1) {|story, i| puts "#{i}: #{story.headline}"}
    end

    def menu
      choice = nil
      until choice == "exit"
        puts "Enter story number for more information, or type 'list'/'exit'"
        choice = gets.strip.downcase
        #if choice.to_i > 0 && !NytimesTopStories::Story.all[choice.to_i-1].nil?
        if choice.to_i.between?(1, NytimesTopStories::Story.all.size)
          #story = NytimesTopStories::Story.all[choice.to_i-1]
          story = NytimesTopStories::Story.find(choice.to_i-1)
          story.puts_story
        elsif choice == "list"
          self.call
        elsif choice == "history"
          self.display_historical_stories
        elsif choice == "exit"
          break
        else
          puts "Input invalid. Type 'list' or 'exit'."
        end
      end
    end

    def goodbye
      puts "The truth is more important now than ever."
      exit(0)
    end
  end
end
