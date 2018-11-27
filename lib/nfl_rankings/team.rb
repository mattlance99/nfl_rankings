class NflRankings::Team

  attr_accessor :city, :mascot, :team_url, :passing_yards, :rushing_yards, :receiving_yards
  @@all = []

  def initialize(city, mascot, team_url)
    @city = city
    @mascot = mascot
    @team_url = team_url
    @passing_yards = passing_yards
    @rushing_yards = rushing_yards
    @receiving_yards = receiving_yards

    @@all << self
  end

  def self.all
    @@all
  end
end