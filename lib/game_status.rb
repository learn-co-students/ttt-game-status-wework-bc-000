# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Middle row
  [0,4,8],  # Middle row
  [2,4,6],
  [2,5,8],
  [1,4,7],
  [0,3,6]
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
      return combo
    end
  end
  return false
end

def full?(board)
  !(board.include? " ")
end

def draw?(board)
  if (!full?(board))
    return false
  end
  !(won?(board))
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if (draw?(board))
    nil
  elsif won?(board)
    return board[won?(board)[0]]
  end
  nil
end
