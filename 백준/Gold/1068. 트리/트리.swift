import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int($0)!}
let removeNode = Int(readLine()!)!
var answer = 0
var rootNode = 0

var visited: [Bool] = Array(repeating: false, count: n)
var relation: [[Int]] = Array(repeating: [], count: n)

for i in 0..<input.count {
    if input[i] == -1 {
        rootNode = i
        continue
    }
    relation[input[i]].append(i)
    relation[i].append(input[i])
}

func dfs(node: Int) {
    visited[node] = true
    let next = relation[node]
    var count = 0
    for i in next {
        if !visited[i] && i != removeNode {
            count += 1
            dfs(node: i)
        }
    }
    if count == 0 {
        answer += 1
    }
}

if rootNode == removeNode {
    print(0)
} else {
    dfs(node: rootNode)
    print(answer)
}


