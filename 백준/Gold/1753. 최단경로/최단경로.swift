import Foundation

struct City: Comparable {
    static func < (lhs: City, rhs: City) -> Bool {
        return lhs.count < rhs.count
    }
    
    let num: Int
    let count: Int
}

struct PriorityQueue {
    var heap: Array<City> = [City(num: 0, count: 0)]
    var count: Int  {
        return heap.count
    }
    
    var isEmpty: Bool {
        return heap.count <= 1
    }
    
    mutating func insert(element: City) {
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

    mutating func pop() -> City? {
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
    
    mutating func upsert() {
        
    }
}


let ve = readLine()!.split(separator: " ").map{ Int($0)! }
let k = Int(readLine()!)!

var weightArr: [[(Int, Int)]] = Array(repeating: [], count: ve[0]+1)

for _ in 0..<ve[1] {
    let uvw = readLine()!.split(separator: " ").map{ Int($0)! }
    weightArr[uvw[0]].append((uvw[1], uvw[2]))
}

var visited: [Bool] = Array(repeating: false, count: ve[0]+1)
var minDistanceArr: [Int] = Array(repeating: 10000000, count: ve[0]+1)
var queue: PriorityQueue = PriorityQueue()

func getSmallIndex() -> Int {
    var min = 10000000
    var index: Int = 0
    for i in 1...ve[0] {
        if visited[i] {
            continue
        }
        if minDistanceArr[i] < min && !visited[i] {
            min = minDistanceArr[i]
            index = i
        }
    }
    return index
}

func dijkstra(start: Int) {
    queue.insert(element: City(num: start, count: 0))
    minDistanceArr[start] = 0
    while !queue.isEmpty {
        let pop = queue.pop()
        if visited[pop!.num] {
            continue
        }
        visited[pop!.num] = true
        for j in weightArr[pop!.num] {
            if (minDistanceArr[j.0] > minDistanceArr[pop!.num]+j.1) {
                minDistanceArr[j.0] = minDistanceArr[pop!.num]+j.1
                queue.insert(element: City(num: j.0, count: minDistanceArr[j.0]))
            }
        }
    }
    for i in 1...ve[0] {
        if (visited[i]) {
            print(minDistanceArr[i])
        } else {
            print("INF")
        }
    }
}

dijkstra(start: k)
