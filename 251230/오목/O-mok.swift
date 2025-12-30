import Foundation

var board = [[Int]]()
for _ in 0..<19 {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(row)
}

let dx = [1,-1,0,0, 1, 1]
let dy = [0,0,1,-1, 1, -1]

func isFive(x: Int, y: Int) -> (Int, Int)? {
    let stone = board[y][x]
    for i in 0..<dx.count {
        let moveX = dx[i]
        let moveY = dy[i]
        var currentDirection = (x, y)
        var count = 0
        for _ in 0..<5 {

            if x+(moveX * 5) > board[0].count || y+(moveY * 5) > board.count {
                break
            }

            if board[currentDirection.1][currentDirection.0] != stone {
                break
            }

            currentDirection = (currentDirection.0+dx[i], currentDirection.1+dy[i])
            count += 1
        }

        if count >= 5 {
            return (x+1+(moveX*2), y+1+(moveY*2))
        }
    }
    return nil
}

func solution() {
for i in 0..<board.count {
    for j in 0..<board[0].count {
        if board[i][j] != 0 {
            let isFive = isFive(x: j, y: i)
            if isFive != nil {
                print(board[i][j])
                print("\(isFive!.1) \(isFive!.0)")
                return
            }
        } 
    }
}
    print(0)
}

solution()