# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [2,5,8],
  [1,4,7],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  xs = find_indexes(board, "X")
  os = find_indexes(board, "O")
  WIN_COMBINATIONS.find { |arr| (arr - xs).empty? || (arr - os).empty? }
end

def find_indexes(board, x_o)
  board.map.with_index { |o, i|
    if o == x_o
      i
    else
      -1
    end
  }.select do |cell|
    cell != -1
  end  
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  if !won?(board).nil?
    false
  elsif won?(board).nil?
    full?(board)
  end  
end

def over?(board)
  !won?(board).nil? || draw?(board) || full?(board)
end

def winner(board)
  w = won?(board)
  if (w.nil?)
    nil
  else  
    board[w[0]]
  end
end