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
      player_guess = guess.clone
      x = player_guess
      code = @@password
      4.times.each do |i|
        if player_guess[i] == code[i]
          black += 1
          code[i] = 0
          player_guess[i] = 0
        end
      end
      player_guess.delete(0)
      code.delete(0)
      player_guess.each do |i|
        if code.detect {|x| x == i}
          code.delete_at(code.find_index((code.detect {|x| x == i})))
        end
      end
      white = player_guess.length - code.length
      blank_space = code.length
      feedback = {black: black, white: white, blank: code.length}
    end
    

  private


    def black_pegs 
    end

    def white_pegs
    end

    
    
  end
end
