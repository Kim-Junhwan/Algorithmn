import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var countArr: [Int] = Array(repeating: 0, count: n+1)
var relationArr: [[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    countArr[input[1]] += 1
    relationArr[input[0]].append(input[1])
}

func solution() -> String {
    var result: [Int] = []
    var queue: [Int] = []
    for i in 1...n {
        if countArr[i] == 0 {
            queue.append(i)
        }
    }
    var idx = 0
    for _ in 1...n {
        if (queue.isEmpty) {
            return ""
        }
        let pop = queue[idx]
        result.append(pop)
        for i in relationArr[pop] {
            countArr[i] -= 1
            if countArr[i] == 0 {
                queue.append(i)
            }
        }
        idx += 1
    }
    return result.map { "\($0)" }.joined(separator: " ")
}

print(solution())
