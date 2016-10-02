require 'minitest/spec'
require 'minitest/autorun'

require_relative '../board'

describe Board do

  before do
    @board = Board.new()
    @expected_moves = {
        "rook_1" => ["A", "5"],
        "knight_1" => ["C", "4"],
        "bishop_1" => ["F", "5"],
        "pawn_4" => ["D", "3"],
        "king" => ["D", "2"],
        "queen" => ["E", "5"]
    }

    @expected_starting = {
        "rook_1" =>["A","1"],
        "knight_1" => ["A","2"],
        "bishop_1" => ["A","3"],
        "king" => ["A","$"],
        "queen" => ["A", "5"],
        "bishop_2" => ["A", "6"],
        "knight_2" => ["A", "7"],
        "rook_2" => ["A", "8"],
        "pawn_1" => ["B","1"],
        "pawn_2" => ["B","2"],
        "pawn_3" => ["B","3"],
        "pawn_4" => ["B","4"],
        "pawn_5" => ["B","5"],
        "pawn_6" => ["B","6"],
        "pawn_7" => ["B","7"],
        "pawn_8" => ["B","8"]
      }
  end

  after do
    #@board.draw()
  end

  describe "board layout" do
    it "must start with the correct number of elements" do
      @board.layout().length.must_equal 64
    end

    it "must determine rows from indexes correctly" do
      expected_first_row = 0
      expected_second_row = 1
      expected_last_row = 7
      @board.row_number_for(1).must_equal(expected_first_row)
      @board.row_number_for(9).must_equal(expected_second_row)
      @board.row_number_for(63).must_equal(expected_last_row)
    end

    it "must determine a piece's location correctly" do

    end

    it "must move the pieces to the correct spot" do
    end
  end
end
