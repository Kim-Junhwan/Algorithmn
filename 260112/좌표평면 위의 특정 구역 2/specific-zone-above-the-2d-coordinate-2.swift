import Foundation

let n = Int(readLine()!)!
var points: [(x: Int, y: Int)] = []
for _ in 0..<n {
    let line = readLine()!
    let parts = line.split(separator: " ").map { Int($0)! }
    points.append((x: parts[0], y: parts[1]))
}
var answer = Int.max

for ignoreCoordi in 0..<points.count {
    var maxX: Int = Int.min
    var maxY: Int = Int.min
    var minX: Int = Int.max
    var minY: Int = Int.max

    for i in 0..<points.count {
        if i == ignoreCoordi { continue }
        maxX = max(maxX, points[i].x)
        maxY = max(maxY, points[i].y)
        minX = min(minX, points[i].x)
        minY = min(minY, points[i].y)
    }
    answer = min(answer, (maxX - minX) * (maxY - minY))
}
print(answer)
