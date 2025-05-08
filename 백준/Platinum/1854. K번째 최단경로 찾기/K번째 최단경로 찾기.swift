import Foundation

public struct Heap<T> {
    
    private var nodes = [T]()
    
    private var orderCriteria: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public func peek() -> T? {
        return nodes.first
    }
    
    func isEmpty() -> Bool {
        return nodes.isEmpty
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let lastIndex = nodes.count-1
        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }
        
        return nodes.removeLast()
    }
    
    private mutating func configureHeap(from array: [T]) {
           nodes = array
           
           for i in stride(from: nodes.count/2 - 1, through: 0, by: -1) {
               shiftDown(i)
           }
       }
    
    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex] // 처음에 노드를 저장해두고 인덱스를 구한 후 바꿔준다.
        var parentIndex = self.parentIndex(ofIndex: index)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
    
}

struct Node {
    let vertex: Int
    let value: Int
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (input[0], input[1], input[2])

// 인접 행렬 만들기
var graph = Array(repeating: Array(repeating: Int.max, count: n+1), count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[0]][input[1]] = input[2]
}

// 다익스트라
var distance = Array(repeating: Heap<Int>(sort: > ), count: n+1)
var pq = Heap<Node>(sort: { $0.value < $1.value })
pq.insert(Node(vertex: 1, value: 0))
distance[1].insert(0)

while !pq.isEmpty() {
    let now = pq.remove()!
    for i in 1...n {
        if graph[now.vertex][i] != Int.max { // 경로가 존재하면
            if distance[i].count < k {
                distance[i].insert(now.value + graph[now.vertex][i])
                pq.insert(Node(vertex: i, value: now.value + graph[now.vertex][i]))
            } else if distance[i].peek()! > now.value + graph[now.vertex][i] {
                distance[i].remove()!
                distance[i].insert(now.value + graph[now.vertex][i])
                pq.insert(Node(vertex: i, value: now.value + graph[now.vertex][i]))
            }
        }
    }
}

for i in 1...n {
    if distance[i].count == k {
        print(distance[i].peek()!)
    } else {
        print("-1")
    }
}