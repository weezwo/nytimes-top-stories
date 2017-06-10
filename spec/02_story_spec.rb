require 'spec_helper'

describe "Story" do
  let!(:story_hash) {{headline: "Florida Man runs amok", byline: "Chuck Scarsdale", summary: "There he goes again"}}
  let!(:another_story) {{headline: "This is another story", byline: "Jane Jabrony", summary: "this is a story"}}
  let!(:an_array_of_stories) {[story_hash, another_story]}
  it "accepts a hash on initialization and creates a Story object from its keys" do
    story = NytimesTopStories::Story.new(story_hash)
    expect(story.headline).to eq(story_hash[:headline])
    expect(story.byline).to eq(story_hash[:byline])
    expect(story.summary).to eq(story_hash[:summary])
  end

  it "pushes each new story into @@all" do
    story = NytimesTopStories::Story.new(story_hash)
    expect(NytimesTopStories::Story.all).to include(story)
  end

  describe ".new_from_array" do
    it "accepts an array of scraped stories and instantiates an object from each" do
      NytimesTopStories::Story.new_from_array(an_array_of_stories)
      expect(NytimesTopStories::Story.all.first.headline).to eq(story_hash[:headline])
    end
  end
end
