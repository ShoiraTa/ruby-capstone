class Genre
  attr_accessor :name, :id, :arr_i

  def initialize(id, name)
    @id = id
    @name = name
    @arr_i = []
  end

  def add_item(item)
    @arr_i << item
    item.genre = self
  end
end
