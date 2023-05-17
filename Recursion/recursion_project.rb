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

#[4]

# [4, [1,2,3],[4,5,6]]
# p [4].deep_dup
# arr = [1, [2], [3, [4]]]
# arr_2 = arr.deep_dup
# arr[2] = "x"
# p arr
# p arr_2
# p arr
# p [[1,2,3],[4,5,6]].deep_dup

def fib(n)
    return [1, 1].take(n) if n <= 2

    arr = fib(n - 1)
    arr << arr[-1] + arr[-2]
end
