require_relative "spec_helper"

module Mastermind		
	describe Board do
		
		context "#initialize" do
      it "is initializes a board with 40 cells" do
        board = Board.new
        expect(board.cells).to eq []
      end
    end


	end
end