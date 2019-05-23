fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octo(arr)
    long_fish = ''
    arr.each do |f1|
        arr.each do |f2|
            long_fish = f1 if f1.length - f2.length > long_fish.length - f2.length
        end
    end
    long_fish
end

def dominat_octo(arr)
    long_fish = quick_octo(arr)[-1]
end

def quick_octo(arr)
    return arr if arr.size <=1
    pivot = arr.shift
    left = []
    right = []
    arr.each do |el|
        case pivot.length <=> el.length
        when 1 
            left << el
        else
            right << el
        end
    end
    quick_octo(left) + [pivot] + quick_octo(right)
end

def clever_octo(arr)
    long_fish = ''
    arr.each { |fish| long_fish = fish if fish.length > long_fish.length }
    long_fish
end

# p sluggish_octo(fishes)
# p dominat_octo(fishes)
# p clever_octo(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

new_tiles_data_structure = {}
tiles_array.each_with_index { |el, i| new_tiles_data_structure[el] = i }

def slow_dance(tar, arr)
    arr.each_with_index { |el, i| return i if tar == el }
end

def fast_dance(tar, hash)
    hash[tar]
end

p slow_dance("up", tiles_array) #=> 0
p slow_dance("right-down", tiles_array) #=> 3
p fast_dance("up", new_tiles_data_structure) #=> 3
p fast_dance("right-down", new_tiles_data_structure) #=> 3



