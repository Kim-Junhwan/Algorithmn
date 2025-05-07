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
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var relationArr: [[(Int, Int)]] = Array(repeating: [], count: n+1)
var distanceArr = Array(repeating: 100000000, count: n+1)
var visited = Array(repeating: false, count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    relationArr[input[0]].append((input[1], input[2]))
}

let startEnd = readLine()!.split(separator: " ").map{Int($0)!}
let start = startEnd[0]
let end = startEnd[1]

func daiksstra(start: Int) {
    var queue = PriorityQueue()
    queue.insert(element: City(num: start, count: 0))
    distanceArr[start] = 0
    
    while !queue.isEmpty {
        let pop = queue.pop()!
        
        if visited[pop.num] {
            continue
        }
        visited[pop.num] = true
        
        for nextCity in relationArr[pop.num] {
            
            if (distanceArr[nextCity.0] > distanceArr[pop.num] + nextCity.1) {
                distanceArr[nextCity.0] = distanceArr[pop.num] + nextCity.1
                queue.insert(element: City(num: nextCity.0, count: distanceArr[nextCity.0]))
            }
        }
    }
    print(distanceArr[end])
}

daiksstra(start: start)
