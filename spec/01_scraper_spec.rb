require 'spec_helper'

describe "Scraper" do

  let!(:stories_array) {[{headline: "Trump Accuses Comey of Lies; Offers Sworn Testimony",
                          byline: "By JULIE HIRSCHFELD DAVIS and GLENN THRUSH",
                          summary: "President Trump emerged defiant after James B. Comey’s harsh testimony to Congress, accusing him of lying under oath and calling him “a leaker.”
But he also said that Mr. Comey’s comments “showed no collusion, no obstruction” regarding the Trump campaign and Russia."},
                        {headline: "Trump Assails Qatar, Despite Tillerson’s Call for ‘Calm’",
                        byline: "By MARK LANDLER and GARDINER HARRIS",
                        summary: "The president accused the Persian Gulf nation of being a “funder of terror at a very high level,” undercutting efforts to mediate a dispute between Qatar and its neighbors."}]}

  describe "#get_top_stories" do
    it "is a class method that scrapes the NYTimes front page and returns an array of hashes containing details of all stories with front-page summaries." do

      scraped_stories = Scraper.get_top_stories
      expect(scraped_stories).to be_a(Array)
      expect(scraped_stories.first).to have_key(:headline)
      expect(scraped_stories.first).to have_key(:summary)
      expect(scraped_stories.first).to have_key(:byline)
      expect(scraped_stories).to include(stories_array[0])
    end
  end

end
