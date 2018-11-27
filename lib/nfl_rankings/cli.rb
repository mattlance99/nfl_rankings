class NflRankings::CLI 

def greeting_and_search
    @nfl_teams = *(1..32)
    @nfl_teams.map! { |i| i.to_s }
    input = ""
    puts "\n The USA TODAY NFL Power Rankings are as follows: \n\n"
    Scraper.scrape_main_page

    Team.all.each_with_index do |team, index|
      puts "#{index +1 }. #{team.city} #{team.mascot}"
    end

    while input != "exit"
      puts "\n\nSelect a team(by number) to see stats for the previous game.\n"
      puts "To quit, type 'exit'."
      puts "\nPlease enter a team number or type 'exit':"
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