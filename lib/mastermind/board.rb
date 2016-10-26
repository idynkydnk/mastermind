require_relative 'cell'
require_relative 'ui'
require_relative 'feedback_cell'
require_relative 'computer'
require_relative 'player'


module Mastermind
	class Board

    attr_reader :cells

		def initialize
      @cells = []
      @feedback_cells = []
      @colors = ["blue", "green", "purple", "red", "yellow", "orange"]
      puts "initialixed!"

      set_new_board
    end

    def play
      UI.draw_board(@cells, @feedback_cells)
      Computer.choose_password(@colors)
      puts Computer.password
      Player.get_guess(@colors)
      if Computer.check_guess(Player.guess)
        puts "You got it!"
      else
        update_board(Computer.get_feedback(Player.guess), Player.guess)
      end
    end

    def set_new_board
      (1..40).each { |n| @cells << Cell.new("")}
      (1..40).each { |n| @feedback_cells << FeedbackCell.new("_")}
    end

    def update_board feedback, guess
      feedback_to_display = randomize_feedback(feedback)
      guess_to_display = shorten_colors(guess)

      print feedback_to_display
      puts
      print guess_to_display

      4.times do |i|
        @cells[i].color = guess[i]
        @feedback_cells[i].value = feedback[i]
        
      end
      
      # for i = 0 to 3
      # @cells[i+x].color = guess[x]


      # UI.draw_board(@cells, @feedback_cells)
      # add 4 every time this is called

    end

    def randomize_feedback feedback
      
      converted_feedback = []
      converted_feedback << "B" * feedback[:black]
      converted_feedback << "W" * feedback[:white]
      converted_feedback << "_" * feedback[:blank]
      converted_feedback = converted_feedback.join
      converted_feedback = converted_feedback.split("")
      converted_feedback.shuffle!

    end

    def shorten_colors guess
      short_guess = []
      i = 0
      guess.each do |x|
        short_guess[i] = x[0].upcase
        i += 1
      end
      short_guess
    end





	end
end
