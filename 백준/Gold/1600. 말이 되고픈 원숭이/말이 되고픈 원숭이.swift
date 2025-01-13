import Foundation

let k = Int(readLine()!)!
let wh = readLine()!.split(separator: " ").map{ Int($0)! }
var map: [[Bool]] = []
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: wh[0]), count: wh[1]), count: 31)
for _ in 0..<wh[1] {
    let input = readLine()!.split(separator: " ").map{ Int($0)==0 }
    map.append(input)
}

let mx = [0,1,0,-1]
let my = [-1,0,1,0]

let hx = [1,2,2,1,-1,-2,-2,-1]
let hy = [-2,-1,1,2,-2,-1,1,2]

struct Monkey {
    let count: Int
    let canJumpCount: Int
    let x: Int
    let y: Int
}

func validateCoordi(x: Int, y: Int, jumpCount: Int) -> Bool {
    if x < 0 || x >= wh[0] || y < 0 || y >= wh[1] {
        return false
    }
    return !visited[jumpCount][y][x] && map[y][x]
}

func solution() {
    var queue: [Monkey] = [.init(count: 0, canJumpCount: k, x: 0, y: 0)]
    var idx = 0
    while queue.count > idx {
        let popM = queue[idx]
        idx += 1
        if popM.x == wh[0]-1 && popM.y == wh[1]-1 {
            print(popM.count)
            return
        }
        for i in 0..<mx.count {
            let nextX = popM.x+mx[i]
            let nextY = popM.y+my[i]
            if validateCoordi(x: nextX, y: nextY, jumpCount: popM.canJumpCount) {
                queue.append(.init(count: popM.count+1, canJumpCount: popM.canJumpCount, x: nextX, y: nextY))
                visited[popM.canJumpCount][nextY][nextX] = true
            }
        }
        if popM.canJumpCount > 0 {
            for i in 0..<hx.count {
                let nextX = popM.x+hx[i]
                let nextY = popM.y+hy[i]
                if validateCoordi(x: nextX, y: nextY, jumpCount: popM.canJumpCount-1) {
                    queue.append(.init(count: popM.count+1, canJumpCount: popM.canJumpCount-1, x: nextX, y: nextY))
                    visited[popM.canJumpCount-1][nextY][nextX] = true
                }
            }
        }
        
    }
    print("-1")
}

solution()
