import Foundation

struct Heap<T> {
    private var arr: [T]
    let comparable: (T, T) -> Bool
    
    var isEmpty: Bool {
        return arr.isEmpty
    }
    
    init(arr: [T], comparable: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.comparable = comparable
    }
    
    mutating func insert(t: T) {
        arr.append(t)
        siftUp(index: arr.count-1)
    }
    
    mutating func pop() -> T {
        let returnValue = arr.first!
        if arr.count == 1 {
                arr.removeLast()
                return returnValue
            }
        arr[0] = arr.removeLast()
        
        siftDown(index: 0)
        
        return returnValue
    }
    
    private func getParentNode(index: Int) -> Int {
        return max((index-1)/2, 0)
    }
    
    private mutating func siftUp(index: Int) {
        var currentNode = index
        while comparable(arr[currentNode], arr[getParentNode(index: currentNode)]) {
            arr.swapAt(currentNode, getParentNode(index: currentNode))
            currentNode = getParentNode(index: currentNode)
            if currentNode == 0 {
                return
            }
        }
    }
    
    private mutating func siftDown(index: Int) {
        var currentNode = index
        while true {
            let leftNode = 2 * currentNode + 1
            let rightNode = 2 * currentNode + 2

            let hasLeft = leftNode < arr.count
            let hasRight = rightNode < arr.count

            guard hasLeft else { return }  // 왼쪽도 없으면 리프 노드

            // 오른쪽 없으면 왼쪽하고만 비교
            if !hasRight {
                if comparable(arr[leftNode], arr[currentNode]) {
                    arr.swapAt(currentNode, leftNode)
                }
                return
            }

            // 양쪽 다 있는 경우: 더 우선순위 높은 쪽과 스왑
            let dominantChild = comparable(arr[leftNode], arr[rightNode]) ? leftNode : rightNode
            if comparable(arr[dominantChild], arr[currentNode]) {
                arr.swapAt(currentNode, dominantChild)
                currentNode = dominantChild
            } else {
                return
            }
        }
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
// (도착도시 , 비용)
var relation: [[Int:Int]] = Array(repeating: [:], count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    if relation[input[0]][input[1]] == nil {
        relation[input[0]][input[1]] = input[2]
    } else if let dist = relation[input[0]][input[1]], dist > input[2] {
            relation[input[0]][input[1]] = input[2]
    }
}
let ab = readLine()!.split(separator: " ").map{Int($0)!}

var dist: [Int] = Array(repeating: Int.max, count: n+1)
var heap: Heap<(Int, Int)> = Heap(arr: [], comparable: { $0.1 > $1.1 })

func daikstra(start: Int) {
    for i in relation[start] {
        dist[i.0] = i.1
        heap.insert(t: (i.key, i.value))
    }
    dist[start] = 0
    
    while !heap.isEmpty {
        let current = heap.pop()
        let currentDistance = current.1
        let currentNode = current.0
        
        if currentDistance > dist[currentNode] { continue }
        
        for next in relation[currentNode] {
            if currentDistance + next.1 < dist[next.0] {
                dist[next.0] = currentDistance + next.1
                heap.insert(t: (next.0, currentDistance + next.1))
            }
        }
    }
}
daikstra(start: ab[0])

print(dist[ab[1]])
