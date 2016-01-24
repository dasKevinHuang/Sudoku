\#### Methods

```
solve(string)
	{
	populate_board(string)
	get_value(array, id)
	process_cell(array, id)
		{
		check_column?(column, num)
		check_row?(row, num)
		check_box?(box, num)
		}
	set_value(array, id, newvalue)
	completed?(string)
	solved?(string)
	pretty_board(string)
	}
```

#### Data structure for board

Array of hashes

```
board = [
		{id:0, row: 0, column: 0, box: 0, value: '0'},
		{id:1, row: 0, column: 1, box: 0, value: '-'},
		{id:2, row: 0, column: 2, box: 0, value: '-'},
		...
		]
```

#### solve method pseudocode

```
DEFINE solve(string)
	RETURN string if solved?(string)
	SET board = populate_board(string)
	FOR every *cell* in the board
		IF get_value(cell) == '-'
			guess = process_cell(cell)
			set_value(board, cell, guess)
		END IF
	END FOR
	CALL solve
```

#### Rspec


