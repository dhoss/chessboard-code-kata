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
      0.upto(63){|index|
        expected = (index/8).floor
        @board.row_number_for(index).must_equal(expected)
      }
    end

    it "must determine columns from indexes correctly" do
      0.upto(63){|index|
        row = (index/8).floor
        expected = index - row * 8
        @board.column_number_for(index).must_equal(expected)
      }
    end

    it "must map correctly" do
      expected = {
       'A1' => 0,
       'A2' => 1,
       'A3' => 2,
       'A4' => 3,
       'A5' => 4,
       'A6' => 5,
       'A7' => 6,
       'A8' => 7,
       'B1' => 8,
       'B2' => 9,
       'B3' => 10,
       'B4' => 11,
       'B5' => 12,
       'B6' => 13,
       'B7' => 14,
       'B8' => 15,
       'C1' => 16,
       'C2' => 17,
       'C3' => 18,
       'C4' => 19,
       'C5' => 20,
       'C6' => 21,
       'C7' => 22,
       'C8' => 23,
       'D1' => 24,
       'D2' => 25,
       'D3' => 26,
       'D4' => 27,
       'D5' => 28,
       'D6' => 29,
       'D7' => 30,
       'D8' => 31,
       'E1' => 32,
       'E2' => 33,
       'E3' => 34,
       'E4' => 35,
       'E5' => 36,
       'E6' => 37,
       'E7' => 38,
       'E8' => 39,
       'F1' => 40,
       'F2' => 41,
       'F3' => 42,
       'F4' => 43,
       'F5' => 44,
       'F6' => 45,
       'F7' => 46,
       'F8' => 47,
       'G1' => 48,
       'G2' => 49,
       'G3' => 50,
       'G4' => 51,
       'G5' => 52,
       'G6' => 53,
       'G7' => 54,
       'G8' => 55,
       'H1' => 56,
       'H2' => 57,
       'H3' => 58,
       'H4' => 59,
       'H5' => 60,
       'H6' => 61,
       'H7' => 62,
       'H8' => 63
      }

      expected.each do |k,v|
        @board.position_map()[k].must_equal(v)
      end

    end

    it "must determine a piece's location correctly" do

    end

    it "must move the pieces to the correct spot" do
    end
  end
end
