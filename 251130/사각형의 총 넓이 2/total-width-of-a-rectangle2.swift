import Foundation

let n = Int(readLine()!)!
var x1: [Int] = []
var y1: [Int] = []
var x2: [Int] = []
var y2: [Int] = []
var minX = Int.max
var minY = Int.max
var map: [[Bool]] = Array(repeating: Array(repeating: false, count: 200), count: 200)

for _ in 0..<n {
    let parts = readLine()!.split(separator: " ").map { Int(String($0))! }
    x1.append(parts[0])
    y1.append(parts[1])
    x2.append(parts[2])
    y2.append(parts[3])
    minX = min(minX, parts[0])
    minY = min(minY, parts[1])
}

for i in 0..<n {
    for y in abs(minY - y1[i]) ..< abs(minY - y2[i]) {
        for x in abs(minX - x1[i]) ..< abs(minX - x2[i]) {
            map[y][x] = true
        }
    }
}


print(map.flatMap{ $0 }.filter{ $0 }.count)