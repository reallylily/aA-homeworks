class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
    puts "Play again?"
    play
  end

  def take_turn
    puts "Simon says.."
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts seq
  end

  def require_sequence
    seq.each do |color|
    guess = gets.chomp
    self.game_over = true unless guess == color
    end
  end

  def add_random_color
    colors = COLORS
    seq << colors.sample
  end

  def round_success_message
    puts 'Round Success!!'
  end

  def game_over_message
    puts 'Game Over!'
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

# simon = Simon.new
# simon.play