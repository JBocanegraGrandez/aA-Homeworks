def sluggish_octopus(fish_arr)
  fish_arr.each_with_index do |fish1, i1|
    max_length = true

    fish_arr.each_with_index do |fish2, i2|
      next if i1 == i2
      max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length
  end
end

def dominant_octopus(arr)
  arr.merge_sort
  arr.last
end

class Array
def merge_sort(&prc)
  prc ||= Proc.new { |x, y| x <=> y }
  return self if count <= 1

  mid_i = self.length / 2
  sorted_left = self.take(mid_i).merge_sort(&prc)
  sorted_right = self.drop(mid_i).merge_sort(&prc)

  self.merge(sorted_left, sorted_right, &prc)
end


  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right
  end
end

def clever_octopus(fish_arr)
  biggest = fish_arr[0]

  fish_arr.each do |fish|
    biggest = fish if fish.length > biggest.length
  end

  biggest
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == direction
  end
end

tiles_hash = Hash.new(0)

tiles_array.each_with_index do |tile, index|
  tiles_hash[tile] += index
end

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end
