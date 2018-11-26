class NflRankings::CLI 

  def greeting_and_search
    @nfl_teams = *(1..32)
    @nfl_teams.map! { |i| i.to_s }
    input = ""

    while input != "exit"
      puts "Here are the USA TODAY NFL Power Rankings. \n\n"
      Scraper
      puts "If interested in a team's stats for the previous game, please select a team by number.\n\n"
      puts "To quit, type 'exit'."
      puts "Please enter a team number or type 'exit'"
      input = gets.strip.downcase
      if input != "exit"
        search(input)
      end
    end
  end


  def search(input)
    if @nfl_teams.include?(input)
       puts "you did it"
        #Rin
    else
      puts "Invalid Response. Please try again."
    end

  end
end