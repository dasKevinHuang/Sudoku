# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
  # return board if solved?

  board = populate_board(board_string
    i = 0
  while !completed?(board) && i != 20
    board.each do |cell|
      process_cell(board, cell[:id])
      i += 0
    end
  end
  board
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  
  9.times do |row_id|
    return false if check_row?(board, row_id) == false
  end

  9.times do |column_id|
    return false if check_column?(board, column_id) == false
  end

  9.times do |box_id|
    return false if check_box?(board, box_id) == false
  end
  
  return true 
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
  board_string = ''

  board.each do |cell|
    board_string += cell[:value].first.to_s
  end  

  broken = board_string.scan(/.{1,9}/).join("\n")
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
end

# takes an array and id
# iterate over the array
# if the id in the array matches the argument id
# return the value of the id as an array
def get_value(array, id)
  array.each  do|x|
    if x[:id] == id
      return x[:value]
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

def completed?(array)
  array.each do |x|
    return false if x[:value].length != 1
  end
  true
end

# def check_column?(board, col, num)
# 	board.each do |cell|
# 		if cell[:column] == col
# 			if cell[:value] == num
# 				return true
# 			end
# 		end
# 	end
# 	return false
# end

# def check_row?(board, row, num)
# 	board.each do |cell|
# 		if cell[:row] == row
# 			if cell[:value] == num
# 				return true
# 			end
# 		end
# 	end
# 	return false
# end

def check_row?(board, row_id)
  control_array = ["1","2","3","4","5","6","7","8","9"]
  row_cells = []
  test_array = []

  row_cells = board.find_all { |i| i[:row] == row_id }
  row_cells.each do |cell|
    test_array.push(cell[:value].first)
  end
  return false if test_array.sort != control_array
end

def check_column?(board, column_id)
  control_array = ["1","2","3","4","5","6","7","8","9"]
  column_cells = []
  test_array = []

  column_cells = board.find_all { |i| i[:column] == column_id }
  column_cells.each do |cell|
    test_array.push(cell[:value].first)
  end
  return false if test_array.sort != control_array
end

def check_box?(board, box_id)
  control_array = ["1","2","3","4","5","6","7","8","9"]
  box_cells = []
  test_array = []

  box_cells = board.find_all { |i| i[:box] == box_id }
  box_cells.each do |cell|
    test_array.push(cell[:value].first)
  end
  return false if test_array.sort != control_array
end

# def check_box?(board, box, num)
# 	board.each do |cell|
# 		if cell[:box] == box
# 			if cell[:value] == num
# 				return true
# 			end
# 		end
# 	end
# 	return false
# end

# def process_cell(board, id)
# 	if board[id][:value].is_a? Array
# 		board[id][:value].each do |number|
# 			if (check_column?(board, board[id][:column], number) || check_row?(board, board[id][:row], number) || check_box?(board, board[id][:box], number))
# 				board[id][:value].delete(number)
# 			end
# 		end
# 		p board[id][:value]
# 		if board[id][:value].size == 1
# 			return board[id][:value][0]
# 		end
# 	end
# end

def process_cell(board, id)
  if board[id][:value].length == 1
    cell_value = get_value(board, id)
    process_row(board, id, board[id][:row], cell_value)
    process_column(board, id, board[id][:column], cell_value)
    process_box(board, id, board[id][:box], cell_value)
    return board
  end
end

def process_row(board, cell_id, row_id, search_value)
  row_cells = board.find_all { |i| i[:row] == row_id && i[:id] != cell_id }
  row_cells.each do |cell|
    cell[:value] -= search_value.flatten
  end
  board
end

def process_column(board, cell_id, column_id, search_value)
  column_cells = board.find_all { |i| i[:column] == column_id && i[:id] != cell_id }
  column_cells.each do |cell|
    cell[:value] -= search_value.flatten
  end
  board
end

def process_box(board, cell_id, box_id, search_value)
  box_cells = board.find_all { |i| i[:box] == box_id && i[:id] != cell_id }
  box_cells.each do |cell|
    cell[:value] -= search_value.flatten
  end
  board
end




# board = populate_board('1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--')

# puts board
# puts '&&&&&&&&&&'
# board.each do |cell|
#   process_cell(board, cell[:id])
# end
# puts '******'
# puts board






