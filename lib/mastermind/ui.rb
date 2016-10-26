module Mastermind
  class UI

    def self.draw_board(cells, feedback_cells)
      i = 0
      cells.each_slice(4) do |main_row|
        main_row.each do |cell|
          if cell.color != ""
            print " " + cell.color + " "
          else
            print " __ "
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

    def ask_for_guess

    end

    
    
  end
end
