# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  ["X","O"].each do |token|
    WIN_COMBINATIONS.each do |pattern|
      if pattern.all?{|entry| board[entry] == token} then
        return pattern
      end
    end
  end
  return false
end
        
def full?(board)
  board.all? do |entry|
    entry == "X" || entry == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return TRUE
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return TRUE
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]