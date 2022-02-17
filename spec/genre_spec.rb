require_relative '../classes/genre'

require 'yaml'

describe Genre do
  before :each do
    @genre = Genre.new '1', 'indie'
  end

  it '@genre should be an instance of Genre class' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'genre should have "indie" name' do
    @name == 'indie'
  end
end
