import Foundation

let n = Int(readLine()!)!
var grid = [[Int]]()

for _ in 0..<n {
    grid.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]
var answer = 0

for i in 0..<n {
    for j in 0..<n {
        var oneCount = 0
        for z in 0..<4 {
            let nextX = j+dx[z]
            let nextY = i+dy[z]

            if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n {
                continue
            }

            if grid[nextY][nextX] != 1 {
                continue
            }
            oneCount += 1
        }

        if oneCount >= 3 {
            answer += 1
        }
    }
}

print(answer)