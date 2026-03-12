import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var path: [[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    path[input[0]].append(input[1])
    path[input[1]].append(input[0])
}

var stack: [Int] = [1]
var visited: [Bool] = Array(repeating: false, count: n+1)
visited[1] = true

while !stack.isEmpty {
    let current = stack.removeLast()
    for next in path[current] {
        if !visited[next] {
            visited[next] = true
            stack.append(next)
        }
    }
}

print(visited.filter{$0}.count-1)
