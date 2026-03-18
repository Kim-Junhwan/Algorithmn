import Foundation

struct DeQueue<T> {
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
    
    mutating func appendFirst(_ input: T) {
        arr.insert(input, at: startIdx)
        lastIdx += 1
    }
    
    mutating func pop() -> T {
        let pop = arr[startIdx]
        startIdx += 1
        return pop
    }
}

let input = readLine()!.split(separator: " ").map{Int($0)!}
let distSize = max(input[0], input[1]) * 2
var dist = Array(repeating: Int.max, count: distSize)

func solution() {
    // 위치, cost
    
    if input[0] == input[1] {
        print(0)
        return
    }
    
    dist[input[0]] = 0
    var deQueue: DeQueue<(Int, Int)> = DeQueue(arr: [(input[0], 0)])

    while !deQueue.isEmpty {
        let popNum = deQueue.pop()
        
        for i in 0..<3 {
            let nextIdx: Int
            var cost: Int = popNum.1
            
            if i == 0 {
                nextIdx = popNum.0 * 2
            } else if i == 1 {
                nextIdx = popNum.0 - 1
                cost += 1
            } else {
                nextIdx = popNum.0 + 1
                cost += 1
            }
            
            if nextIdx < 0 || nextIdx >= distSize {
                continue
            }
            
            if cost >= dist[nextIdx] {
                continue
            }
            
            dist[nextIdx] = cost
            
            if nextIdx == input[1] {
                print(cost)
                return
            }
            
            if i == 1 || i == 2 {
                deQueue.append((nextIdx, cost))
            } else {
                deQueue.appendFirst((nextIdx, cost))
            }
        }
    }
}

solution()
