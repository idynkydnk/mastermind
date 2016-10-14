require_relative "spec_helper"

module Mastermind		
	describe Peg do
		
		context "#initialize" do
      it "is initialized with a value of '' by default" do
        peg = Peg.new("brown")
        expect(peg.color).to eq("brown")
      end
    end


	end
end