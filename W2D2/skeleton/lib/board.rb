class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new(4, :stone)}
    empty_stores
    # p cups.map(&:count)
  end

  def empty_stores
    cups[6] = []
    cups[13] = []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 13
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    hand = []
    pos = start_pos
    hand << cups[start_pos].pop until cups[start_pos].empty?
    until hand.empty?
      pos += 1
      pos = pos % 14
      unless (pos == 13 && current_player_name == name1) || (pos == 6 && current_player_name == name2)
        cups[pos] << hand.pop 
      end
    end
    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 13 || ending_cup_idx == 6
    cups[ending_cup_idx].count == 1 ? :switch : ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    empty_side?(0,5) || empty_side?(7,12)
  end

  def empty_side?(i,j)
    counts = cups[i..j].map do |cup|
      cup.count
    end
    counts.sum == 0
  end

  def winner
    case cups[13].count <=> @cups[6].count
    when 0
      :draw
    when 1
      name2
    else
      name1
    end
  end
end
