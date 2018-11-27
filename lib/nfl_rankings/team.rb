class NflRankings::Team
  
  attr_accessor :city, :mascot
  @@all = []

  def initialize(city, mascot, team_url)
    @city = city
    @mascot = mascot
    @team_url = team_url
    @@all << self
  end

  def self.all
    @@all
  end
end