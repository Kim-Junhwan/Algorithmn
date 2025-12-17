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
        
        if pop.x == n-1 && pop.y == n-1 && pop.count == 3 {
            answer += 1
            continue
        } 

        if pop.count == 3 {
            continue
        }

        for nextY in pop.y+1..<n {
            for nextX in pop.x+1..<n {
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