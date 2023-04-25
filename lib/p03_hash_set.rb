class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    if !self.include?(num) 
      @store[num % num_buckets] << num
      @count += 1
    end
    if self.count > self.num_buckets 
      resize!
    end
  end

  def include?(key)
    num = key.hash
    @store[num % num_buckets] == true
  end

  def remove(key)
    num = key.hash
    if self.include?(num)
      @store.delete_at(num % num_buckets)
      @count -= 1
    end
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