import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
var map: [[Bool]] = []
let nx = [0,1,0,-1]
let ny = [-1,0,1,0]
// 0은 true, 1은 false
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0]), count: 2)
for _ in 0..<nm[0] {
    let input = Array(readLine()!).map{ String($0) }
    map.append(input.map{ Int($0)! == 0 })
}

struct User {
    let canBreakBlock: Bool
    let count: Int
    let x: Int
    let y: Int
}

func validate(x: Int, y: Int, canBreakBlock: Bool) -> Bool {
    if x < 0 || x >= nm[1] || y < 0 || y >= nm[0] {
        return false
    }
    if canBreakBlock {
        return !visited[0][y][x] && map[y][x]
    } else {
        return !visited[1][y][x] && map[y][x]
    }
    
}

func checkUnvalidateIsBlock(x: Int, y: Int, canBreakBlock: Bool) -> Bool {
    if x < 0 || x >= nm[1] || y < 0 || y >= nm[0] {
        return false
    }
    if visited[canBreakBlock ? 0 : 1][y][x] {
        return false
    }
    return !map[y][x]
}

func solution() {
    var queue: [User] = [.init(canBreakBlock: true, count: 1, x: 0, y: 0)]
    visited[0][0][0] = true
    visited[1][0][0] = true
    var idx = 0
    while queue.count > idx {
        let popUser = queue[idx]
        idx += 1
        if popUser.x == nm[1]-1 && popUser.y == nm[0]-1 {
            print(popUser.count)
            return
        }
        for i in 0..<4 {
            let nextX = popUser.x+nx[i]
            let nextY = popUser.y+ny[i]
            if validate(x: nextX, y: nextY, canBreakBlock: popUser.canBreakBlock) {
                queue.append(.init(canBreakBlock: popUser.canBreakBlock, count: popUser.count+1, x: nextX, y: nextY))
                visited[popUser.canBreakBlock ? 0 : 1][nextY][nextX] = true
            } else {
                if popUser.canBreakBlock {
                    if checkUnvalidateIsBlock(x: nextX, y: nextY, canBreakBlock: popUser.canBreakBlock) {
                        queue.append(.init(canBreakBlock: false, count: popUser.count+1, x: nextX, y: nextY))
                    }
                }
                
            }
        }
    }
    print("-1")
    return
}

solution()
