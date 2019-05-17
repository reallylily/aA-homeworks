require "byebug"

class Stack
    attr_accessor :stack
    def initialize
      @stack = []
    end

    def [](i)
        stack[i]
    end

    def push(el)
      stack << el
    end

    def pop
      popped = self.stack[-1]
      @stack = self.stack[0...-1]
      popped
    end

    def peek
      p stack[-1]
    end
  end

    # stack = Stack.new
    # p  stack.push(1)
    # p  stack.push(2)
    # p stack.push(3)
    # p stack.pop
    # p stack.stack
    # stack.peek

class Queue
    attr_accessor :queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

    # p line = Queue.new
    # p line.enqueue(1)
    # p line.enqueue(2)
    # p line.enqueue(3)
    # p line.dequeue
    # p line.queue
    # p line.peek

class Map
    attr_accessor :map
    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key, value]
    end

    def get(key)
        @map.each do |pair|
            k = pair[0]
            return pair if k == key
        end
    end

    def delete(key)
        (0...@map.length).each do |i|
            k = @map[i][0]
            return @map.delete_at(i) if k == key
        end
    end

    def show
        p @map
    end

end
    mup = Map.new
    mup.set(1, 2)
    mup.set(3, 4)
    mup.set(5, 6)
    mup.show
    p mup.get(5)
    p mup.delete(3)
    mup.show
    

