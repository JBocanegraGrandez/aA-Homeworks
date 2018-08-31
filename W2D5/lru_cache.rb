class LRUCache
    def initialize(size)
      @size = size
      @cache = Array.new
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
         @cache.delete(el)
         @cache.push(el)
      elsif @cache.size == @size
          @cache.shift
          @cache.push(el)
       else
         @cache.push(el)
       end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache.reverse.each { |item| p item}
    end

    private
    # helper methods go here!

  end
