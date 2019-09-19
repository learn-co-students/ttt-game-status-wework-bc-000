# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def draw?(board)
  full?(board) && (not won?(board))    
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    all_x = win_combo.all? do |position|
      board[position] == "X"
    end
    all_o = win_combo.all? do |position|
      board[position] == "O"
    end
    if all_x && all_o
      return false
    elsif all_x || all_o
      return win_combo
    end
  end
  return false
end

def over?(board)
  won?(board) || draw?(board)
end

def full?(board)
  not board.include?(" ")
end

def winner(board)
  win_combo = won?(board)
  if win_combo
    return board[win_combo[0]]
  end
end