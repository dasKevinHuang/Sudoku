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
  broken = board.scan(/.{1,9}/).join("\n")
  spaced = broken.gsub(/(.{1})(?=.)/, '\1 \2')
  return spaced
end

def populate_board(board_string)
	board = []

	board_string.chars.each_index do |index|
		item_value = board_string[index]
		item_row = (index / 9)
		item_column = (index % 9)
		item_box = ((item_row / 3) * 3) + (item_column / 3)

		if item_value == '-'
			item_value = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
		else
			item_value = [item_value]
		end

		item_properties = {
			id: index,
			row: item_row, 
			column: item_column, 
			box: item_box,
			value: item_value
		}

		board.push(item_properties)
	end
	# puts "Cell 2..."
	# puts board[2]
	# puts
	# puts "Cell 4..."
	# puts board[4]
	board

# takes an array and id
# iterate over the array
# if the id in the array matches the argument id
# return the value of the id as an array
def get_value(array, id)
  array.each  do|x|
    if x[:id] == id
      return x[:value] = [x[:value]]
    end
  end
end

# takes an array, id, and value
# iterate over the array
# if the id in the array matches the argument id
# replace the current value with the argument value as an array
def set_value(array, id, val)
  array.each  do|x|
    if x[:id] == id
      return x[:value] = [val]
    end
  end
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

def process_cell(board, id)
	if board[id][:value].is_a? Array
		board[id][:value].each do |number|
			if (check_column?(board, board[id][:column], number) || check_row?(board, board[id][:row], number) || check_box?(board, board[id][:box], number))
				board[id][:value].delete(number)
			end
		end
		p board[id][:value]
		if board[id][:value].size == 1
			return board[id][:value][0]
		end
	end
end
