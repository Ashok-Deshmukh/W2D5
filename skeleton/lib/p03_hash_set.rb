require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key.hash] << key
      @count += 1
      if @count >= num_buckets
        resize!
      end
    key
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self[key.hash].delete(key)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
          old_store = @store
          @count = 0
          @store = Array.new(num_buckets * 2) { Array.new }
          old_store.flatten.each { |el| insert(el) }
  end
end


        # class ResizingIntSet
        #   attr_reader :count
        #
        #   def initialize(num_buckets = 20)
        #     @store = Array.new(num_buckets) { Array.new }
        #     @count = 0
        #   end
        #
        #   def insert(num)
        #     self[num] << num
        #     num
        #     @count += 1
        #     if @count >= num_buckets
        #       resize!
        #     end
        #   end
        #
        #   def remove(num)
        #     self[num].delete(num)
        #   end
        #
        #   def include?(num)
        #     self[num].include?(num)
        #   end
        #
        #   private
        #
        #   def [](num)
        #     # optional but useful; return the bucket corresponding to `num`
        #   @store[num % num_buckets]
        #   end
        #
        #   def num_buckets
        #     @store.length
        #   end
        #
        #   def resize!
        #       old_store = @store
        #       @count = 0
        #       @store = Array.new(num_buckets * 2) { Array.new }
        #       old_store.flatten.each { |el| insert(el) }
        #   end
        #
        #
        # end
