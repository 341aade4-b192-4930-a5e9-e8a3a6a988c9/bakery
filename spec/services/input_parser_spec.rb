require 'services/input_parser'

describe 'InputParser' do
  describe '#parse' do
    it 'should throw exception when input is invalid' do
      expect { InputParser.parse('invelid') }.to raise_error(InputParser::InvalidInput)
    end

    it 'should return number and code when input is valid' do
      number_of_items, code = InputParser.parse('5 VS5')

      expect(number_of_items).to eq 5
      expect(code).to eq 'VS5'
    end
  end
end
