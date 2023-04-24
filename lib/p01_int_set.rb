class MaxIntSet

  attr_reader :store, :max

  def initialize(max)
    @max = max 
    @store = Array.new(@max)
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0 
    @store.each_with_index do |el, i|
      if num == i 
        @store[i]= true 
      else 
        @store[i]= false 
      end 
    end 
  end

  def remove(num)
    @store.delete_at(num)
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end

class IntSet
  attr_reader :num_buckets, :store 
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  
  def insert(num)
    @store[num % @num_buckets] << num 
  end

  def remove(num)
    @store.delete_at(num % @num_buckets)
  end

  def include?(num)
    @store[num % @num_buckets].include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.include?(num) == false
      @store[num % num_buckets] << num
      @count += 1
    end
    if self.count > self.num_buckets 
      resize!
    end
  end

  def remove(num)
    if self.include?(num)
      @store.delete_at(num % num_buckets)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  def count
    @count
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.dup
    @store = Array.new(self.num_buckets * 2) { Array.new }
    @count = 0
    temp.each do |subarray|
      subarray.each do |ele|
        self.insert(ele)
      end
    end
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end