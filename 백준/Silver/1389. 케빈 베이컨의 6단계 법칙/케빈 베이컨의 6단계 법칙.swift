import Foundation

let MAXIMUM = 1000000000
let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]
var relation: [[Int]] = Array(repeating: Array(repeating: MAXIMUM, count: n), count: n)
for i in 0..<n {
    relation[i][i] = 0
}
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{ Int($0)!-1 }
    relation[input[0]][input[1]] = 1
    relation[input[1]][input[0]] = 1
}

func solution() {
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if relation[i][j] > relation[i][k]+relation[k][j] {
                    relation[i][j] = relation[i][k]+relation[k][j]
                }
            }
        }
    }
    let result = relation.map { $0.reduce(0, +) }
    print(result.enumerated().min(by: { $0.element < $1.element })!.offset+1)
}

solution()
