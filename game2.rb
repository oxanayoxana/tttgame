

class Game
  attr_reader :name, :player_1, :player_2

  def initialize(name)
    @s = {
      "1": 1,
      "2": 2,
      "3": 3,
      "4": 4,
      "5": 5,
      "6": 6,
      "7": 7,
      "8": 8,
      "9": 9
    }
    @name = name
    @player_1_results = []
    @player_2_results = []
    
    @player_1 = ""
    @player_2 = ""
  end

  def set_players

    while @player_1.length < 1 do
      p "Player 1 name:"
      @player_1 = gets.chomp.to_s
    end

    while @player_2.length < 1 do
      p "Player 2 name:"
      @player_2 = gets.chomp.to_s
    end

    p "Fine. We have 2 players: #{@player_1} and #{@player_2}"
  end

  def board_new
      puts "        #{@s[:"1"]} | #{@s[:"2"]} | #{@s[:"3"]}
        __|___|___
        #{@s[:"4"]} | #{@s[:"5"]} | #{@s[:"6"]}
        __|___|___
        #{@s[:"7"]} | #{@s[:"8"]} | #{@s[:"9"]}"
  end

  def turn
    players = [@player_1, @player_2]
    player = players.cycle

    roles = ["x", "o"]
    role = roles.cycle 

    p board_new
    n = 0

    while n < 9 do
      
      current_player = player.next # it always starts from player[0] - player_1
      current_role = role.next # x is first

      p "Hey, #{current_player}, choose a sector with #{current_role} - (type number):"
      sector = gets.chomp.to_i
      
      if @s.value?(sector)
        replace_sector_board = @s.each{|k,v| @s[k]=current_role if @s[k] == sector}
        p board_new

        if current_player == @player_1
          @player_1_results << sector
          p "results of #{@player_1}: #{@player_1_results}"
        else
          @player_2_results << sector
          p "results of #{@player_2}: #{@player_2_results}"
        end

      else
        p "Not a valid sector. Try again" #should be the same player
          # current_player = player.next 
          # current_role = role.next 
          n=n-1
      end
      wins
      break if wins.nil? == false
        if @player_1_results.length >= 5
          p "Game over. No winner."
        end
      n=n+1
    end
  end


 
def wins

  fp = ["x", "x", "x"]
  sp = ["o", "o", "o"]

  a = @s.fetch_values(:"1", :"2", :"3")
  b = @s.fetch_values(:"4", :"5", :"6")
  c = @s.fetch_values(:"7", :"8", :"9")
  d = @s.fetch_values(:"1", :"4", :"7")
  e = @s.fetch_values(:"2", :"5", :"8")
  f = @s.fetch_values(:"3", :"6", :"9")
  g = @s.fetch_values(:"1", :"5", :"9")
  h = @s.fetch_values(:"3", :"5", :"7")

  winning_sectors = [a, b, c, d, e, f, g, h]

  if winning_sectors.any? {|sector| sector == fp }
    p "#{@player_1} is a winner"
  elsif winning_sectors.any? {|sector| sector == sp}
    p "#{@player_2} is a winner"
  else
    nil
  end

end

end


b = Game.new("Tic Tac Toe")
b.set_players
b.turn


