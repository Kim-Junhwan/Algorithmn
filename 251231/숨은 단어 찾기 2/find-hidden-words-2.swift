import Foundation

let firstLine = readLine()!
let firstParts = firstLine.split(separator: " ").map { Int($0)! }
let n = firstParts[0]
let m = firstParts[1]
var grid = [[String]]()
for _ in 0..<n {
    grid.append(Array(readLine()!.map{ String($0) }))
}

func checkIsLee(x: Int, y: Int) -> Int {
    var leeCount = 0
    let dx = [0,1,-1,0,1,1,-1,-1]
    let dy = [1,0,0,-1,1,-1,1,-1]

    for i in 0..<8 {
        let maxX = x+(dx[i]*2)
        let maxY = y+(dy[i]*2)

        if maxX < 0 || maxX >= m || maxY < 0 || maxY >= n{
            continue
        } 

        if grid[y][x] == "L" && grid[y+dy[i]][x+dx[i]] == "E" && grid[y+(dy[i]*2)][x+(dx[i]*2)] == "E" {
            leeCount += 1
        }
    }

    return leeCount
}

var answer = 0

 for i in 0..<n {
    for j in 0..<m {
        answer += checkIsLee(x: j, y: i)
    }
 }

 print(answer)