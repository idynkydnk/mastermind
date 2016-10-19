module Mastermind
  class Computer

    @@password = []

    def self.password
      @@password
    end

    def self.choose_password colors
      (0..3).each do |i|
        @@password[i] = colors.sample
      end
    end

    def self.check_guess guess
      if guess == @@password
        return true
      else
        false
      end
    end

    def self.get_feedback guess
      black = 0
      white = 0
      code = @@password
      4.times.each do |i|
        puts i
        if guess[i] == code[i]
          black += 1
          code[i] = 0
          guess[i] = 0
        end
      end
      puts guess
      puts code
      puts black
    end
    

  private


    def black_pegs 
    end

    def white_pegs
    end

    
    
  end
end
