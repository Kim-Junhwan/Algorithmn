import Foundation

let n = Int(readLine()!)!
var relations: [[Int]] = Array(repeating: [], count: n+1)
var answer = Array(repeating: 0, count: n+1)
var visited: [Bool] = Array(repeating: false, count: n+1)
visited[1] = true

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    relations[input[0]].append(input[1])
    relations[input[1]].append(input[0])
}

func dfs(input: Int) {
    let next = relations[input]
    
    for i in next {
        if visited[i] { continue }
        answer[i] = input
        visited[i] = true
        dfs(input: i)
    }
}

dfs(input: 1)

for i in 2...n {
    print(answer[i])
}

