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