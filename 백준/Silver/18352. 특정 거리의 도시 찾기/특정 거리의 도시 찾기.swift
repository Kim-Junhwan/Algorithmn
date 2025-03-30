import Foundation

let nmkx = readLine()!.split(separator: " ").map{Int($0)!}
let n = nmkx[0]
let m = nmkx[1]
let k = nmkx[2]
let x = nmkx[3]

var relation: [[Int]] = Array(repeating: [], count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    relation[input[0]-1].append(input[1]-1)
}

func solution() {
    var queue: [(Int, Int)] = [(x-1, 0)]
    var visited: [Bool] = Array(repeating: false, count: n)
    visited[x-1] = true
    var idx = 0
    var result: [Int] = Array(repeating: -1, count: n+1)
    while idx < queue.count {
        let pop = queue[idx]
        if pop.1 == k {
            result[pop.0+1] = k
        }
        relation[pop.0].forEach {
            if (!visited[$0]) {
                queue.append(($0, pop.1+1))
                visited[$0] = true
            }
        }
        idx += 1
    }
    let answer = result.enumerated().filter { $0.element == k }.map { $0.offset }.sorted()
    if answer.count == 0 {
        print("-1")
    } else {
        for i in answer {
            print(i)
        }
    }
}

solution()
