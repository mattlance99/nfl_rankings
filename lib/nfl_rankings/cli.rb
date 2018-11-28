class NflRankings::CLI 

  def start
    @nfl_teams = *(1..32)
    @nfl_teams.map! { |i| i.to_s }
    input = ""
    puts "\n The USA TODAY NFL Power Rankings are as follows: \n\n"
    NflRankings::Scraper.scrape_main_page

    NflRankings::Team.all.each_with_index do |team, index|
      puts "#{index +1 }. #{team.city} #{team.mascot}"
    end

    while input != "exit"
      puts "\n\nSelect a team(by number) to see stats for the previous game.\n"
      puts "To quit, type 'exit'."
      puts "\nPlease enter a team number or type 'exit':"
      input = gets.strip.downcase
      if input != "exit" && @nfl_teams.include?(input)
        team_rank = input.to_i
        team_rank -= 1
        team_page_url = NflRankings::Team.all[team_rank].team_url
        NflRankings::Scraper.scrape_team_page(team_rank, team_page_url)
        puts "\nTotal yards for each offensive category:\n"
        puts "\nTotal Passing yards: #{NflRankings::Team.all[team_rank].passing_yards}"
        puts "Total Rushing yards: #{NflRankings::Team.all[team_rank].rushing_yards}"
        puts "Total Receiving yards: #{NflRankings::Team.all[team_rank].receiving_yards}"
      elsif input != "exit" && @nfl_teams.include?(input) == false
        puts "Invalid Response. Please try again."
      elsif input == "exit"
        puts "Check again next week for an update!"
      end
    end
  end
end