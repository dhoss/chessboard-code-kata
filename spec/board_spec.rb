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

    it "maps x/y coordinates correctly" do
      ("A".."H").each_with_index do |l, i|
        @board.to_x_coord(l).must_equal(i)
      end
      (1..8).each_with_index do |n, i|
        @board.to_y_coord(n).must_equal(i)
      end
    end

    it "must move the pieces to the correct spot" do
      old_layout = @board.layout()
      expected_moves = {
        "rook_1" => ["A", "5"],
        "knight_1" => ["C", "4"],
        "bishop_1" => ["F", "5"],
        "pawn_4" => ["D", "3"],
        "king" => ["D", "2"],
        "queen" => ["E", "5"]
      }

      ## make sure the pieces get moved to their new spots correctly
      expected_moves.each do |k,v|
        x = @board.to_x_coord(v[0])
        y = @board.to_y_coord(v[1])
        display_name = @board.display_name(k)
        @board.move(k).to(v[0], v[1])
        @board.layout()[x][y].must_equal(display_name)

        ## also make sure that the pieces' original positions are vacant
        sp = @board.starting_positions_by_key()[k]
        old_layout[sp[0]][sp[1]].must_equal('.')
      end
    end
  end
end
