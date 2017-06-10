require 'spec_helper'

describe "Story" do
  let!(:story_hash) {{headline: "Florida Man runs amok", byline: "Chuck Scarsdale", summary: "There he goes again"}}
  it "accepts a hash on initialization and creates a Story object from its keys" do
    story = NytimesTopStories::Story.new(story_hash)
    expect(story.headline).to eq(story_hash[:headline])
    expect(story.byline).to eq(story_hash[:byline])
    expect(story.summary).to eq(story_hash[:summary])
  end
end
