require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    new_node = Node.new(key, value)
    i = index(key, size) 

    if @items[i].nil? 
      @items[i] = new_node 
    elsif @items[i].key != key 
      self.resize 
      self[key] = value 
    elsif (@items[i].key == key) && (@items[i].value != value)
      if self.next_open_index(@items[i]) === -1
        self.resize
        @items[i] = value
      elsif self.next_open_index(@items[i]) != -1
        @items[i] = value
      end
    end
  end

  def [](key)
    i = index(key,size)
    if  @items[i].key == key
      return @items[i].value 
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size 
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    @items.each do |ele|
      if ele.nil?
        return index 
      else
        return -1
      end
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    arr = Array.new(size * 2)
    iter = 0..@items.length
    iter.each do |ele|
      if @items[ele]
        inew = @items[ele].key.sum % arr.length
        arr[inew] = @items[ele]
      end
    end
    @items = arr
  end

  
  def load_factor
    x = 0.0
    for i in 0..self.size-1
      if !@items[i].nil?
        x += @items[i].size 
      end
    end
    x / self.size 
  end
  
 def print_hash  
   
   @items.each do |ele|
     if ele.nil?
       puts nil
     else 
       puts "#{ele.key}"
       puts "#{ele.value}"
     end
   end
  
 end
 
end