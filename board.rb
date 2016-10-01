class Board

  def initialize
    @grid = Array.new(8,".").map{|row| Array.new(8, ".")}
  end

  def starting_positions_by_key
    return {
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
  end

  def starting_positions_by_coords
    return starting_positions_by_key().invert
  end

  def display_name(key)
    names = {
      "rook_1" =>"R",
      "knight_1" => "+",
      "bishop_1" => "B",
      "king" => "K",
      "queen" => "Q",
      "bishop_2" => "B",
      "knight_2" => "+",
      "rook_2" => "R",
      "pawn_1" => "P",
      "pawn_2" => "P",
      "pawn_3" => "P",
      "pawn_4" => "P",
      "pawn_5" => "P",
      "pawn_6" => "P",
      "pawn_7" => "P",
      "pawn_8" => "P"
    }

    return names[key]
  end

  def init_pieces()
    starting_positions_by_coords().each do |k,v|
      @grid[k[0]][k[1]] = display_name(v)
    end
  end

  def draw
    x_labels = ["A", "B", "C", "D", "E", "F", "G", "H"]
    y_labels = ["1", "2", "3", "4", "5", "6", "7", "8"]
    print "\t", x_labels.join("\t"), "\n"
    print "\t", "-\t" * 8, "\n"
    @grid.each_with_index do |grid, i|
      print "#{y_labels[i]}|\t", grid.join("\t"), "\n"
    end
  end

  def move(piece)
    return pieces(piece)
  end

  def pieces(piece)
    pieces = {
      "king" => "K",
      "queen" => "Q",
      "rook" => "R",
      "bishop" => "B",
      "knight" => "+",
      "pawn" => "p"
    }

    return pieces[piece]
  end

  # return grid unless updates are passed in
  def layout
    return @grid
  end
end
