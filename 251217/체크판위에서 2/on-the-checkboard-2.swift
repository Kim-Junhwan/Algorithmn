import Foundation

let firstLine = readLine()!
let inputs = firstLine.split(separator: " ").map { Int(String($0))! }
let n = inputs[0]
let m = inputs[1]
var grid = [[Bool]]()

struct Node {
    var count: Int
    var x: Int
    var y: Int

    init(_ x: Int, _ y: Int, _ count: Int) {
        self.x = x
        self.y = y
        self.count = count
    }
}

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { String($0) == "W" }
    grid.append(row)
}

func solution() {
    var answer = 0
    var queue: [Node] = [Node(0,0,0)]

    while !queue.isEmpty {
        let pop = queue.removeLast()
        
        if pop.x == m-1 && pop.y == n-1 {
            if pop.count == 3 {
                answer += 1
            }
            continue
        } 

        if pop.count == 3 {
            continue
        }

        let startY = pop.y+1
        let startX = pop.x+1

        if startX >= m || startY >= n {
            continue
        }

        for nextY in startY..<n {
            for nextX in startX..<m {
                if grid[pop.y][pop.x] == grid[nextY][nextX] {
                    continue
                }
                queue.append(Node(nextX, nextY, pop.count+1))
            }
        }
    }

    print(answer)
}

solution()