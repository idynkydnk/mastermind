module Mastermind
	class Player
    

    @guess = []
    @code = []

    def self.guess
      @guess
    end

    def self.code
      @code
    end

    def self.code=(code)
      @code
    end

    def self.get_guess colors
      puts "Available colors: " + colors.join(", ")
      print "Guess the code: "
      @guess = gets.chomp.split(", ")
    end

    def set_code
      UI.get_code
    end

    def self.get_feedback
      puts "How many black pegs?"
      black = gets.chomp
      puts "How many white pegs?"
      white = gets.chomp
      puts "How many blank spaces?"
      blank = gets.chomp
      feedback = {black: black.to_i, white: white.to_i, blank: blank.to_i}
    end


	end
end
