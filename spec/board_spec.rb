require_relative "spec_helper"

module Mastermind		
	describe Board do
		
		context "#initialize" do
      it "is initialized with a value of {} by default" do
        board = Board.new
        expect(board.grid).to eq {}
      end
    end


	end
end