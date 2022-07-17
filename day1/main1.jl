function solution(arr :: Array{Int})
  println("$(arr[1]) (N/A - no previous measurement)")
  global old = arr[1]
  global answer = 0

  for i in arr[2:end]
    if i > old
      println("$(i) (increased)")
      global answer += 1
    elseif i < old
      println("$(i) (decreased)")
    else
      println("$(i)")
    end

    global old = i
  end

  return answer
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


println("$(solution(input))")
