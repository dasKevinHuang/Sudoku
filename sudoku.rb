# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
  return board if solved?

  board = populate_board(board_string)
  board.each do |id|

   p board[3]
  end

  return board
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
end
def populate_board(board_string)
  return [
    {id:0, row: 0, column: 0, box: 0, value: '5'},
    {id:1, row: 0, column: 1, box: 0, value: ['1','2','3','4','5','6','7','8','9']},
    {id:2, row: 0, column: 2, box: 0, value: '2'},
    {id:3, row: 0, column: 3, box: 1, value: '3'},
    {id:4, row: 0, column: 4, box: 1, value: '4'},
    {id:5, row: 0, column: 5, box: 1, value: ['1','2','3','4','5','6','7','8','9']},
    {id:6, row: 0, column: 6, box: 2, value: '7'},
    {id:7, row: 0, column: 7, box: 2, value: '8'},
    {id:8, row: 0, column: 8, box: 2, value: ['1','2','3','4','5','6','7','8','9']},
    {id:9, row: 0, column: 0, box: 0, value: '7'},
    {id:10, row: 1, column: 1, box: 0, value: ['1','2','3','4','5','6','7','8','9']},
    {id:11, row: 1, column: 2, box: 0, value: ['1','2','3','4','5','6','7','8','9']},
    {id:12, row: 1, column: 3, box: 1, value: ['1','2','3','4','5','6','7','8','9']},
    {id:13, row: 1, column: 4, box: 1, value: ['1','2','3','4','5','6','7','8','9']},
    {id:14, row: 1, column: 5, box: 1, value: ['1','2','3','4','5','6','7','8','9']},
    {id:15, row: 1, column: 6, box: 2, value: ['1','2','3','4','5','6','7','8','9']},
    {id:16, row: 1, column: 7, box: 2, value: ['1','2','3','4','5','6','7','8','9']},
    {id:17, row: 1, column: 8, box: 2, value: ['1','2','3','4','5','6','7','8','9']},
    ]
end
