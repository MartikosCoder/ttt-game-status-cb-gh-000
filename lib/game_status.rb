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
  [2, 4, 6]
]

def full?(board)
  return board.all? { |e| e != " " }
end

def won?(board)
  if full?(board) || board.all? { |e| e == " "}
    return false
  end

  WIN_COMBINATIONS.each do | win_combination |
    if (win_combination.all? { |e| board[e] == "X" }) || (win_combination.all? { |e| board[e] == "O" })
      return win_combination
    end
  end

  return false
end

def draw?(board)
  if won?(board)
    return false
  end

  return true
end


def over?(board)
  return full?(board) || won?(board)
end

def winner(board)
  if !won?(board)
    return nil
  end

  token = won?(board)
  return board[token[0]]
end
