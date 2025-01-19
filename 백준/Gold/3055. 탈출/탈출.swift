import Foundation

enum Block {
    case empty
    case water
    case rock
    case biber
    case hog
}

let rc = readLine()!.split(separator: " ").map{ Int($0)! }
var map: [[[Block]]] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: rc[1]), count: rc[0])
let nx = [0,1,0,-1]
let ny = [-1,0,1,0]
var hogLocation = (0,0)
var biberLocation = (0,0)

var mapArr: [[Block]] = []
for i in 0..<rc[0] {
    let input = Array(readLine()!).map{String($0)}.enumerated().map { value -> Block in
        let str = value.element
        if str == "." {
            return .empty
        } else if str == "*" {
            return .water
        } else if str == "X" {
            return .rock
        } else if str == "D" {
            biberLocation = (value.offset, i)
            return .biber
        } else {
            hogLocation = (value.offset, i)
            return .hog
        }
    }
    mapArr.append(input)
}
map.append(mapArr)

struct Coordi: Hashable {
    let x: Int
    let y: Int
}

struct Hog {
    let x: Int
    let y: Int
    let count: Int
}

func waterIncrease() {
    var latestMap = map.last!
    var appendCoordi: Set<Coordi> = []
    for i in 0..<latestMap.count {
        for j in 0..<latestMap[i].count {
            if map[map.count-1][i][j] == .water {
                for num in 0..<4 {
                    let nextX = j+nx[num]
                    let nextY = i+ny[num]
                    if nextX < 0 || nextX >= rc[1] || nextY < 0 || nextY >= rc[0] || map[map.count-1][nextY][nextX] == .rock || map[map.count-1][nextY][nextX] == .biber{
                        continue
                    }
                    appendCoordi.insert(.init(x: nextX, y: nextY))
                }
            }
        }
    }
    for i in appendCoordi {
        latestMap[i.y][i.x] = .water
    }
    map.append(latestMap)
}

func solution() {
    var maxCount = 0
    var queue: [Hog] = [.init(x: hogLocation.0, y: hogLocation.1, count: 0)]
    var idx = 0
    while queue.count > idx {
        let pop = queue[idx]
        idx += 1
        if pop.x == biberLocation.0 && pop.y == biberLocation.1 {
            print(pop.count)
            return
        }
        for i in 0..<4 {
            let nextX = pop.x+nx[i]
            let nextY = pop.y+ny[i]
            if maxCount == pop.count {
                waterIncrease()
                maxCount += 1
            }
            let currentMap = map[pop.count+1]
            if nextX < 0 || nextX >= rc[1] || nextY < 0 || nextY >= rc[0] || currentMap[nextY][nextX] == .rock || currentMap[nextY][nextX] == .water{
                continue
            }
            if visited[nextY][nextX] {
                continue
            }
            queue.append(.init(x: nextX, y: nextY, count: pop.count+1))
            visited[nextY][nextX] = true
        }
    }
    print("KAKTUS")
}

solution()
