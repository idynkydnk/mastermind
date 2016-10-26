require_relative "spec_helper"

module Mastermind		
	describe Board do
		
		context "#initialize" do
      it "is initializes a board with 40 cells" do
        board = Board.new
        expect(board.cells.size).to eq 40
      end
    end

    context "#update_board" do
      it "updates the board with new cells and feedback" do
        board = Board.new


      end
    end



	end
end