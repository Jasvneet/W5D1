class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    new_s = ""
    self.each_with_index do |ele, i|
      new_s += ele.to_s + i.to_s
    end 
    new_s.to_i

  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    new_s = ""
    self.chars.each_with_index do |char, i|
      new_s += alphabet.index(char).to_s + i.to_s
    end 
    new_s.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    subsets = []
    self.each do |k,v|
      subsets << k.to_s.to_i
      subsets << v.to_i
    end 
    subsets.sort 
    subsets.hash 

  end
end