# Len of binary number
len_open = 0
open(ARGS[1], "r") do f
    s = readline(f)
    global len_open = length(s)
end

ones = []
zeros = []

for i in (1:len_open)
    append!(ones, 0)
    append!(zeros, 0)
end

function solution()
    open(ARGS[1], "r") do f
        for line in eachline(f)
            for c_i in (1:len_open)
                if line[c_i] == '0'
                    global zeros[c_i] += 1
                else
                    global ones[c_i] += 1
                end
            end
        end
    end
end

solution()

gamma = 0
epsilon = 0

for i in (1:len_open)
    if ones[i] > zeros[i]
        global gamma += 2 ^ (len_open - i)
    else
        global epsilon += 2 ^ (len_open - i)
    end
end

println(ones)
println(zeros)

println("The answer is: $(gamma * epsilon)")