module Mastermind
	class Board
		def initialize
      puts "initialixed!"
      @colors = ["blue", "green", "purple", "red", "yellow", "black"]
      @password = define_password
    end

    def define_password
      password = Array.new(4){Cell.new(@colors.sample)}
      puts password.to_s
    end
		
	end
end
