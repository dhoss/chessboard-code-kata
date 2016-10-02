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
  end

  def draw

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

end
