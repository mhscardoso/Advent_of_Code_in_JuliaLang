deep = 0
horizontal = 0

function solution(dir, value)
    if dir == "forward"
        global horizontal += value
    elseif dir == "up"
        global deep -= value
    else
        global deep += value
    end
end

open(ARGS[1], "r") do f
    for line in eachline(f)
        info = split.(line, " ")
        d = info[1]
        v = parse(Int, info[2])
        solution(d, v)
    end
end


println("The deep was $(deep) and the horizontal, $(horizontal). The product is $(deep * horizontal)")