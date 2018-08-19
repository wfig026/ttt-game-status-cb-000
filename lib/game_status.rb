# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # lef column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left to right diagonal
  [2,4,6]  # right to left diagonal
]
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if win_combination.all? do |win_index|
      board[win_index] == "X"
    end
      true
    elsif win_combination.all? do |win_index|
      board[win_index] == "O"
    end
      true
    else
      false
    end
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    true
  end
end

def over?(board)
  if won?(board) != nil || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != nil
    board[won?(board).detect {|index| board[index] == "X" || board[index] == "O"}]
  else
    nil
  end
end
