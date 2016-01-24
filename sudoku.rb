# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
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

def check_column?(board, col, num)
	board.each do |cell|
		if cell[:column] == col
			if cell[:value] == num
				return true
			end
		end
	end
	return false
end

def check_row?(board, row, num)
	board.each do |cell|
		if cell[:row] == row
			if cell[:value] == num
				return true
			end
		end
	end
	return false
end

def check_box?(board, box, num)
	board.each do |cell|
		if cell[:box] == box
			if cell[:value] == num
				return true
			end
		end
	end
	return false
end