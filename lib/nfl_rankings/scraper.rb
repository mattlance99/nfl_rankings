require "nokogiri"
require "open-uri"
require "pry"

class NflRankings::Scraper

    html = open("https://www.usatoday.com/sports/nfl/rankings/")
    page = Nokogiri::HTML(html)
    teams = []
    my_string = ""
    page.css(".team_slug")
    my_string = page.css(".team_slug").text
  
    my_string = page.css(".team_slug").each do |team_doc|
      city = team_doc.css('.first_name').text
      mascot = team_doc.css('.last_name').text
      Team.new(city, mascot)
    end

    Team.all.each_with_index do |team, index|
      puts "#{index +1 }. #{team.city} #{team.mascot}"
    end
end