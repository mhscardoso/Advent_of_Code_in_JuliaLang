aim = 0
deep = 0
horizontal = 0

function solution(dir, value)
    if dir == "forward"
        global horizontal += value
        global deep += value * aim
    elseif dir == "up"
        global aim -= value
    else
        global aim += value
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

println("Aim: $(aim); Deep: $(deep); Horizontal: $(horizontal)")
println("The answer is $(deep * horizontal)")