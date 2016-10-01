require 'minitest/spec'
require 'minitest/autorun'

require_relative '../board'

describe Board do

  before do
    @board = Board.new()
  end

  after do
    @board.draw()
  end

  describe "board layout" do
    it "must start with the correct dimensions" do
      @board.layout()[0].length.must_equal 8
      @board.layout()[1].length.must_equal 8
    end

    it "must start the pieces in the right spot" do
      @board.init_pieces()
      layout = @board.layout()
      expected_starting = {
        "rook_1" =>[0,0],
        "knight_1" => [0,1],
        "bishop_1" => [0,2],
        "king" => [0,3],
        "queen" => [0, 4],
        "bishop_2" => [0, 5],
        "knight_2" => [0, 6],
        "rook_2" => [0, 7],
        "pawn_1" => [1,0],
        "pawn_2" => [1,1],
        "pawn_3" => [1,2],
        "pawn_4" => [1,3],
        "pawn_5" => [1,4],
        "pawn_6" => [1,5],
        "pawn_7" => [1,6],
        "pawn_8" => [1,7]
      }
      expected_starting.each do |k,v|
        layout[v[0]][v[1]].must_equal @board.display_name(k)
      end
    end

    it "must move the pieces to the correct spot" do
      skip("not implemented")
      @board.move("knight").to("B", "7")
      @board.layout()[1][7].must_equal("K")
    end
  end
end
