class NflRankings::Team
  
  attr_accessor :city, :mascot
  @@all = []
  
  def initialize(city, mascot)
    @city = city
    @mascot = mascot
    @@all << self
  end

  def self.all
    @@all
  end
end