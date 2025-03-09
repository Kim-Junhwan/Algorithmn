import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
var map: [[Bool]] = []
for _ in 0..<nm[0] {
    let input = Array(readLine()!).map { $0 == "1" }
    map.append(input)
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0])

let dx = [1,0,-1,0]
let dy = [0,1,0,-1]

func solution(){
    var queue: [(Int, Int, Int)] = [(0,0,1)]
    
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        if pop.0 == nm[1]-1 && pop.1 == nm[0]-1 {
            print(pop.2)
            return
        }
        for i in 0..<4 {
            let nextX = pop.0 + dx[i]
            let nextY = pop.1 + dy[i]
            if nextX < 0 || nextX >= nm[1] || nextY < 0 || nextY >= nm[0] || visited[nextY][nextX] || !map[nextY][nextX]{
                continue
            }
            visited[nextY][nextX] = true
            queue.append((nextX, nextY, pop.2+1))
        }
    }
}
solution()
