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

    
    
  end
end
