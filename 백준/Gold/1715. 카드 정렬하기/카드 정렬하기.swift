struct PriorityQueue {
    var heap = [0]
    var count: Int  {
        return heap.count
    }
    
    mutating func insert(element: Int) {
        heap.append(element)

        var currentIndex = heap.count - 1
        var parentsIndex = currentIndex / 2
        
        while canSwap() {
            heap.swapAt(currentIndex, parentsIndex)
            currentIndex = parentsIndex
            parentsIndex = currentIndex / 2
        }
        
        func canSwap() -> Bool {
            guard currentIndex > 1 else { return false }
            
            return heap[currentIndex] < heap[parentsIndex] ? true : false
        }
    }

    mutating func pop() -> Int? {
        heap.swapAt(1, heap.count - 1)
        let out = heap.removeLast()
        
        var parentsIndex = 1
        var leftIndex = parentsIndex * 2
        var rightIndex = leftIndex + 1
        var childIndex = 0
        
        while parentsIndex < heap.count {
            
            // 왼쪽노드만 있을 경우
            if rightIndex >= heap.count && leftIndex < heap.count {
                childIndex = leftIndex
            }
            // 둘 다 없을 경우
            else if rightIndex >= heap.count && leftIndex >= heap.count {
                return out
            }
            // 둘 다 있을 경우
            else if rightIndex < heap.count && leftIndex < heap.count {
                childIndex = heap[leftIndex] > heap[rightIndex] ? rightIndex : leftIndex
            }
            
            if heap[childIndex] < heap[parentsIndex] {
                heap.swapAt(childIndex, parentsIndex)
                
                parentsIndex = childIndex
                leftIndex = parentsIndex * 2
                rightIndex = leftIndex + 1
            } else {
                return out
            }
        }

        return out
    }
}

let n = Int(readLine()!)!
var priorityQueue: PriorityQueue = .init()
var answer = 0

for _ in 0..<n {
    let input = Int(readLine()!)!
    priorityQueue.insert(element: input)
}

while priorityQueue.count > 2 {
    let firstMin = priorityQueue.pop()!
    let secondMin = priorityQueue.pop()!

    answer += firstMin + secondMin
    priorityQueue.insert(element: (firstMin+secondMin))
}


print(answer)