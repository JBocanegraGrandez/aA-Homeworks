class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end

class Queue
  def initialize
    @stack = []
  end
  def enqueue(el)
    @stack << el
  end

  def dequeue
    @stack.shift
  end

  def peek
    @stack.last
  end
end

class Map
  def initialize
    @stack = []
  end

  def set(key, val)
    return @stack << [key, val] if @stack.none? { |pair| pair[0] == key }
    @stack.each { |pair| pair[1] = val if pair[0] == key }
  end

  def get(key)
    @stack.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def delete(key)#not raising if key does not exist
    @stack.each { |pair| @stack.delete(pair) if pair[0] == key }
  end

  def show
    @stack
  end
end
