import Foundation

struct Edge {
    let start: Int
    let end: Int
    let weight: Int
}

let n = Int(readLine()!)!
var relation: [[Int]] = []
var edgeList: [Edge] = []
var lineSum = 0
var unionArr = Array(0..<n)

func charToNumber(_ char: Character) -> Int {
    if char == "0" { return 0 }
    let asciiValue = Int(char.asciiValue ?? 0)
    if asciiValue >= 97 && asciiValue <= 122 { // a~z: 1~26
        return asciiValue - 96
    } else{ // A~Z: 27~52
        return asciiValue - 64 + 26
    }
}


for i in 0..<n {
    let input = Array(readLine()!).map { charToNumber(Character(String($0))) }.enumerated()
    lineSum += input.map{ $0.element }.reduce(0, +)
    for a in input {
        if i == a.offset { continue }
        if a.element == 0 { continue }
        edgeList.append(Edge(start: i, end: a.offset, weight: a.element))
    }
}

func getParents(num: Int) -> Int {
    if unionArr[num] == num {
        return num
    }
    let parents = getParents(num: unionArr[num])
    unionArr[num] = parents
    return parents
}

func union(num1: Int, num2: Int) {
    let num1Parent = getParents(num: num1)
    let num2Parent = getParents(num: num2)
    
    
    if num1Parent > num2Parent {
        unionArr[num1Parent] = num2Parent
    } else if num1Parent < num2Parent {
        unionArr[num2Parent] = num1Parent
    }
}

let sortedEdgeList = edgeList.sorted { $0.weight < $1.weight }
var line = 0
var answer = 0

for idx in 0..<sortedEdgeList.count {
    if line == n-1 { break }
    let edge = sortedEdgeList[idx]
    let startParent = getParents(num: edge.start)
    let endParent = getParents(num: edge.end)
    
    if startParent != endParent {
        union(num1: edge.start, num2: edge.end)
        answer += edge.weight
        line += 1
    }
}

var parentSet: Set<Int> = []

for i in 0..<n {
    parentSet.insert(getParents(num: i))
}

if parentSet.count == 1 {
    print(lineSum-answer)
} else {
    print(-1)
}
