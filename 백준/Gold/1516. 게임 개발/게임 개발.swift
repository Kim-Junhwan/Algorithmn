import Foundation

let n = Int(readLine()!)!
var relation: [[Int]] = Array(repeating: [], count: n+1)
var countArr = Array(repeating: -1, count: n+1)
var buildTimeArr = Array(repeating: 0, count: n+1)
var selfBuildTimeArr = Array(repeating: 0, count: n+1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}.dropLast()
    buildTimeArr[i] = input[0]
    selfBuildTimeArr[i] = input[0]
    countArr[i] = input.count-1
    if input.count == 1 { continue }
    for j in 1..<input.count {
        relation[input[j]].append(i)
    }
}

func solution() {
    var visited = Array(repeating: false, count: n+1)
    var queue = countArr.enumerated().filter { $0.element == 0 }.map { $0.offset }
    queue.forEach { visited[$0] = true }
    var idx = 0
    while idx < queue.count {
        let pop = queue[idx]
        relation[pop].forEach {
            buildTimeArr[$0] = max(buildTimeArr[$0], buildTimeArr[pop]+selfBuildTimeArr[$0])
            countArr[$0] -= 1
            if countArr[$0] == 0 {
                queue.append($0)
            }
        }
        idx += 1
    }
    for i in 1...buildTimeArr.count-1 {
        print(buildTimeArr[i])
    }
}

solution()
