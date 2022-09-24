import Foundation

let chessSize = Int(readLine()!)!
let coordinators = readLine()!.split(separator: " ").map { Int($0)! }
var currentCoordinator = (coordinators[0],coordinators[1],0)
let destinationCoordinator = (coordinators[2],coordinators[3])
var visitedCoordinator = [(coordinators[0],coordinators[1])]
let circulateCoordinatorArr = [(-2, -1), (-2, 1), (0, -2), (0, 2), (2, -1), (2, 1)]
var deathNightCoordinator = [currentCoordinator]
func bfs() {
    while !deathNightCoordinator.isEmpty {
        let knight = deathNightCoordinator.removeFirst()
        for item in circulateCoordinatorArr {
            let moveCoordinator = (knight.0+item.0, knight.1+item.1, knight.2+1)
            if (moveCoordinator.0<0)||(moveCoordinator.1<0)||(moveCoordinator.0>chessSize)||(moveCoordinator.1>chessSize)||containsTuple((knight.0+item.0, knight.1+item.1)) {
                continue
            }
            
            if (moveCoordinator.0 == destinationCoordinator.0) && (moveCoordinator.1 == destinationCoordinator.1) {
                print(moveCoordinator.2)
                return
            }
            deathNightCoordinator.append(moveCoordinator)
            visitedCoordinator.append((knight.0+item.0, knight.1+item.1))
        }
    }
    print(-1)
}

func containsTuple(_ tuple:(Int,Int)) -> Bool {
    let (x, y) = tuple
    for (i, j) in visitedCoordinator {
        if i == x && j == y {
            return true
        }
    }
    return false
}

bfs()