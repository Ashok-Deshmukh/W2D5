class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index {|el, idx| result += el.hash ^ idx }
    # result = []
    # self.each { |el| result << el.ord }
    # result.map { |el| el * 5}.join.to_i
    result
    # self.map.with_index { |el, idx| el.hash ^ idx  }.inject(:+)
  end
end

class String
  def hash
    letters = self.split("")
    letters.map { |letter| letter.ord }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # self.to_a.flatten.hash
    to_a.hash
  end
end
#
# to_a.sort_by(&:hash).hash
