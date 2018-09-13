class Cart
  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_accessory(id)
    if @contents[id]
      @contents[id]
    else
      id = id.to_s
      if @contents[id]
        @contents[id]
      else
        @contents[id] = 0
      end
    end
    @contents[id] = @contents[id] + 1
  end

  def remove_accessory(id)
    if @contents[id]
      @contents[id]
    else
      id = id.to_s
      if @contents[id]
        @contents[id]
      else
        @contents[id] = 0
      end
    end
    if @contents[id] > 1
     @contents[id] = @contents[id] - 1
   else
     @contents.delete(id)
   end
  end

  def accessories
    @contents.map do |id, count|
      [Accessory.find(id), count]
    end
  end

  def line_total(accessory, count)
    accessory.price * count
  end

  def cart_total
    sum_array = accessories.map do |accessory, count|
      accessory.price * count
    end
    sum_array.sum
  end
end
