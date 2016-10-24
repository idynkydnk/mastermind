module Mastermind
	class Player
    

    @guess = []

    def self.guess
      @guess
    end

    def self.get_guess colors
      puts "Available colors: " + colors.join(", ")
      print "Guess the code: "
      @guess = gets.chomp.split(", ")
    end

    

	end
end
