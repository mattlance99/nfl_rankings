require "nokogiri"
require "open-uri"
require "pry"

class NflRankings::Scraper

  def self.scrape_main_page
    html = open("https://www.usatoday.com/sports/nfl/rankings/")
    page = Nokogiri::HTML(html)
    teams = []
    my_string = ""
    my_string = page.css(".team_slug").text
  
    my_string = page.css(".team_slug").each do |team_doc|
      city = team_doc.css('.first_name').text
      mascot = team_doc.css('.last_name').text
      team_url = "https://www.usatoday.com/sports/nfl/#{mascot}"
      NflRankings::Team.new(city, mascot, team_url)
      end
  end
  
  def self.scrape_team_page(team_rank, team_url)
    html = open("#{team_url}")
    team_page = Nokogiri::HTML(html)
    leading_stats = team_page.css(".sports-team-statistics-chart-titlevalue").children[0..2].map {|stat|stat.text}
    NflRankings::Team.all[team_rank].passing_yards = leading_stats[0]
    NflRankings::Team.all[team_rank].rushing_yards = leading_stats[1]
    NflRankings::Team.all[team_rank].receiving_yards = leading_stats[2]
  end
end