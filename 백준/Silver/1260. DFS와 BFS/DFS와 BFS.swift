import Foundation

let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]

var nodeList: [[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0]
    let end = input[1]
    nodeList[start].append(end)
    nodeList[end].append(start)
}



func solution(n: Int, m: Int, v: Int, list: [[Int]]) {
    func dfs() {
        var answer = ""
        var visited = Array(repeating: false, count: n+1)
        var stack: [Int] = [v]
        
        while !stack.isEmpty {
            let pop = stack.removeLast()
            if visited[pop] {
                continue
            }
            visited[pop] = true
            answer.append("\(pop) ")
            let nextNodes = list[pop].filter { !visited[$0] }.sorted { $0 > $1 }
            stack.append(contentsOf: nextNodes)
        }
        print(answer)
    }
    
    func bfs() {
        var answer = ""
        var visited = Array(repeating: false, count: n+1)
        var queue: [Int] = [v]
        var startIdx = 0
        var endIdx = 0
        
        while startIdx <= endIdx {
            let pop = queue[startIdx]
            startIdx += 1
            if visited[pop] {
                continue
            }
            visited[pop] = true
            answer.append("\(pop) ")
            let nextNodes = list[pop].filter { !visited[$0] }.sorted { $0 < $1 }
            queue.append(contentsOf: nextNodes)
            endIdx += nextNodes.count
        }
        print(answer)
    }
    dfs()
    bfs()
}

solution(n: n, m: m, v: v, list: nodeList)
