class Board

  ROWS = 8
  COLUMNS = 8
  BOARD_SIZE = ROWS*COLUMNS

  def initialize
    @grid = Array.new(64, "[ ]")
    @names = {
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
    @positions = piece_map()
  end

  def piece_names
    return @names
  end

  def piece_map()
    return {
      "rook_1" =>"A1",
      "knight_1" => "A2",
      "bishop_1" => "A3",
      "king" => "A4",
      "queen" => "A5",
      "bishop_2" => "A6",
      "knight_2" => "A7",
      "rook_2" => "A8",
      "pawn_1" => "B1",
      "pawn_2" => "B2",
      "pawn_3" => "B3",
      "pawn_4" => "B4",
      "pawn_5" => "B5",
      "pawn_6" => "B6",
      "pawn_7" => "B7",
      "pawn_8" => "B8"
    }
  end

  def draw
    starting = 0
    length = 8
    1.upto(8){|i|
      print "#{i}\t", @grid.slice(starting, length).join("\t"), "\n"
      starting += length
    }
    print "\t", [*("A".."H")].join("\t"), "\n"
  end

  def init
    piece_map().each do |k,v|
      index = position_map()[v]
      @grid[index] = @names[k]
    end
  end

  def layout
    return @grid
  end

  def row_number_for(index)
    return (index / ROWS).floor
  end

  def column_number_for(index)
    row = row_number_for(index)
    return index - row * COLUMNS
  end

  def position_map
    map = {}
    board_index = 0
    ("A".."H").each_with_index do |letter, i|
      0.upto(7){|index|
        key = "#{letter}#{index+1}"
        map[key] = board_index
        board_index += 1
      }
    end

    return map
  end

end
