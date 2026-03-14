import Foundation

let n = Int(readLine()!)!
var map: [[Bool]] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
for _ in 0..<n {
    let input = Array(readLine()!).map { $0 == "1" }
    map.append(input)
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

func dfs(i: Int, j: Int) -> Int {
    var stack: [(Int, Int)] = [(i, j)]
    visited[i][j] = true
    var count = 1
    while !stack.isEmpty {
        let pop = stack.removeLast()
        
        for i in 0..<4 {
            let nextI = pop.0 + dx[i]
            let nextJ = pop.1 + dy[i]
            
            if nextI < 0 || nextI >= n || nextJ < 0 || nextJ >= n {
                continue
            }
            
            if visited[nextI][nextJ] {
                continue
            }
            
            if !map[nextI][nextJ] {
                continue
            }
            
            visited[nextI][nextJ] = true
            count += 1
            stack.append((nextI, nextJ))
        }
    }
    return count
}
var answer: [Int] = []
for i in 0..<n {
    for j in 0..<n {
        if !visited[i][j] && map[i][j] {
            answer.append(dfs(i: i, j: j))
        }
    }
}
print("\(answer.count)\n\(answer.sorted().map{"\($0)"}.joined(separator: "\n"))")
