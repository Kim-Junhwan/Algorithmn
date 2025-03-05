import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
var mapArr: [[Bool]] = Array(repeating: Array(repeating: false, count: nm[0]), count: nm[0])
var visited: [Bool] = Array(repeating: false, count: nm[0])
for _ in 0..<nm[1] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    mapArr[input[0]-1][input[1]-1] = true
    mapArr[input[1]-1][input[0]-1] = true
}

func solution() -> Int {
    var answer = 0
    var stack: [Int] = []
    while visited.contains(false) {
        let firstIndex = visited.firstIndex(of: false)!
        stack.append(firstIndex)
        answer += 1
        while !stack.isEmpty {
            let popValue = stack.removeLast()
            visited[popValue] = true
            let nextNodeList = mapArr[popValue].enumerated().filter{ $0.element }.filter{ visited[$0.offset] == false }.map { $0.offset }
            stack.append(contentsOf: nextNodeList)
        }
    }
    return answer
}

print(solution())
