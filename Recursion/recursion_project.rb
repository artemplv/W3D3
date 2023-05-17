require "byebug"

def range_rec(start_pos,end_pos)
    return [] if end_pos <= start_pos
    range_rec(start_pos,end_pos-1) << end_pos-1
end

# p range_rec(3,7)


def range_it(start_pos,end_pos)
    arr = []
    (start_pos...end_pos).each do |i|
        arr.push(i)
    end
    arr
end

# p range_it(3,7)

def exp_1(base, power)
    return 1 if power == 0

    base * exp_1(base, power - 1)
end

# p exp_1(2, 8)

def exp_2(base, power)
    retrun 1 if power == 0
    return base if power == 1

    if power.even?
        temp = exp_2(base, power / 2)
        temp * temp
    else
        temp = exp_2(base, (power - 1) / 2)
        base * temp * temp
    end
end

# p exp_2(2, 7)

#-----------
#Deep dup

class Array

    def deep_dup
        return self if self.class != Array
        arr = []

        self.each do |ele|
            sub_arr = []
            if ele.class == Array
                sub_arr += ele.deep_dup
            else
                arr << ele
            end
            arr << sub_arr unless sub_arr.empty?
        end
        
        arr
        
    end
end

def fib(n)
    return [1, 1].take(n) if n <= 2

    arr = fib(n - 1)
    arr << arr[-1] + arr[-2]
end


def bsearch(array,target)
    midpoint = array.length / 2
    return nil if array.empty?
    return midpoint if array[midpoint] == target
    left_side = array[0...midpoint]
    right_side = array[midpoint+1..-1]

    if target < array[midpoint]
        v1 = bsearch(left_side, target)
        return nil if v1 == nil
        midpoint - (left_side.length - bsearch(left_side,target))
    else
        v2 = bsearch(right_side, target)
        return nil if v2 == nil
        midpoint + 1 + bsearch(right_side,target)
    end
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1,2,3,4,4,5,7,8,9,10,11],3) # => 2
p bsearch([1,2,3,4,4,5,7,8,9,10,11],8) # => 7
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
p bsearch([1,2,3,4,4,5,7,8,9,10,11],15) # => nil