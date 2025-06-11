import Foundation

final class FileIO {
    private var buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var num = 0
        var isNegative = false
        var byte = read()
        while byte == 10 || byte == 32 { byte = read() }
        if byte == 45 { isNegative = true; byte = read() }
        while byte >= 48, byte <= 57 {
            num = num * 10 + Int(byte - 48)
            byte = read()
        }
        return num * (isNegative ? -1 : 1)
    }
}

struct Edge {
    var start: Int
    var end: Int
    var weight: Int
    var isPass: Bool = false
}

let file = FileIO()
let v = file.readInt()
let e = file.readInt()
var edgeList: [Edge] = []
var unionArr = Array(0..<v)

for _ in 0..<e {
    edgeList.append(Edge(start: file.readInt()-1, end: file.readInt()-1, weight: file.readInt()))
}

func solution() {
    var answer = 0
    var sortedEdgeList = edgeList.sorted { $0.weight < $1.weight }
    var line = 0
    for idx in 0..<sortedEdgeList.count {
        if line == v-1 { break }
        let edge = sortedEdgeList[idx]
        let startParent = getParents(num: edge.start)
        let endParent = getParents(num: edge.end)
        
        if startParent != endParent {
            union(num1: edge.start, num2: edge.end)
            answer += edge.weight
            line += 1
        }
    }
    
    print(answer)
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

solution()
