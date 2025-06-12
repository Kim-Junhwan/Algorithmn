import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var graph: [[Bool]] = []

struct Island {
    let num: Int
    let coordi: [(Int, Int)]
}

struct Edge: Hashable {
    let start: Int
    let end: Int
    let weight: Int
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! == 1 }
    graph.append(input)
}

func solution() {
    let islandList = findIslands()
    var unionArr = Array(0..<islandList.count)
    
    func getParents(num: Int) -> Int {
        if unionArr[num] == num {
            return num
        }
        let parents = getParents(num: unionArr[num])
        unionArr[num] = parents
        return parents
    }

    func union(num1: Int, num2: Int) {
        let num1Parent = getParents(num: num1)
        let num2Parent = getParents(num: num2)
        
        
        if num1Parent > num2Parent {
            unionArr[num1Parent] = num2Parent
        } else if num1Parent < num2Parent {
            unionArr[num2Parent] = num1Parent
        }
    }
    
    var isLandGraph = Array(repeating: Array(repeating: 0, count: m), count: n)
    var isLandMinWeightArr: [[Int]] = Array(repeating: Array(repeating: Int.max, count: islandList.count), count: islandList.count)
    var edgeList: [Edge] = []
    islandList.forEach { island in
        for coordi in island.coordi {
            isLandGraph[coordi.0][coordi.1] = island.num
        }
    }
    // 섬의 좌표값을 기준으로 한 방향으로의 경로 탐색
    
    for island in islandList {
        for i in 0..<4 {
            let currentDirection = (dy[i], dx[i])
            for islandCoordi in island.coordi {
                // y, x, count
                let nextCoordi = (islandCoordi.0, islandCoordi.1, 0)
                var queue: [(Int, Int, Int)] = [nextCoordi]
                
                while !queue.isEmpty {
                    let pop = queue.removeFirst()
                    if  isLandGraph[pop.0][pop.1] != 0 && isLandGraph[pop.0][pop.1] != island.num {
                        if isLandMinWeightArr[island.num-1][isLandGraph[pop.0][pop.1]-1] > pop.2-1 && pop.2-1 >= 2 {
                            isLandMinWeightArr[island.num-1][isLandGraph[pop.0][pop.1]-1] = pop.2-1
                            isLandMinWeightArr[isLandGraph[pop.0][pop.1]-1][island.num-1] = pop.2-1
                        }
                        //edgeSet.insert(Edge(start: island.num, end: isLandGraph[pop.0][pop.1], weight: pop.2-1))
                        break
                    }
                    let next = (pop.0+currentDirection.0, pop.1+currentDirection.1, pop.2+1)
                    
                    if next.0 >= 0, next.0 < n, next.1 >= 0, next.1 < m {
                        if isLandGraph[next.0][next.1] != island.num {
                            queue.append(next)
                        }
                    }
                }
            }
        }
    }
    
    for i in 0..<islandList.count {
        for j in i..<islandList.count {
            if isLandMinWeightArr[i][j] != Int.max {
                edgeList.append(Edge(start: i+1, end: j+1, weight: isLandMinWeightArr[i][j]))
            }
        }
    }
    
    let sortedEdgeList = edgeList.sorted { $0.weight < $1.weight }
    var line = 0
    var answer = 0
    
    for idx in 0..<sortedEdgeList.count {
        if line == islandList.count-1 { break }
           let edge = sortedEdgeList[idx]
           let startParent = getParents(num: edge.start-1)
           let endParent = getParents(num: edge.end-1)
           
           if startParent != endParent {
               union(num1: edge.start-1, num2: edge.end-1)
               answer += edge.weight
               line += 1
           }
       }
    
    var commonParent: Set<Int> = []
    
    for i in 0..<islandList.count {
        commonParent.insert(getParents(num: i))
    }
    
    if commonParent.count == 1 {
        print(answer)
    } else {
        print("-1")
    }
}

func findIslands() -> [Island] {
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    var currentIslandNumber = 1
    var islandDict: [Int: [(Int, Int)]] = [:]
    
    for i in 0..<n {
        for j in 0..<m {
            if visited[i][j] { continue }
            visited[i][j] = true
            
            if graph[i][j] {
                // true인 곳부터 탐색하여 섬의 coordinate 구하기
                var queue: [(Int, Int)] = [(i, j)]
                while !queue.isEmpty {
                    let pop = queue.removeFirst()
                    if islandDict[currentIslandNumber] == nil {
                        islandDict[currentIslandNumber] = []
                    }
                    islandDict[currentIslandNumber]?.append(pop)
                    for k in 0..<4 {
                        let ny = pop.0 + dx[k]
                        let nx = pop.1 + dy[k]
                        
                        if nx < 0 || nx >= m || ny < 0 || ny >= n {
                            continue
                        }
                        
                        if visited[ny][nx] {
                            continue
                        }
                        
                        visited[ny][nx] = true
                        
                        if !graph[ny][nx] {
                            continue
                        }
                        
                        queue.append((ny, nx))
                    }
                }
                currentIslandNumber += 1
            }
        }
    }
    
    return islandDict.map({ key, value in
        Island(num: key, coordi: value)
    })
}



solution()
