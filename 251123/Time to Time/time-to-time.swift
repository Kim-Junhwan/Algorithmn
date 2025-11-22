let input = readLine()!
let tokens = input.split(separator: " ").map { Int($0)! }
let a = tokens[0]
let b = tokens[1]
let c = tokens[2]
let d = tokens[3]

print(((c*60)+d) - ((a*60)+b))