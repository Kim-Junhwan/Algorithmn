import Foundation

let firstLine = readLine()!
let firstValues = firstLine.split(separator: " ").map { Int($0)! }
let k = firstValues[0]
let n = firstValues[1]

var results = [[Int]]()
for _ in 0..<k {
    let line = readLine()!
    let game = line.split(separator: " ").map { Int($0)! }
    results.append(game)
}
var answer = 0
for i in 1...n {
    for j in 1...n {
        var isAb = true
        for result in results {
            let iIndex = result.firstIndex(of: i)!
            let jIndex = result.firstIndex(of: j)!
            if iIndex >= jIndex {
                isAb = false
                break
            }
        }
        if isAb {
            answer += 1
        }
    }
}

print(answer)
