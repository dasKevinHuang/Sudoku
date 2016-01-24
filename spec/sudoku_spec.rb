require_relative '../sudoku'

describe "Sudoku" do
  let(:board) { [
    {id:0, row: 0, column: 0, box: 0, value: '5'},
    {id:1, row: 0, column: 1, box: 0, value: '-'},
    {id:2, row: 0, column: 2, box: 0, value: '2'},
    {id:3, row: 0, column: 3, box: 1, value: '3'},
    {id:4, row: 0, column: 4, box: 1, value: '4'},
    {id:5, row: 0, column: 5, box: 1, value: '-'},
    {id:6, row: 0, column: 6, box: 2, value: '7'},
    {id:7, row: 0, column: 7, box: 2, value: '8'},
    {id:8, row: 0, column: 8, box: 2, value: '-'},
    {id:9, row: 0, column: 0, box: 0, value: '7'},
    {id:10, row: 1, column: 1, box: 0, value: '-'},
    {id:11, row: 1, column: 2, box: 0, value: '-'},
    {id:12, row: 1, column: 3, box: 1, value: '-'},
    {id:13, row: 1, column: 4, box: 1, value: '-'},
    {id:14, row: 1, column: 5, box: 1, value: '-'},
    {id:15, row: 1, column: 6, box: 2, value: '-'},
    {id:16, row: 1, column: 7, box: 2, value: '-'},
    {id:17, row: 1, column: 8, box: 2, value: '-'},
    ] }
  context 'check populate_board return' do
    it 'returns board when board is populated' do

    expect(solve(board)).to eql [
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
  end
end

describe 'check_methods' do
  let(:board) { [
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
    ] }
    
  context 'check column' do
    it 'returns true if the number is in the column' do
      expect(check_column?(board, 0, '5')).to eq true
    end
    it 'returns false if the number is not in the column' do
      expect(check_column?(board, 2, '5')).to eq false
    end
  end

  context 'check row' do
    it 'returns true if the number is in the row' do
      expect(check_row?(board, 0, '8')).to eq true
    end
    it 'returns false if the number is not in the row' do
      expect(check_row?(board, 1, '5')).to eq false
    end
  end

  context 'check boxes' do
    it 'returns true if the number is in the box' do
      expect(check_box?(board, 0, '2')).to eq true
    end
    it 'returns false if the number is not in the box' do
      expect(check_box?(board, 2, '5')).to eq false
    end
  end
end