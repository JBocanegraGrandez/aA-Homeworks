class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      4.times {  cup << :stone unless i == 6 || i == 13 }
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 12 || start_pos < 0
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    current_stones = self.cups[start_pos]
    self.cups[start_pos] = []

    i = start_pos + 1
    until current_stones.empty?
      if self.cups[i % 14] == self.cups[6]
        @cups[6] << current_stones.pop if current_player_name == @name1
      elsif self.cups[i % 14] == self.cups[13]
        @cups[13] << current_stones.pop if current_player_name == @name2
      else
      self.cups[i % 14] << current_stones.pop
      end
      i += 1
    end
    render
    next_turn((i-1) % 14)

  end

  def next_turn(ending_cup_idx)
    #fix second return (hardcoding?)
    return :switch if self.cups[ending_cup_idx].count == 1
    return :prompt if self.cups[ending_cup_idx] == self.cups[6] || self.cups[ending_cup_idx] == self.cups[13]
    return ending_cup_idx if !self.cups[ending_cup_idx].empty?
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    self.cups[0..5].all?{ |cup| cup.empty?} || self.cups[7..12].all?{ |cup| cup.empty?}
  end

  def winner
    if self.cups[6] == self.cups[13]
      return :draw
    elsif self.cups[6].count > self.cups[13].count
      return @name1
    else
      return @name2
    end
  end
end
