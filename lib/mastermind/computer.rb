module Mastermind
  class Computer

    @@password = []
    @feedback = []
    @guesses = 0
    @possible_codes =*("0000".."5555")

    def self.password
      @@password
    end

    def self.feedback
      @feedback
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
      code = @@password.clone
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
      @feedback = {black: black, white: white, blank: code.length}
    end

    def self.get_guess feedback, previous_guess
      guess = []
      if previous_guess == []
        guess << $colors[0] << $colors[0] << $colors[1] << $colors[1]
        return guess
      end
      not_possible = not_possible_codes(feedback, previous_guess)
      remove_impossible_codes(not_possible)
      number_guess = @possible_codes[0]
      guess = convert_numbers_to_colors(number_guess)
      @guesses += 1
      guess
    end

    def self.convert_numbers_to_colors number_guess
      guess = []

      (0..3).each do |x|
        case number_guess[x]
        when "0"
          guess << $colors[0]
        when "1"
          guess << $colors[1]
        when "2"
          guess << $colors[2]
        when "3"
          guess << $colors[3]
        when "4"
          guess << $colors[4]
        when "5"
          guess << $colors[5]      
        end
      end
      guess
    end

    def self.not_possible_codes(feedback, guess)
      not_possible = {one: "", two: "", three: "", four: ""}
      case feedback[:black]
      when 0
        not_possible[:one] << guess[0]
        not_possible[:two] << guess[1]
        not_possible[:three] << guess[2]
        not_possible[:four] << guess[3]
      end
      # go through available codes one by one and see if they reuturn the same feedback

      not_possible
    end

    def self.remove_impossible_codes not_possible
      impossible_numbers = colors_to_numbers(not_possible)
      @possible_codes.delete_if {|x| x[0].to_i == impossible_numbers[0] }
      @possible_codes.delete_if {|x| x[1].to_i == impossible_numbers[1] }
      @possible_codes.delete_if {|x| x[2].to_i == impossible_numbers[2] }
      @possible_codes.delete_if {|x| x[3].to_i == impossible_numbers[3] }
    end

    def self.colors_to_numbers impossible_colors
      impossible_numbers = []
      i = [:one, :two, :three, :four]
      i.each do |x|
        case impossible_colors[x]
        when $colors[0]
          impossible_numbers << 0
        when $colors[1]
          impossible_numbers << 1
        when $colors[2]
          impossible_numbers << 2
        when $colors[3]
          impossible_numbers << 3
        when $colors[4]
          impossible_numbers << 4
        when $colors[5]
          impossible_numbers << 5                        
        end
      end
      impossible_numbers
    end

    
    
  end
end
