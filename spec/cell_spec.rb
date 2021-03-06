require_relative "spec_helper"

module Mastermind		
	describe Cell do
		
		context "#initialize" do
      it "is initialized with a value of '' by default" do
        cell = Cell.new
        expect(cell.color).to eq("")
      end

      it "can be initialized with a color" do
        cell = Cell.new("Purple")
        expect(cell.color).to eq("Purple")
      end
    end
  
  end
end