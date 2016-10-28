module Mastermind
  class UI

    def self.draw_board(cells, feedback_cells)
      i = 0
      cells.each_slice(4) do |main_row|
        main_row.each do |cell|
          if cell.color != ""
              print " " + cell.color + " "
          else
            print " _ "
          end
        end
        print "    "
        4.times do
          print feedback_cells[i].value
          i += 1
        end
        print "\n"
      end
    end

    def self.who_is_the_creator
      puts "Would you like to be the guesser or creator?"
      puts "1. Guesser"
      puts "2. Creator"
      choice = gets.chomp
      if choice == "1"
        return "computer"
      elsif choice == "2"
        return "player"
      else
        puts "All you had to do was pick 1 or 2."
      end
    end

    def self.winner
      puts "We have a winner! Congrats!"
      exit
    end

    def self.get_code colors
      puts "Available colors: " + colors.join(", ")
      puts "What's your code?"
      code = gets.chomp
    end

    def self.code_is_set code
      puts "The code has been set to " + code.join(", ")
    end

    def self.computer_guess guess
      puts "The computer has guessed " + guess.join(", ")
    end


    
  end
end
