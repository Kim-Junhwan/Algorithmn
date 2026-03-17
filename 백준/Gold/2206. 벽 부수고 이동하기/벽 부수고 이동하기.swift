import Foundation

import Foundation

struct Queue<T> {
    private var startIdx = 0
    private var lastIdx = -1
    
    private var arr: [T] = []
    
    init(arr: [T]) {
        arr.forEach { append($0) }
    }
    
    var isEmpty: Bool {
        return startIdx > lastIdx
    }
    
    mutating func append(_ input: T) {
        arr.append(input)
        lastIdx += 1
    }
    
    mutating func pop() -> T {
        let pop = arr[startIdx]
        startIdx += 1
        return pop
    }
}

let nm = readLine()!.split(separator: " ").map{Int($0)!}
var map: [[Bool]] = []
for _ in 0..<nm[0] {
    map.append(Array(readLine()!).map{$0 == "0"})
}

struct Node {
    let i: Int
    let j: Int
    let canCrash: Bool
    let dist: Int
}

let dx = [0,1,-1,0]
let dy = [1,0,0,-1]
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0]), count: 2)
var queue = Queue<Node>(arr: [.init(i: 0, j: 0, canCrash: true, dist: 1)])
visited[0][0][0] = true
visited[1][0][0] = true

func solution() {
    if nm[0] == 1 && nm[1] == 1 {
        print(1)
        return
    }

    while !queue.isEmpty {
        let pop = queue.pop()
        
        for i in 0..<4 {
            let nextI = pop.i + dy[i]
            let nextJ = pop.j + dx[i]
            let canCrash = pop.canCrash
            let dist = pop.dist
            
            if nextI < 0 || nextI >= nm[0] || nextJ < 0 || nextJ >= nm[1] {
                continue
            }
            
            if visited[canCrash ? 0 : 1][nextI][nextJ] {
                continue
            }
            
            if nextI == nm[0] - 1 && nextJ == nm[1] - 1 {
                print(dist+1)
                return
            }
            
            // 방문한 곳이 벽인 경우
            if !map[nextI][nextJ] {
                // 벽 부술 수 있다면 큐에 추가 + 방문 처리
                if canCrash {
                    visited[0][nextI][nextJ] = true
                    queue.append(.init(i: nextI, j: nextJ, canCrash: false, dist: dist + 1))
                }
                // 벽 부술 수 없다면 패스
            } else {
                // 방문한 곳이 벽이 아닌 경우
                // 방문 처리 + 기존 pop 객체에 거리만 업데이트 해서 큐에 추가
                visited[canCrash ? 0 : 1][nextI][nextJ] = true
                queue.append(.init(i: nextI, j: nextJ, canCrash: canCrash, dist: dist + 1))
            }
        }
    }
    print(-1)
}

solution()
