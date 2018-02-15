# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [6,4,2]
                   ]

def won?(board)
  if(board.reject{|box|box=="X" || box=="O"}.size == 9)
    return false
  else
    WIN_COMBINATIONS.each { |combo|
      if((board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]) && board[combo[0]] != " ")
        return combo
      end
    }
    return false
  end
end

def full?(board)
    if(board.select{|box|box=="X" || box=="O"}.size == 9)
        return true
    end
    return false
end

def draw?(board)
    match = false
    WIN_COMBINATIONS.each { |combo|
      if((board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]) && board[combo[0]] != " ")
        match = true
      end
    }
    if(match == false)
      if(board.select{|box|box=="X" || box=="O"}.size == 9)
        return true
      end
    end
    return false  
end

def over?(board)
  if(draw?(board))
    return true
  elsif(won?(board))
    return true
  elsif(!full?(board))
    return false
  end
end

def winner(board)
  result = won?(board)
  if(result)
    return board[result[0]]
  else
    return nil
  end
end

board = Array.new(9,' ')
board[6]="X"
board[7]="X"
board[8]="X"
puts winner(board)