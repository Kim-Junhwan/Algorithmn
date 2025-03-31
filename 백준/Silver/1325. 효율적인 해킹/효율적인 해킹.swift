import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var relation: [[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    relation[input[1]].append(input[0])
}

func solution() {
    var answer: [Int] = []
    var maxCount = -1
    for i in 1..<n+1 {
        var visited: [Bool] = Array(repeating: false, count: n+1)
        var queue: [Int] = [i]
        visited[i] = true
        var count = 0
        var idx = 0
        while idx < queue.count {
            let pop = queue[idx]
            for j in relation[pop] {
                if visited[j] { continue }
                queue.append(j)
                count += 1
                visited[j] = true
            }
            
            idx += 1
        }
        answer.append(count)
        maxCount = max(maxCount, count)
    }
    print(answer.enumerated().filter { $0.element == maxCount }.map { "\($0.offset + 1)" }.joined(separator: " "))
}

solution()
