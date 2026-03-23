import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
// (도착도시 , 비용)
var relation: [[Int:Int]] = Array(repeating: [:], count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    if relation[input[0]][input[1]] == nil {
        relation[input[0]][input[1]] = input[2]
    } else if let dist = relation[input[0]][input[1]], dist > input[2] {
            relation[input[0]][input[1]] = input[2]
    }
}
let ab = readLine()!.split(separator: " ").map{Int($0)!}

var dist: [Int] = Array(repeating: Int.max, count: n+1)
var visited: [Bool] = Array(repeating: false, count: n+1)

func findMinNode() -> Int {
    var minDist: Int = Int.max
    var minNode: Int = 0
    
    for i in 1..<dist.count {
        if dist[i] < minDist && !visited[i] {
            minDist = dist[i]
            minNode = i
        }
    }
    return minNode
}

func daikstra(start: Int) {
    for i in relation[start] {
        dist[i.0] = i.1
    }
    dist[start] = 0
    visited[start] = true
    
    for _ in 0..<n-1 {
        let current = findMinNode()
        visited[current] = true
        for (next, weight) in relation[current] {
            if visited[next] { continue }
            if dist[current] + weight < dist[next] {
                dist[next] = dist[current] + weight
            }
        }
    }
}
daikstra(start: ab[0])

print(dist[ab[1]])
