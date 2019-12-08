require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize()
    @head = nil
    @tail = nil 
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(new_n)
    if @head.nil?
      @head = new_n
      @tail = @head
    else
      @tail.next = new_n
      @tail = new_n
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @head = nil
      @tail = nil
    else
      new_n = @head
      while ((!new_n.nil?) && (new_n.next != @tail)) do
        new_n = new_n.next
      end
      @tail = new_n
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print(hash)
    new_n = @head
    i = 0
    while !new_n.nil?
      puts "Hash: #{hash} -> Position: #{i} -> Key: #{new_n.key} -> Value: #{new_n.value}"
      new_n = new_n.next
      i += 1
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(new_n)
    if !@head.nil?
      if @head === new_n
        remove_front
      elsif @tail === new_n
        remove_tail
      else        
        t_n = @head
        while !t_n.nil? && t_n.next != node
          t_n = t_n.next
        end
        if t_n.next == new_n
          t_n.next = t_n.next.next
        end
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(new_n)
    new_n.next = @head
    @head = new_n

    if @tail.nil?
      @tail = new_n
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    new_n = @head
    if @head === @tail
      @head  = nil
      @tail = nil 
    elsif !@head.nil?
      @head = new_n.next

      if @head.next.nil?
        @tail = @head
      end
    end
    return new_n 
  end

  def find_node(key)
    c_n = @head
    while !c_n.nil? && c_n.key != key
      c_n = c_n.next
    end
    c_n
  end

  def size
    x = 0
    if !@head.nil?
      x = 1
      n = @head
      while n != @tail
        n = n.next 
        x += 1
      end
    end
    return x
  end
end