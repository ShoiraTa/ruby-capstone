require_relative '../item'

require 'yaml'

describe Item do
  before :each do
    @item = Item.new '1', 'itemName', '2001-01-01'
  end

  it '@item should be an instance of Item class' do
    expect(@item).to be_an_instance_of Item
  end

  it 'item should have "itemName" as name' do
    @name == 'itemName'
  end

  it 'item should have can_be_archived? to be true' do
    expect(@item.can_be_archived?).to be(true)
  end

  it 'item should have move_to_archive to be true' do
    expect(@item.move_to_archive).to be(true)
  end
end
