require_relative 'cell'
require_relative 'ui'
require_relative 'feedback_cell'
require_relative 'computer'
require_relative 'player'


module Mastermind

  $colors = ["blue", "green", "purple", "red", "yellow", "Orange"]
	class Board
      


    def initialize
      @cells = []
      @feedback_cells = []
      @colors = ["blue", "green", "purple", "red", "yellow", "Orange"]
      set_new_board
    end

    def play
      if UI.who_is_the_creator == "computer"
        computer_is_creator_play
      else
        player_is_creator_play
      end
    end

    






    def player_is_creator_play
      feedback = {black: 0, white: 0, blank: 4}
      code = UI.get_code(@colors)
      code = code.split(", ")
      guess = []
      UI.code_is_set(code)
      2.times do |guess_count|
        UI.draw_board(@cells, @feedback_cells)
        guess = Computer.get_guess(feedback, guess)
        UI.computer_guess(guess)
        feedback = Player.get_feedback
        if feedback[:black] == 4
          UI.winner
        end
        update_board(feedback, guess, guess_count)
      end


    end

    









    def computer_is_creator_play
      Computer.choose_password(@colors)
      12.times do |guess_count|
        UI.draw_board(@cells, @feedback_cells)
        Player.get_guess(@colors)
        if Computer.check_guess(Player.guess)
          UI.winner
        else
          update_board(Computer.get_feedback(Player.guess), Player.guess, guess_count)
        end
      end
      puts "You lose!"
    end


    def set_new_board
      (1..48).each { |n| @cells << Cell.new("")}
      (1..48).each { |n| @feedback_cells << FeedbackCell.new("_")}
    end

    def update_board feedback, guess, guess_count
      feedback_to_display = randomize_feedback(feedback)
      guess_to_display = shorten_colors(guess)
      x = guess_count * 4
      4.times do |i|
        @cells[i+x].color = guess_to_display[i]
        @feedback_cells[i+x].value = feedback_to_display[i]  
      end
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
