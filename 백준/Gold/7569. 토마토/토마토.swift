import Foundation

enum TomatoState: Int {
    case empty = -1
    case notRipe = 0
    case ripe = 1
}

struct Coordinate: Equatable {
    let i: Int
    let j: Int
    let z: Int
    let days: Int
}

struct Queue<T: Equatable> {
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

let mnh = readLine()!.split(separator: " ").map{Int($0)!}
var map: [[[TomatoState]]] = Array(repeating: [], count: mnh[2])
// i, j , z
var initTomatoCoordi: [Coordinate] = []
for z in 0..<mnh[2] {
    for i in 0..<mnh[1] {
        let input = readLine()!.split(separator: " ").map { TomatoState(rawValue: Int($0)!)! }
        input.enumerated().forEach { element in
            if element.element == .ripe {
                initTomatoCoordi.append(Coordinate(i: i,j: element.offset,z: z, days: 0))
            }
        }
        map[z].append(input)
    }
}

let dx = [0,1,0,-1,0,0]
let dy = [1,0,-1,0,0,0]
let dz = [0,0,0,0,1,-1]

var days = Int.min
var queue = Queue(arr: initTomatoCoordi)

while !queue.isEmpty {
    let pop = queue.pop()
    days = max(days, pop.days)
    for i in 0..<6 {
        let nextI = pop.i + dy[i]
        let nextJ = pop.j + dx[i]
        let nextZ = pop.z + dz[i]
        
        if nextI < 0 || nextI >= mnh[1] || nextJ < 0 || nextJ >= mnh[0] || nextZ < 0 || nextZ >= mnh[2] {
            continue
        }
        
        if map[nextZ][nextI][nextJ] != .notRipe {
            continue
        }
        map[nextZ][nextI][nextJ] = .ripe
        queue.append(.init(i: nextI, j: nextJ, z: nextZ, days: pop.days+1))
    }
}
print(map.flatMap { $0.flatMap {$0} }.contains(.notRipe) ? -1 : days)
