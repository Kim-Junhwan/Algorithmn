import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

let MAXIMUM = 10000000000

var relation: [[Int]] = Array(repeating: Array(repeating: MAXIMUM, count: n+1), count: n+1)
var busArr: [[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    relation[abc[0]][abc[1]] = min(abc[2], relation[abc[0]][abc[1]])
}

for i in 1...n {
    relation[i][i] = 0
}

func solution() {
    for k in 1...n {
        for s in 1...n {
            for e in 1...n {
                if s == e { continue }
                relation[s][e] = min(relation[s][e], relation[s][k]+relation[k][e])
            }
        }
    }
    
    var answer = ""
    for i in 1...n {
        for j in 1...n {
            if relation[i][j] == MAXIMUM {
                answer += "0 "
            } else {
                answer += "\(relation[i][j]) "
            }
        }
        answer += "\n"
    }
    print(answer)
}

solution()
