require_relative "spec_helper"

module Mastermind   
  describe FeedbackCell do
    
    context "#initialize" do
      it "is initialized with a value of '' by default" do
        cell = FeedbackCell.new
        expect(cell.color).to eq("")
      end

      it "can be initialized with a color" do
        cell = FeedbackCell.new("black")
        expect(cell.color).to eq("black")
      end
    end
  
  end
end