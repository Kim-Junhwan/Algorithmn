import Foundation

let n = Int(readLine()!)!
var points = [(Int, Int)]()
for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    points.append((xy[0], xy[1]))
}
var answer = Int.max
for i in 0..<points.count {
    for j in 0..<points.count {
        if i == j {continue}
        let x1 = points[i].0
        let y1 = points[i].1
        let x2 = points[j].0
        let y2 = points[j].1
        answer = min(answer, (x1-x2) * (x1-x2) + (y1-y2) * (y1-y2))
    }
}
print(answer)