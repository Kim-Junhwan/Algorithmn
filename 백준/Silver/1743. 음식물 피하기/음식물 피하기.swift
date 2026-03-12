import Foundation

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
var map = Array(repeating: Array(repeating: false, count: nmk[1]+1), count: nmk[0]+1)
var coordis: [(Int, Int)] = []

var visited = Array(repeating: Array(repeating: false, count: nmk[1]+1), count: nmk[0]+1)

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

for _ in 0..<nmk[2] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map[input[0]][input[1]] = true
    coordis.append((input[0], input[1]))
}

func dfs(_ x: Int, _ y: Int) -> Int {
    var stack: [(Int, Int)] = [(x, y)]
    visited[x][y] = true
    var count = 0
    while !stack.isEmpty {
        let current = stack.removeLast()
        count += 1
        for i in 0..<4 {
            let nextX = current.0 + dx[i]
            let nextY = current.1 + dy[i]
            
            if nextX <= 0 || nextX > nmk[0] || nextY <= 0 || nextY > nmk[1] {
                continue
            }
            
            if visited[nextX][nextY] {
                continue
            }
            
            if !map[nextX][nextY] {
                continue
            }
            
            stack.append((nextX, nextY))
            visited[nextX][nextY] = true
        }
    }
    return count
}
var answer = Int.min
for coordi in coordis {
    answer = max(answer, dfs(coordi.0, coordi.1))
}
print(answer)



