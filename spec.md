# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
    Upon execution, the program presents the user with a list of articles scraped
    from the NY Times homepage. The user can interact with the program through the
    command line.
- [x] Pull data from an external source
    I use Nokogiri to scrape the NY Times website for content with id #top-news,
    and classes .collection and .theme-summary. This content is then combed for
    attributes matching headline, byline, and a short summary.
- [x] Implement both list and detail views
    Upon execution, the program presents the user with a list of articles.
    Each is numbered, and if that number is entered, the details for that article
    are displayed.
