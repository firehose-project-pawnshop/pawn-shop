require 'rails_helper'

RSpec.describe Pawn, type: :model do
  before :each do
    @game = Game.new
    @game.pieces.each(&:delete)
    @white_pawn = Pawn.create(
      x_coordinate: 2,
      y_coordinate: 2,
      game: @game,
      color: "white"
    )
  end

  describe "valid move for Pawn piece" do

     it "should return false if move is out of the board" do
      expect(@white_pawn.valid_move?(2,10)).to eq false
    end


    it "should return true if Pawn moves one square vertically" do
      expect(@white_pawn.valid_move?(2, 3)).to eq true
    end

    it "should return false if Pawn moves more than one square" do
      expect(@white_pawn.valid_move?(2,6)).to eq false
    end

     it "should return true if Pawn moves two squares on first turn" do
      expect(@white_pawn.valid_move?(2,4)).to eq true
    end


    it "should return false if Pawn moves two squares on second turn" do
      @white_pawn = Pawn.create(
        x_coordinate: 2,
        y_coordinate: 4,
        game: @game,
        color: "white"
        )
      expect(@white_pawn.valid_move?(2,6)).to eq false
    end

    it "should return false if White Pawn moves backward" do
      expect(@white_pawn.valid_move?(2,1)).to eq false
    end

    it "should return false if Pawn moves horizontally" do
      expect(@white_pawn.valid_move?(5,2)).to eq false
    end



    # it "should return false if Pawn stays in one place" do
    #   expect(@white_pawn.valid_move?(2,2)).to eq false
    # end

    # it "should return false if King moves more than one square in one direction" do
    #   expect(@white_king.valid_move?(3,7)).to eq false
    # end

  end


end