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
      @guesses = []
      @colors = ["blue", "green", "purple", "red", "yellow", "orange"]
      puts "initialixed!"

      set_new_board
    end

    def play
      UI.draw_board(@cells, @feedback_cells)
      Computer.choose_password(@colors)
      puts Computer.password
      Player.get_guess(@colors)
      @guesses << Player.guess
      puts @guesses



    end

    def set_new_board
      (1..40).each { |n| @cells << Cell.new("")}
      (1..40).each { |n| @feedback_cells << FeedbackCell.new("_")}
    end

	end
end
