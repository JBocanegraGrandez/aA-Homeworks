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
