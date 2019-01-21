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
      self.take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
      show_sequence
      check_seq = require_sequence
      round_success_message
      @sequence_length += 1
  end

  def show_sequence
    add_random_color
    @seq.join(" ")
  end 

  def require_sequence
    puts "Enter the sequence of colors"
    @seq.each do |char|
      input = gets.chomp
      if input != char
        @game_over = true
      end
    end
    @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You entered the correct sequence! Increasing sequence by 1"
  end

  def game_over_message
    puts "Sequence was incorrect! The correct sequence was #{@seq.join(" ")}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

end
