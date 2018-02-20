# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ]

def won?(board)
  win_export = false
  
  WIN_COMBINATIONS.each do |win_combo|
    win_1 = win_combo[0]
    win_2 = win_combo[1]
    win_3 = win_combo[2]
    win_digit1 = board[win_1]
    win_digit2 = board[win_2]
    win_digit3 = board[win_3]
    win_digits = [win_digit1, win_digit2, win_digit3]
    #puts "#{win_digits}"
    if win_digit1 == win_digit2 && win_digit1 == win_digit3
      if win_digit1 != " "
        win_export = win_combo
      end
    end
  end
  return win_export
end


def full?(board)
  none_space = board.none? {|s| s == " "}
  none_nil = board.none? {|s| s == nil}
  none_empty = board.none? {|s| s == ""}
  full = none_space && none_nil && none_empty
  return full
end


def draw?(board)
  if won?(board) == false
    if full?(board) == true
      return true
    else
      return false
    end
  else
    return false
  end
end


def over?(board)
  if full?(board) == false
    if won?(board) == false
      return false
    else
      return true
    end
  else
    return true
  end
end


def winner(board)
won = won?(board)
  if won == false
    return nil
  else
    i = won[0]
    return board[i]
  end
end

