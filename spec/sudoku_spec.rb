require_relative '../sudoku'

describe "Sudoku" do
end

board = [
    {id:0, row: 0, column: 0, box: 0, value: '5'},
    {id:1, row: 0, column: 1, box: 0, value: '25'},
    {id:2, row: 0, column: 2, box: 0, value: '100'}]

describe "get_value" do
  it "returns a value from an array of hashes" do
    expect(get_value(board, 2)).to eq ['100']
  end
end

describe "set_value" do
  it "sets the value for the given id" do
  expect(set_value(board, 2, 115)).to eq [115]
  end
end