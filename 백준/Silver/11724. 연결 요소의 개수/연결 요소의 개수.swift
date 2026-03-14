import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
var relation: [[Int]] = Array(repeating: [], count: nm[0]+1)
for _ in 0..<nm[1] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    relation[input[0]].append(input[1])
    relation[input[1]].append(input[0])
}

var count = 0
var visited: [Bool] = Array(repeating: false, count: nm[0]+1)
var stack: [Int] = []

for i in 1...nm[0] {
    if !visited[i] {
        count += 1
        stack.append(i)
        while !stack.isEmpty {
            let node = stack.removeLast()
            for next in relation[node] {
                if !visited[next] {
                    visited[next] = true
                    stack.append(next)
                }
            }
        }
    }
}

print(count)
