import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}

let mov = [(0, 1), (0, 2), (1, 0), (1,2), (2,0),(2,1)]

func solution() {
    var queue: [[Int]] = [[0,0, input[2]]]
    var visited: [[Int]] = []
    var answer: Set<Int> = []
    
    var idx = 0
    while idx < queue.count {
        let pop = queue[idx]
        if pop[0] == 0 {
            answer.insert(pop[2])
        }
        for i in mov {
            var moveBottles = pop
            let from = i.0
            let to = i.1
            if (moveBottles[to] == input[to] || moveBottles[from] == 0) {
                continue
            }
            let moveTo = min(moveBottles[from] + moveBottles[to], input[to])
            let moveFrom = max(moveBottles[from] - (input[to]-moveBottles[to]), 0)
            moveBottles[to] = moveTo
            moveBottles[from] = moveFrom
            
            if visited.contains(moveBottles) {
                continue
            } else {
                visited.append(moveBottles)
                queue.append(moveBottles)
            }
        }
        idx += 1
    }
    print(answer.sorted().map{String($0)}.joined(separator: " "))
}

solution()
