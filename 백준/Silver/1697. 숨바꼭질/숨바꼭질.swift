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

struct Node {
    let x: Int
    let count: Int
}

var visited: [Bool] = Array(repeating: false, count: 200_001)
let nk = readLine()!.split(separator: " ").map{Int($0)!}

func solution() {
    var queue: Queue<Node> = .init(arr: [Node(x: nk[0], count: 0)])
    visited[nk[0]] = true
    while !queue.isEmpty {
        let pop = queue.pop()
        
        let forward = pop.x + 1
        let back = pop.x - 1
        let teleport = pop.x * 2
        
        for i in [forward, back, teleport] {
            
            if i < 0 || i > 200_000 {
                continue
            }
            
            if i == nk[1] {
                print(pop.count + 1)
                return
            }
            
            if visited[i] {
                continue
            }
            
            queue.append(Node(x: i, count: pop.count + 1))
            visited[i] = true
        }
    }

}

nk[0] == nk[1] ? print("0") : solution()
