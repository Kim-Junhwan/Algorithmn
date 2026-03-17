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

let k = Int(readLine()!)!
let wh = readLine()!.split(separator: " ").map{Int($0)!}
var map: [[Bool]] = []
for _ in 0..<wh[1] {
    map.append(readLine()!.split(separator: " ").map{Int($0)!}.map{$0 == 0})
}

struct Node {
    let i: Int
    let j: Int
    let remainK: Int
    let count: Int
}

let dx = [0,1,-1,0]
let dy = [1,0,0,-1]

let horseX = [-2, -2, 2,2,-1,-1,1,1]
let horseY = [-1,1,-1,1,-2,2,-2,2]

var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: wh[0]), count: wh[1]), count: k+1)
var queue = Queue<Node>(arr: [.init(i: 0, j: 0, remainK: k, count: 0)])
visited[k][0][0] = true

func solution() {
    if wh[0] == 1 && wh[1] == 1 {
        print(0)
        return
    }

    while !queue.isEmpty {
        let pop = queue.pop()
        
        let remainK = pop.remainK
        let count = pop.count
        
        for i in 0..<4 {
            let nextI = pop.i + dy[i]
            let nextJ = pop.j + dx[i]
            
            if nextI < 0 || nextI >= wh[1] || nextJ < 0 || nextJ >= wh[0] {
                continue
            }
            
            if visited[remainK][nextI][nextJ] || !map[nextI][nextJ] {
                continue
            }
            
            if nextI == wh[1] - 1 && nextJ == wh[0] - 1 {
                print(count+1)
                return
            }
            
            visited[remainK][nextI][nextJ] = true
            queue.append(.init(i: nextI, j: nextJ, remainK: remainK, count: count + 1))
        }
        
        if remainK > 0 {
            for i in 0..<8 {
                let nextI = pop.i + horseY[i]
                let nextJ = pop.j + horseX[i]
                
                if nextI < 0 || nextI >= wh[1] || nextJ < 0 || nextJ >= wh[0] {
                    continue
                }
                
                if visited[remainK-1][nextI][nextJ] || !map[nextI][nextJ] {
                    continue
                }
                
                if nextI == wh[1] - 1 && nextJ == wh[0] - 1 {
                    print(count+1)
                    return
                }
                
                visited[remainK-1][nextI][nextJ] = true
                queue.append(.init(i: nextI, j: nextJ, remainK: remainK-1, count: count + 1))
            }
        }
    }
    print(-1)
}

solution()
