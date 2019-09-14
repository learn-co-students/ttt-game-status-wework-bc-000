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
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def won?(board)
    WIN_COMBINATIONS.each do |combineation|
      if combineation.any? { |pos| position_taken?(board,pos) }
        if board[combineation[0]] == board[combineation[1]] && board[combineation[1]] == board[combineation[2]]
          return combineation
        end
      end
    end
    return false
  end
  
  def full?(board)
    return board.all? {|pos| !(pos.nil? || pos == " ")}
  end
  
  def draw?(board)
    if won?(board) == false && full?(board) == true
      return true
    else
      return false
    end
  end
  
def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  comb = won?(board)
  if comb != false
    return board[comb[0]]
  end
end