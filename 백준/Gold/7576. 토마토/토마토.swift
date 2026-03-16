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

enum TomatoState: Int {
    case empty = -1
    case notCook
    case cook
}

struct TomatoNode {
    let i: Int
    let j: Int
    let count: Int
}

let mn = readLine()!.split(separator: " ").map{Int($0)!}
var tomatoInit: [TomatoNode] = []
var map: [[TomatoState]] = []
for i in 0..<mn[1] {
    let input = readLine()!.split(separator: " ").map{Int($0)!}.map{TomatoState(rawValue: $0)!}
    input.enumerated().forEach {
        if $0.element == .cook {
            tomatoInit.append(.init(i: i, j: $0.offset, count: 0))
        }
    }
    map.append(input)
}

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

var queue: Queue<TomatoNode> = .init(arr: tomatoInit)
var answer = Int.min
while !queue.isEmpty {
    let pop = queue.pop()
    answer = max(answer, pop.count)
    for i in 0..<4 {
        let nextI = pop.i + dy[i]
        let nextJ = pop.j + dx[i]
        if nextI >= 0, nextI < mn[1], nextJ >= 0, nextJ < mn[0] {
            if map[nextI][nextJ] == .notCook {
                map[nextI][nextJ] = .cook
                queue.append(.init(i: nextI, j: nextJ, count: pop.count + 1))
            }
        }
    }
}

print( map.flatMap{$0}.contains { $0 == .notCook } ? -1 : answer)
