

class Game
  attr_reader :board, :player_1, :player_2

  def initialize(board)
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
    @board = board
    @player_1_results = []
    @player_2_results = []
    
    @player_1 = player_1
    @player_2 = player_2
  end

  def name
    p "Player 1 name:"
    @player_1 = gets.chomp

    p "Player 2 name:"
    @player_2 = gets.chomp

    p "Fine. We have 2 players: #{@player_1} and #{@player_2}"
  end

  def board_new
     puts "        #{@s[:"1"]} | #{@s[:"2"]} | #{@s[:"3"]}
        __|___|___
        #{@s[:"4"]} | #{@s[:"5"]} | #{@s[:"6"]}
        __|___|___
        #{@s[:"7"]} | #{@s[:"8"]} | #{@s[:"9"]}"
  end

  def board
    @board = board_new
  end

  def turn
    players = [@player_1, @player_2]
    player = players.cycle

    roles = ["x", "o"]
    role = roles.cycle 

    p board
    n = 0

    while n < 9 do
      
      current_player = player.next # it always starts from player[0] - player_1
      current_role = role.next # x is first

      p "Hey, #{current_player}, choose a sector with #{current_role} - (type number):"
      sector = gets.chomp.to_i
      
      if @s.value?(sector)
        replace_sector_board = @s.each{|k,v| @s[k]=current_role if @s[k] == sector}
        p board
        if current_player == @player_1
          @player_1_results << sector
          p "results of #{@player_1}: #{@player_1_results}"
        else
          @player_2_results << sector
          p "results of #{@player_2}: #{@player_2_results}"
        end
      else
        p "Not a valid sector. Try again" #should be the same player
          current_player = player.next 
          current_role = role.next 
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
  #sp = ["o", "o", "o"]

  a = @s.fetch_values(:"1", :"2", :"3")
  b = @s.fetch_values(:"4", :"5", :"6")
  c = @s.fetch_values(:"7", :"8", :"9")
  d = @s.fetch_values(:"1", :"4", :"7")
  e = @s.fetch_values(:"2", :"5", :"8")
  f = @s.fetch_values(:"3", :"6", :"9")
  g = @s.fetch_values(:"1", :"5", :"9")
  h = @s.fetch_values(:"3", :"5", :"7")

  if a.all?{|el| el == a[0]}
      p "We have a winner"
      if a == fp 
        p "#{@player_1} is a winner"
      else
        p "#{@player_2} is a winner"
      end
    elsif b.all?{|el| el == b[0]}
      p "We have a winner"
      if b == fp 
        p "#{@player_1} is a winner"
      else
        p "#{@player_2} is a winner"
      end
    elsif c.all?{|el| el == c[0]}
      p "We have a winner"
      if c == fp 
        p "#{@player_1} is a winner"
      else
        p "#{@player_2} is a winner"
      end
    elsif d.all?{|el| el == d[0]}
      p "We have a winner"
      if d == fp
        p "#{@player_1} is a winner"
      else
        p "#{@player_2} is a winner"
      end
    elsif e.all?{|el| el == e[0]}
      p "We have a winner"
      if e == fp
        p "#{@player_1} is a winner"
      else
        p "#{@player_2} is a winner"
      end
    elsif f.all?{|el| el == f[0]}
      p "We have a winner"
      if f == fp
        p "#{@player_1} is a winner"
      else
        p "#{@player_2} is a winner"
      end
    elsif g.all?{|el| el == g[0]}
      p "We have a winner"
      if g == fp
        p "#{@player_1} is a winner"
      else
        p "#{@player_2} is a winner"
      end
    elsif h.all?{|el| el == h[0]}
      p "We have a winner"
      if h == fp 
        p "#{@player_1} is a winner"
      else
        p "#{@player_2} is a winner"
      end
    else
      nil
  end
end
 
end


b = Game.new("Tic Tac Toe")
b.name
b.turn



