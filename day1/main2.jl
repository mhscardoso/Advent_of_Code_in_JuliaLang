function solution(arr :: Array{Int64})
    global ans = 0

    for i in (2:length(arr) - 2)
        old_sum = arr[i - 1] + arr[i] + arr[i + 1]
        actual_sum = arr[i] + arr[i + 1] + arr[i + 2]

        if i == 2
            println("$(old_sum)  (N/A - no previous measurement)")
        end

        if actual_sum > old_sum
            println("$(actual_sum) (increased)")
            global ans += 1
        elseif actual_sum == old_sum
            println("$(actual_sum) (no change)")
        else
            println("$(actual_sum) (decreased)")
        end
    end

    return ans
end

try
    open(ARGS[1], "r") do f
        global input = readlines(f)
    end
    catch
      @warn "No such file"
    end
  
input = map(input) do i
      i = parse(Int64, i)
end

println(solution(input))

println(solution([199, 200, 208, 210, 200, 207, 240, 269, 260, 263]))