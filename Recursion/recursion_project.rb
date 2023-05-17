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

p exp_2(2, 7)
